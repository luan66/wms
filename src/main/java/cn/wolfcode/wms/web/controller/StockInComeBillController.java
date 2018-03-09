package cn.wolfcode.wms.web.controller;

import cn.wolfcode.wms.annotation.RequiredPermission;
import cn.wolfcode.wms.domain.StockInComeBill;
import cn.wolfcode.wms.domain.Depot;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.StockInComeBillQueryObject;
import cn.wolfcode.wms.service.IStockInComeBillService;
import cn.wolfcode.wms.service.IProductService;
import cn.wolfcode.wms.service.IDepotService;
import cn.wolfcode.wms.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * created by king on 2017/11/26
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("stockInComeBill")
public class StockInComeBillController {
    @Autowired
    private IStockInComeBillService stockInComeBillService;
    @Autowired
    private IDepotService depotService;
    @Autowired
    private IProductService productService;

    @RequiredPermission("入库的列表")
    @RequestMapping("query")
    public String query(Model model, @ModelAttribute("qo") StockInComeBillQueryObject qo) throws Exception {
        //查询出所有的供应商
        List<Depot> depots = depotService.selectAll();
        model.addAttribute("depots", depots);
        PageResult result = stockInComeBillService.query(qo);
        model.addAttribute("result", result);
        return "stockInComeBill/list";
    }

    @RequiredPermission("入库编辑")
    @RequestMapping("input")
    public String input(Model model, Long id) throws Exception {
        //查询出所有的供应商
        List<Depot> depots = depotService.selectAll();
        model.addAttribute("depots", depots);
        if (id != null) {
            //回显数据,回显入库明细的数据,根据入库的编号去查询
            StockInComeBill stockInComeBill = stockInComeBillService.selectByPrimaryKey(id);
            model.addAttribute("stockInComeBill", stockInComeBill);
        }
        return "/stockInComeBill/input";
    }

    @RequiredPermission("入库的保存/修改")
    @ResponseBody
    @RequestMapping("saveOrUpdate")
    public JsonResult saveOrUpdate(Model model, StockInComeBill stockInComeBill) throws Exception {
        try {
            if (stockInComeBill.getId() != null) {
                //更新入库
                stockInComeBillService.updateByPrimaryKey(stockInComeBill);
            } else {
                //这里保存的时候要把入库明细也保存起来
                stockInComeBillService.insert(stockInComeBill);
            }
            return new JsonResult(true, "stockInComeBill");
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult("保存失败");
        }
    }



    @RequiredPermission("入库的删除")
    @ResponseBody
    @RequestMapping("delete")
    public JsonResult delete(Long id) throws Exception {
        try {
            //先删除入库,再删除入库明细
            stockInComeBillService.deleteByPrimaryKey(id);

            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult("删除失败");
        }

    }

    @ResponseBody
    @RequiredPermission("入库审核")
    @RequestMapping("auditor")
    public JsonResult auditor(Long id) throws Exception {
        try {
            //审核哪个入库
            stockInComeBillService.updateStatus(id);
            return new JsonResult();
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult("审核失败");
        }
    }

    @RequiredPermission("入库查看")
    @RequestMapping("view")
    public String view(Model model, Long id) throws Exception {
        //查询出所有的供应商
        List<Depot> depots = depotService.selectAll();
        model.addAttribute("depots", depots);
        if (id != null) {
            //回显数据,回显入库明细的数据,根据入库的编号去查询
            StockInComeBill stockInComeBill = stockInComeBillService.selectByPrimaryKey(id);
            model.addAttribute("stockInComeBill", stockInComeBill);
        }
        return "/stockInComeBill/auditorView";
    }
}
