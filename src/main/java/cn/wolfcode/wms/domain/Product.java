package cn.wolfcode.wms.domain;

import com.alibaba.fastjson.JSON;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.io.FilenameUtils;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

@Getter@Setter
public class Product {
    private Long id;

    private String name;

    private String sn;

    private BigDecimal costPrice;//成本价

    private BigDecimal salePrice;

    private String imagePath;

    private String intro;

    private Long brandId;//品牌的id
    //这里打破了数据库的第三范式
    private String brandName;//品牌的名称
    public String getSmallImagePath() {
        //FilenameUtils.baseName() 得到拓展名最后一个点以前的字符串
        if (StringUtils.isEmpty(imagePath)) {
            return "";
        }
        String extension = FilenameUtils.getExtension(this.imagePath);//得到后缀
        int index = imagePath.lastIndexOf(".");
        String prefix = imagePath.substring(0, index);
        return prefix + "_small" + "." + extension;
    }
    public String getJsonStrng() {
        Map<String,Object> jsonMap=new HashMap<>();
        jsonMap.put("id",id);
        jsonMap.put("ProductName",name);
        jsonMap.put("costPrice",costPrice);
        jsonMap.put("brandName",brandName);
        jsonMap.put("salePrice",salePrice);
        return  JSON.toJSONString(jsonMap);
    }
}