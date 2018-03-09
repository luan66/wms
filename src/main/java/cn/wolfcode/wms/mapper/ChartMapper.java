package cn.wolfcode.wms.mapper;

import cn.wolfcode.wms.query.QueryObject;

import java.util.List;
import java.util.Map;

public interface ChartMapper {
    List<Map<String, Object>> order(QueryObject qo);
    List<Map<String, Object>> sale(QueryObject qo);
}
