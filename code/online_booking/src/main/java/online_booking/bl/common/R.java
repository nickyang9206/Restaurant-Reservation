package online_booking.bl.common;

public class R {
    public static Result success(Object object) {
        Result r = new Result();
        r.setCode(0);
        r.setMsg("success");
        r.setData(object);
        return r;
    }

    public static Result success() {
        return success("");
    }

    public static Result error() {
        Result r = new Result();
        r.setCode(-1);
        r.setMsg("failure");
        r.setData("");
        return r;
    }

    public static Result error(int code, String msg) {
        Result r = new Result();
        r.setCode(code);
        r.setMsg(msg);
        r.setData("");
        return r;
    }
}

