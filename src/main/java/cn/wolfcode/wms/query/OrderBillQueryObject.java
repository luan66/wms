package cn.wolfcode.wms.query;

import cn.wolfcode.wms.utils.DateUtil;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * created by king on 2017/12/3
 */
@Getter
@Setter
public class OrderBillQueryObject extends QueryObject {
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date beginTime;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date endTime;
    private long suplierId = -1;//供应商的id
    private int status = -1;

    public Date getEndTime() {
        if (endTime != null) {
            return DateUtil.getEndDate(endTime);
        }
        return null;
    }

}
