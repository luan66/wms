package cn.wolfcode.wms.service.impl;

import cn.wolfcode.wms.mapper.ChartMapper;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.IChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class ChartServiceImpl implements IChartService {
    @Autowired
    private ChartMapper chartMapper;

    @Override
    public List<Map<String, Object>> order(QueryObject qo) {
        return chartMapper.order(qo);
    }

    @Override
    public List<Map<String, Object>> sale(QueryObject qo) {
        return chartMapper.sale(qo);
    }
}
