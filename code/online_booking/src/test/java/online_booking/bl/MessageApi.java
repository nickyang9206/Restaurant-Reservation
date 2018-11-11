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

@RunWith(SpringRunner.class)
@SpringBootTest
public class MessageApi {

    @Autowired
    private WebApplicationContext context;

    private MockMvc mockMvc;
    private String token = "";

    @Before
    public void setupMockMvc() throws Exception {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();

        String api = "/user/login";

        MvcResult mvcResult = mockMvc.perform(
                MockMvcRequestBuilders.post(api)
                        .param("username", "admin")
                        .param("password", "123456")
        ).andReturn();
        String content = mvcResult.getResponse().getContentAsString();
        JSONObject result = JSON.parseObject(content);
        if (result.getLongValue("code") != 0) {
            XMLUtil.log(api, result.getString("msg"), "error");
            Assert.fail();
        } else {
            token = result.getJSONObject("data").getString("token");
            XMLUtil.log(api, result.getString("msg"), "ok");
        }
    }

    @Test
    public void list() throws Exception {
        String api = "/messages/list";

        MvcResult mvcResult = mockMvc.perform(
                MockMvcRequestBuilders
                        .get(api)
                        .header("Authorization", "token " + token)
        )
                .andReturn();
        String content = mvcResult.getResponse().getContentAsString();
        JSONObject result = JSON.parseObject(content);
        if (result.getLongValue("code") != 0) {
            XMLUtil.log(api, result.getString("msg"), "error");
            Assert.fail();
        } else {
            System.out.println(result.toString());
            XMLUtil.log(api, result.getString("msg"), "ok");
        }
    }
}
