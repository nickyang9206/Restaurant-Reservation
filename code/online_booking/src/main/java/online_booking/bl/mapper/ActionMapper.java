package online_booking.bl.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
@Mapper
public interface ActionMapper {

    /**
     * 订座
     *
     * @param map
     * @return
     */
    int bookingSeat(Map<String, Object> map);

    /**
     * 取消订座
     *
     * @param map
     * @return
     */
    int cancelBookingSeat(Map<String, Object> map);

    /**
     * 拒绝订座
     *
     * @param map
     * @return
     */
    int rejectBookingSeat(Map<String, Object> map);

    /**
     * 确认订座
     *
     * @param map
     * @return
     */
    int confirmBookingSeat(Map<String, Object> map);

    /**
     * 获取普通用户所有信息
     *
     * @param map
     * @return
     */
    List<Map<String, Object>> userMessages(Map<String, Object> map);

    /**
     * 获取餐厅用户所有信息
     *
     * @param map
     * @return
     */
    List<Map<String, Object>> userMessages2(Map<String, Object> map);
}
