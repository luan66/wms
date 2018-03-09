package cn.wolfcode.wms.query;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

@Getter
@Setter
public class OrderChartQueryObject extends QueryObject {

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date beginTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endTime;
    private String productName;
    private long supplierId = -1L;
    private long brandId = -1L;
    private String groupBy = "e.name";

    public Map<String, Object> getGroupByMap(){
        LinkedHashMap<String, Object> map = new LinkedHashMap<>();
        map.put("e.name","订货人员");
        map.put("p.name","货品名称");
        map.put("s.name","供应商");
        map.put("p.brandName","货品品牌");
        map.put("DATE_FORMAT(ob.vdate,'%Y-%m')","订货日期(月)");
        map.put("DATE_FORMAT(ob.vdate,'%Y-%m-%d')","订货日期(日)");

        return map;
    }
}
