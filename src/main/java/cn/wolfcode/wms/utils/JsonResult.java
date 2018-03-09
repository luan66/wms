package cn.wolfcode.wms.utils;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//json工具的封装
@Getter@Setter@NoArgsConstructor
public class JsonResult {
    private boolean flag=true;//标志是否删除成功,默认删除成功
    private String message;//错误之后的提示信息
    private String mark;
    public JsonResult(String message) {
        this.flag=false;
        this.message = message;
    }

    /**
     * 正确的打开方式是,保存成功之后调用这个构造器
     * mark是标记传过去是employee还是department
     * @param flag
     * @param mark
     */
    public JsonResult(boolean flag, String mark) {
        this.flag = flag;
        this.mark = mark;
    }
}
