package online_booking.bl.api;

import online_booking.bl.common.R;
import online_booking.bl.common.Result;
import online_booking.bl.entity.User;
import online_booking.bl.mapper.ActionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/booking")
public class ActionApi {

    @Autowired
    ActionMapper mActionMapper;

    /**
     * 添加订座【用户】
     * @param user
     * @param restaurant_id
     * @param seat_id
     * @param date
     * @param message
     * @return
     * @throws Exception
     */
    @PostMapping("/add")
    Result bookingSeat(@RequestAttribute("user") User user, int restaurant_id, int seat_id, String date, String message) throws Exception {
        Map<String, Object> req = new HashMap<>();
        req.put("user_id", user.getId());
        req.put("restaurant_id", restaurant_id);
        req.put("seat_id", seat_id);
        req.put("date", date);
        req.put("message", message);
        int count = mActionMapper.bookingSeat(req);
        if (count != 1) throw new Exception("failure.");
        return R.success();
    }

    /**
     * 取消订座【用户】
     * @throws Exception
     */
    @PostMapping("/cancel")
    Result cancelBookingSeat(int booking_id) throws Exception {
        Map<String, Object> req = new HashMap<>();
        req.put("id", booking_id);
        int count = mActionMapper.cancelBookingSeat(req);
        if (count != 1) throw new Exception("failure.");
        return R.success();
    }

    /**
     * 拒绝订座【餐厅】
     * @throws Exception
     */
    @PostMapping("/reject")
    Result rejectBookingSeat(int booking_id) throws Exception {
        Map<String, Object> req = new HashMap<>();
        req.put("id", booking_id);
        int count = mActionMapper.rejectBookingSeat(req);
        if (count != 1) throw new Exception("failure.");
        return R.success();
    }

    /**
     * 确认订座【餐厅】
     * @throws Exception
     */
    @PostMapping("/confirm")
    Result confirmBookingSeat(int booking_id) throws Exception {
        Map<String, Object> req = new HashMap<>();
        req.put("id", booking_id);
        int count = mActionMapper.confirmBookingSeat(req);
        if (count != 1) throw new Exception("failure.");
        return R.success();
    }
}
