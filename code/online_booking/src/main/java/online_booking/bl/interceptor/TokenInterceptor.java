package online_booking.bl.interceptor;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import online_booking.bl.common.JwtUtil;
import online_booking.bl.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class TokenInterceptor implements HandlerInterceptor {
    private static List<String> paths = new ArrayList<>();

    public TokenInterceptor() {
        paths.add("/user/login");
        paths.add("/user/register");
        paths.add("/restaurant/list");
        paths.add("/restaurant/types");
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        if (paths.contains(requestURI)) {
            return true;
        }

        String authorization = request.getHeader("Authorization");
        if (authorization == null) throw new Exception("Please pass in Token");
        String[] authorizations = authorization.split(" ");
        if (authorizations.length != 2) throw new Exception("Please pass in Token");

        String token = authorizations[1];
        Jws<Claims> jws = Jwts.parser().setSigningKey(JwtUtil.key).parseClaimsJws(token);
        String username = jws.getBody().get("username").toString();
        int id = Integer.parseInt(jws.getBody().get("id").toString());
        int identity = Integer.parseInt(jws.getBody().get("identity").toString());
        request.setAttribute("user", new User(id, username, identity));
        return true;
    }
}
