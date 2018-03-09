package cn.wolfcode.wms.web.controller;

import cn.wolfcode.wms.annotation.RequiredPermission;
import cn.wolfcode.wms.domain.Brand;
import cn.wolfcode.wms.domain.Depot;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.ProductQueryObject;
import cn.wolfcode.wms.query.ProductStockQueryObject;
import cn.wolfcode.wms.service.IBrandService;
import cn.wolfcode.wms.service.IDepotService;
import cn.wolfcode.wms.service.IProductStockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Controller
@RequestMapping("productStock")
public class ProductStockController {
    @Autowired
    private IProductStockService productStockService;
    @Autowired
    private IDepotService depotService;
    @Autowired
    private IBrandService brandService;


    @RequiredPermission("商品的列表")
    @RequestMapping("query")
    public String query(Model model, @ModelAttribute("qo") ProductStockQueryObject qo) throws Exception {
        //显示仓库下拉框
        List<Depot> depots = depotService.selectAll();
        model.addAttribute("depots", depots);
        //显示品牌下拉框
        List<Brand> brands = brandService.selectAll();
        model.addAttribute("brands", brands);
        PageResult result = productStockService.query(qo);
        model.addAttribute("result", result);
        return "productStock/list";
    }

}
