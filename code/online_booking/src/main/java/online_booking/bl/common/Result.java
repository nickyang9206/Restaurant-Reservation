package online_booking.bl.common;

import java.util.HashMap;

public class Result<T> extends HashMap {
    public void setCode(Integer code) {
        put("code", code);
    }

    public void setMsg(String msg) {
        put("msg", msg);
    }

    public void setData(T data) {
        put("data", data);
    }
}
