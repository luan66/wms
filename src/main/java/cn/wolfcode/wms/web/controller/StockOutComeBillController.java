package cn.wolfcode.wms.web.controller;

import cn.wolfcode.wms.annotation.RequiredPermission;
import cn.wolfcode.wms.domain.Client;
import cn.wolfcode.wms.domain.Depot;
import cn.wolfcode.wms.domain.StockOutComeBill;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.StockOutComeBillQueryObject;
import cn.wolfcode.wms.service.IClientService;
import cn.wolfcode.wms.service.IDepotService;
import cn.wolfcode.wms.service.IProductService;
import cn.wolfcode.wms.service.IStockOutComeBillService;
import cn.wolfcode.wms.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@SuppressWarnings("all")
@Controller
@RequestMapping("stockOutComeBill")
public class StockOutComeBillController {
    @Autowired
    private IStockOutComeBillService stockOutComeBillService;
    @Autowired
    private IDepotService depotService;
    @Autowired
    private IProductService productService;
    @Autowired
    private IClientService clientService;
    @RequiredPermission("出库的列表")
    @RequestMapping("query")
    public String query(Model model, @ModelAttribute("qo") StockOutComeBillQueryObject qo) throws Exception {
        //查询出所有的供应商
        List<Depot> depots = depotService.selectAll();
        model.addAttribute("depots", depots);
        //查出所有的客户
        List<Client> clients = clientService.selectAll();
        model.addAttribute("clients",clients);
        PageResult result = stockOutComeBillService.query(qo);
        model.addAttribute("result", result);
        return "stockOutComeBill/list";
    }

    @RequiredPermission("出库编辑")
    @RequestMapping("input")
    public String input(Model model, Long id) throws Exception {
        //查询出所有的供应商
        List<Depot> depots = depotService.selectAll();
        model.addAttribute("depots", depots);
        //查出所有的客户
        List<Client> clients = clientService.selectAll();
        model.addAttribute("clients",clients);
        if (id != null) {
            //回显数据,回显出库明细的数据,根据出库的编号去查询
            StockOutComeBill stockOutComeBill = stockOutComeBillService.selectByPrimaryKey(id);
            model.addAttribute("stockOutComeBill", stockOutComeBill);
        }
        return "/stockOutComeBill/input";
    }

    @RequiredPermission("出库的保存/修改")
    @ResponseBody
    @RequestMapping("saveOrUpdate")
    public JsonResult saveOrUpdate(Model model, StockOutComeBill stockOutComeBill) throws Exception {
        try {
            if (stockOutComeBill.getId() != null) {
                //更新出库
                stockOutComeBillService.updateByPrimaryKey(stockOutComeBill);
            } else {
                //这里保存的时候要把出库明细也保存起来
                stockOutComeBillService.insert(stockOutComeBill);
            }
            return new JsonResult(true, "stockOutComeBill");
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult("保存失败");
        }
    }



    @RequiredPermission("出库的删除")
    @ResponseBody
    @RequestMapping("delete")
    public JsonResult delete(Long id) throws Exception {
        try {
            //先删除出库,再删除出库明细
            stockOutComeBillService.deleteByPrimaryKey(id);

            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult("删除失败");
        }

    }

    @ResponseBody
    @RequiredPermission("出库审核")
    @RequestMapping("auditor")
    public JsonResult auditor(Long id) throws Exception {
        try {
            //审核哪个出库
            stockOutComeBillService.updateStatus(id);
            return new JsonResult();
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult(e.getMessage());
        }
    }

    @RequiredPermission("出库查看")
    @RequestMapping("view")
    public String view(Model model, Long id) throws Exception {
        //查询出所有的仓库
        List<Depot> depots = depotService.selectAll();
        model.addAttribute("depots", depots);
        //查出所有的客户
        List<Client> clients = clientService.selectAll();
        model.addAttribute("clients",clients);
        if (id != null) {
            //回显数据,回显出库明细的数据,根据出库的编号去查询
            StockOutComeBill stockOutComeBill = stockOutComeBillService.selectByPrimaryKey(id);
            model.addAttribute("stockOutComeBill", stockOutComeBill);
        }
        return "/stockOutComeBill/auditorView";
    }
}
