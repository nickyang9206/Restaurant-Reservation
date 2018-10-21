package online_booking.bl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.HashMap;
import java.util.Map;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserApi {

    @Autowired
    private WebApplicationContext context;

    private MockMvc mockMvc;

    @Before
    public void setupMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void login() throws Exception {
        String api = "/user/login";

        MvcResult mvcResult = mockMvc.perform(
                MockMvcRequestBuilders.post(api).param("username", "admin").param("password", "123456")
        ).andReturn();
        String content = mvcResult.getResponse().getContentAsString();
        JSONObject result = JSON.parseObject(content);
        if (result.getLongValue("code") != 0) {
            XMLUtil.log(api, result.getString("msg"), "error");
            Assert.fail();
        } else {
            XMLUtil.log(api, result.getString("msg"), "ok");
        }
    }

    @Test
    public void register() throws Exception {
        String api = "/user/register";

        MvcResult mvcResult = mockMvc.perform(
                MockMvcRequestBuilders.post(api).param("username", "admin").param("password", "123456").param("identity", "1")
        ).andReturn();
        String content = mvcResult.getResponse().getContentAsString();
        JSONObject result = JSON.parseObject(content);
        if (result.getLongValue("code") != 0) {
            XMLUtil.log(api, result.getString("msg"), "error");
            Assert.fail();
        } else {
            XMLUtil.log(api, result.getString("msg"), "ok");
        }
    }

}
