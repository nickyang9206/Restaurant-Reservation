package online_booking.bl.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
@Mapper
public interface TokenMapper {

    @Delete("DELETE FROM tokens WHERE user_id = #{user_id}")
    int del(@Param("user_id") int user_id);

    @Insert("INSERT INTO tokens (user_id, token) VALUES (#{user_id}, #{token})")
    int insert(@Param("user_id") int user_id, @Param("token") String token);

    @Select("Select * from tokens where user_id = #{user_id}")
    Map<String, Object> show(@Param("user_id") int user_id);
}
