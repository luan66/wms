package cn.wolfcode.wms.web.controller;

import cn.wolfcode.wms.annotation.RequiredPermission;
import cn.wolfcode.wms.domain.Brand;
import cn.wolfcode.wms.domain.Client;
import cn.wolfcode.wms.domain.Supplier;
import cn.wolfcode.wms.query.OrderChartQueryObject;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.query.SaleChartQueryObject;
import cn.wolfcode.wms.service.IBrandService;
import cn.wolfcode.wms.service.IChartService;
import cn.wolfcode.wms.service.IClientService;
import cn.wolfcode.wms.service.ISupplierService;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.math.BigDecimal;
import java.rmi.MarshalledObject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("chart")
public class ChartController {

    @Autowired
    private IChartService chartService;
    @Autowired
    private ISupplierService supplierService;
    @Autowired
    private IBrandService brandService;
    @Autowired
    private IClientService clientService;

    @RequiredPermission("订单报表")
    @RequestMapping("order")
    public String order(Model model, @ModelAttribute("qo") OrderChartQueryObject qo) throws Exception {
        List<Supplier> suppliers = supplierService.selectAll();
        model.addAttribute("suppliers", suppliers);
        List<Brand> brands = brandService.selectAll();
        model.addAttribute("brands", brands);


        List<Map<String, Object>> lists = chartService.order(qo);
        model.addAttribute("lists", lists);
        return "order/list";
    }

    @RequiredPermission("销售报表")
    @RequestMapping("sale")
    public String sale(Model model, @ModelAttribute("qo") SaleChartQueryObject qo) throws Exception {
        List<Client> clients = clientService.selectAll();
        model.addAttribute("clients", clients);
        List<Brand> brands = brandService.selectAll();
        model.addAttribute("brands", brands);
        List<Map<String, Object>> lists = chartService.sale(qo);
        model.addAttribute("lists", lists);
        return "sale/list";
    }

    @RequestMapping("saleChartsByBar")
    public String saleChartsByBar(Model model, @ModelAttribute("qo") SaleChartQueryObject qo) throws Exception {
        List<Map<String, Object>> maps = chartService.sale(qo);
        List<String> groupByNames = new ArrayList<>();
        List<String> totalAmount = new ArrayList<>();
        for (Map<String, Object> map : maps) {
            String groupByName = map.get("groupByName").toString();
            groupByNames.add(groupByName);
            String amount = map.get("totalAmount").toString();
            totalAmount.add(amount);
        }
        model.addAttribute("groupByNames", JSON.toJSONString(groupByNames));
        model.addAttribute("totalAmount", JSON.toJSONString(totalAmount));
        model.addAttribute("groupBy", qo.getGroupByMap().get(qo.getGroupBy()));
        return "sale/saleChartsByBar";
    }

    @RequestMapping("saleChartsByPie")
    public String saleChartsByPie(Model model, @ModelAttribute("qo") SaleChartQueryObject qo) throws Exception {
        List<Map<String, Object>> maps = chartService.sale(qo);
        List<String> groupByNames = new ArrayList<>();
        List<Map<String, Object>> list = new ArrayList<>();
        BigDecimal max =  BigDecimal.ZERO;
        for (Map<String, Object> map : maps) {
            String groupByName = map.get("groupByName").toString();
            groupByNames.add(groupByName);
            Map<String ,Object> salemap = new HashMap<>();
            salemap.put("value",map.get("totalAmount").toString());
            salemap.put("name",map.get("groupByName").toString());
            BigDecimal totalAmount = new BigDecimal(map.get("totalAmount").toString());
            if(totalAmount.compareTo(max)>0){
                max= totalAmount;
            }
            list.add(salemap);
        }
        model.addAttribute("groupByNames", JSON.toJSONString(groupByNames));
        model.addAttribute("list", JSON.toJSONString(list));
        model.addAttribute("groupBy", qo.getGroupByMap().get(qo.getGroupBy()));
        model.addAttribute("max", max);
        return "sale/saleChartsByPie";
    }

}
