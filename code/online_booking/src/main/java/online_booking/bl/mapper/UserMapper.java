package online_booking.bl.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
@Mapper
public interface UserMapper {
    @Select("select * from users where username = #{username}")
    Map<String, Object> findByUsername(@Param("username") String username);

    @Insert("INSERT INTO users (username, password, identity) VALUES (#{username}, #{password}, #{identity})")
    int insert(@Param("username") String username, @Param("password") String password, @Param("identity") int identity);
}
