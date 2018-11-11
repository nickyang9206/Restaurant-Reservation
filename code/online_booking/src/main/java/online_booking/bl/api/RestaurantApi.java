package online_booking.bl.api;

import online_booking.bl.common.R;
import online_booking.bl.common.Result;
import online_booking.bl.entity.Dish;
import online_booking.bl.entity.User;
import online_booking.bl.mapper.RestaurantMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/restaurant")
public class RestaurantApi {

    @Autowired
    RestaurantMapper mRestaurantMapper;

    /**
     * 添加餐厅【餐厅】
     *
     * @param user
     * @param name
     * @param type
     * @return
     * @throws Exception
     */
    @PostMapping("/add")
    Result add(@RequestAttribute("user") User user, String name, String type) throws Exception {
        Map<String, Object> req = new HashMap<>();
        req.put("user_id", user.getId());
        req.put("name", name);
        req.put("type", type);
        int count = mRestaurantMapper.add(req);
        if (count != 1) throw new Exception("failure");
        return R.success(req);
    }

    /**
     * 获取餐厅列表【用户】
     *
     * @param name
     * @param type
     * @return
     */
    @GetMapping("/list")
    Result list(String name, String type) {
        Map<String, Object> req = new HashMap<>();
        req.put("name", name);
        req.put("type", type);
        List<Map<String, Object>> restaurants = mRestaurantMapper.list(req);
        restaurants.forEach(it -> {
            int restaurantId = Integer.parseInt(it.get("id").toString());
            List<Map<String, Object>> dishs = mRestaurantMapper.dishsList(restaurantId);
            it.put("dishs", dishs);
        });
        return R.success(restaurants);
    }

    /**
     * 获取餐厅类型列表【用户】
     *
     * @return
     */
    @GetMapping("/types")
    Result types() {
        List<String> types = mRestaurantMapper.types();
        return R.success(types);
    }

    /**
     * 获取自己的餐厅【餐厅】
     *
     * @param user
     * @return
     */
    @GetMapping("/myshow")
    Result myshow(@RequestAttribute("user") User user) {
        Map<String, Object> req = new HashMap<>();
        req.put("user_id", user.getId());
        List<Map<String, Object>> restaurants = mRestaurantMapper.list(req);
        if (restaurants.size() == 0) {
            return R.success();
        }
        Map<String, Object> restaurant = restaurants.get(0);
        int restaurantId = Integer.parseInt(restaurant.get("id").toString());
        List<Map<String, Object>> dishs = mRestaurantMapper.dishsList(restaurantId);
        restaurant.put("dishs", dishs);
        List<Map<String, Object>> seats = mRestaurantMapper.seatList(restaurantId);
//        seats.forEach(seat -> {
//            int seatId = Integer.parseInt(seat.get("id").toString());
//            seat.put("bookingCount", bookingCount);
//        });
        restaurant.put("seats", seats);
        return R.success(restaurant);
    }

    /**
     * 获取单个餐厅的信息【用户】
     *
     * @param restaurant_id
     * @param date
     * @return
     */
    @GetMapping("/show")
    Result show(int restaurant_id, String date) {
        Map<String, Object> req = new HashMap<>();
        req.put("restaurant_id", restaurant_id);
        Map<String, Object> restaurant = mRestaurantMapper.show(req);
        int restaurantId = Integer.parseInt(restaurant.get("id").toString());
        List<Map<String, Object>> dishs = mRestaurantMapper.dishsList(restaurantId);
        restaurant.put("dishs", dishs);
        List<Map<String, Object>> seats = mRestaurantMapper.seatList(restaurantId);
        seats.forEach(seat -> {
            int seatId = Integer.parseInt(seat.get("id").toString());
            req.put("seat_id", seatId);
            req.put("date", date);
            int bookingCount = mRestaurantMapper.bookingCount(req);
            seat.put("bookingCount", bookingCount);
        });
        restaurant.put("seats", seats);
        return R.success(restaurant);
    }


    /**
     * 给餐厅添加菜单【餐厅】
     *
     * @param restaurants_id
     * @param name
     * @param img
     * @return
     * @throws Exception
     */
    @PostMapping("/dish")
    Result dishAdd(int restaurants_id, String name, String img) throws Exception {
        Map<String, Object> req = new HashMap<>();
        req.put("restaurant_id", restaurants_id);
        req.put("name", name);
        req.put("img", img);
        int count = mRestaurantMapper.dishsAdd(req);
        if (count != 1) throw new Exception("failure");
        return R.success();
    }

    /**
     * 给餐厅添加坐席【餐厅】
     *
     * @param restaurants_id
     * @param name
     * @param total
     * @return
     * @throws Exception
     */
    @PostMapping("/seat")
    Result seatAdd(int restaurants_id, String name, int total) throws Exception {
        Map<String, Object> req = new HashMap<>();
        req.put("restaurant_id", restaurants_id);
        req.put("name", name);
        req.put("total", total);
        int count = mRestaurantMapper.seatAdd(req);
        if (count != 1) throw new Exception("failure");
        return R.success();
    }
}
