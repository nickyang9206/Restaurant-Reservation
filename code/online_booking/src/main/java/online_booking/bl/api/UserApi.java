package online_booking.bl.api;

import io.jsonwebtoken.Jwts;
import online_booking.bl.common.JwtUtil;
import online_booking.bl.common.R;
import online_booking.bl.common.Result;
import online_booking.bl.entity.User;
import online_booking.bl.mapper.TokenMapper;
import online_booking.bl.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


@RestController
@RequestMapping("/user")
public class UserApi {

    @Autowired
    UserMapper mUserMapper;
    @Autowired
    TokenMapper mTokenMapper;

    @PostMapping("/login")
    Result login(String username, String password) throws Exception {
        Map<String, Object> result = mUserMapper.findByUsername(username);

        if (result == null) throw new Exception("User does not exist.");

        if (!result.get("password").toString().equals(password)) {
            throw new Exception("wrong password.");
        }

        String token = Jwts.builder()
                .signWith(JwtUtil.key)
                .claim("username", result.get("username").toString())
                .claim("id", Integer.parseInt(result.get("id").toString()))
                .claim("identity", Integer.parseInt(result.get("identity").toString()))
                .compact();

        mTokenMapper.del(Integer.parseInt(result.get("id").toString()));

        mTokenMapper.insert(Integer.parseInt(result.get("id").toString()), token);

        result.remove("password");

        result.put("token", token);
        return R.success(result);
    }

    @PostMapping("/register")
    Result register(String username, String password, int identity) throws Exception {
        Map<String, Object> result = mUserMapper.findByUsername(username);

        if (result != null) throw new Exception("Account has been registered.");

        int count = mUserMapper.insert(username, password, identity);
        if (count != 1) throw new Exception("registration failed.");

        return R.success();
    }

//    @GetMapping("/info")
//    Result info(@RequestAttribute("user") User user) throws Exception {
//        return R.success();
//    }
}