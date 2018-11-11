package online_booking.bl.api;

import online_booking.bl.common.R;
import online_booking.bl.common.Result;
import online_booking.bl.entity.User;
import online_booking.bl.mapper.ActionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/messages")
public class MessageApi {

    @Autowired
    ActionMapper mActionMapper;

    /**
     * 获取消息列表
     * @throws Exception
     */
    @GetMapping("/list")
    Result list(@RequestAttribute("user") User user) throws Exception {
        int identity = user.getIdentity();
        int user_id = user.getId();
        Map<String, Object> req = new HashMap<>();
        req.put("user_id", user_id);
        List<Map<String, Object>> result = null;
        if (identity == 1) {
            result = mActionMapper.userMessages(req);
        } else if (identity == 2) {
            result = mActionMapper.userMessages2(req);
        }
        return R.success(result);
    }
}
