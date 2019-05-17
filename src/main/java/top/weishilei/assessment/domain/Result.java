package top.weishilei.assessment.domain;

import com.alibaba.fastjson.JSONObject;

/**
 * 响应封装
 * @author: weishilei
 */
public class Result {
    public static final int SUCCESS = 0;
    public static final int FAIL = 10000;
    public static final int USER_OR_PASS_IS_FAIL = 20000;

    private String message;
    private int code;
    private Object data;

    private Result() {}

    private Result(Object data) {
        this.code = SUCCESS;
        this.message = "success";
        this.data = data;
    }

    private Result(String message) {
        this.code = FAIL;
        this.message = message;
    }

    private Result(String message, int code) {
        this.message = message;
        this.code = code;
    }

    /**
     * 成功返回
     * @param data
     * @return
     */
    public static String success(Object data) {
        return JSONObject.toJSONString(new Result(data));
    }

    public static String success() {
        return JSONObject.toJSONString(new Result("success", SUCCESS));
    }

    /**
     * 失败返回
     * @param message
     * @return
     */
    public static String fail(String message) {
        return JSONObject.toJSONString(new Result(message));
    }

    public static String fail() {
        return JSONObject.toJSONString(new Result("fail", FAIL));
    }

    /**
     * 自定义失败code返回
     * @param message
     * @param code
     * @return
     */
    public static String failCode(String message, int code) {
        return JSONObject.toJSONString(new Result(message, code));
    }

    public static Result createResult() {
        return new Result();
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
