package online_booking.bl.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
@Mapper
public interface RestaurantMapper {

    /**
     * 获取餐厅列表
     *
     * @param map
     * @return
     */
    List<Map<String, Object>> list(Map<String, Object> map);

    /**
     * 获取餐厅
     *
     * @param map
     * @return
     */
    Map<String, Object> show(Map<String, Object> map);

    /**
     * 添加餐厅
     *
     * @param map
     * @return
     */
    int add(Map<String, Object> map);

    /**
     * 菜单列表
     *
     * @param restaurants_id
     * @return
     */
    List<Map<String, Object>> dishsList(int restaurants_id);


    /**
     * 添加菜单
     *
     * @param map
     * @return
     */
    int dishsAdd(Map<String, Object> map);

    /**
     * 坐席列表
     *
     * @param restaurants_id
     * @return
     */
    List<Map<String, Object>> seatList(int restaurants_id);


    /**
     * 添加坐席
     *
     * @param map
     * @return
     */
    int seatAdd(Map<String, Object> map);

    /**
     * 坐席已定数量
     *
     * @return
     */
    int bookingCount(Map<String, Object> map);

    /**
     * 获取餐厅类型列表
     *
     * @return
     */
    List<String> types();
}
