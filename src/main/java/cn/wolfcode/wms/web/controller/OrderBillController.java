package cn.wolfcode.wms.web.controller;

import cn.wolfcode.wms.annotation.RequiredPermission;
import cn.wolfcode.wms.domain.OrderBill;
import cn.wolfcode.wms.domain.Supplier;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.OrderBillQueryObject;
import cn.wolfcode.wms.service.*;
import cn.wolfcode.wms.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("orderBill")
public class OrderBillController {
    @Autowired
    private IOrderBillService orderBillService;
    @Autowired
    private ISupplierService supplierService;
    @Autowired
    private IProductService productService;

    @RequiredPermission("订单的列表")
    @RequestMapping("query")
    public String query(Model model, @ModelAttribute("qo") OrderBillQueryObject qo) throws Exception {
        //查询出所有的供应商
        List<Supplier> suppliers = supplierService.selectAll();
        model.addAttribute("suppliers", suppliers);
        PageResult result = orderBillService.query(qo);
        model.addAttribute("result", result);
        return "orderBill/list";
    }

    @RequiredPermission("订单编辑")
    @RequestMapping("input")
    public String input(Model model, Long id) throws Exception {
        //查询出所有的供应商
        List<Supplier> suppliers = supplierService.selectAll();
        model.addAttribute("suppliers", suppliers);
        if (id != null) {
            //回显数据,回显订单明细的数据,根据订单的编号去查询
            OrderBill orderBill = orderBillService.selectByPrimaryKey(id);
            model.addAttribute("orderBill", orderBill);
        }
        return "/orderBill/input";
    }

    @RequiredPermission("订单的保存/修改")
    @ResponseBody
    @RequestMapping("saveOrUpdate")
    public JsonResult saveOrUpdate(Model model, OrderBill orderBill) throws Exception {
        try {
            if (orderBill.getId() != null) {
                //更新订单
                orderBillService.updateByPrimaryKey(orderBill);
            } else {
                //这里保存的时候要把订单明细也保存起来
                orderBillService.insert(orderBill);
            }
            return new JsonResult(true, "orderBill");
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult("保存失败");
        }
    }



    @RequiredPermission("订单的删除")
    @ResponseBody
    @RequestMapping("delete")
    public JsonResult delete(Long id) throws Exception {
        try {
            //先删除订单,再删除订单明细
            orderBillService.deleteByPrimaryKey(id);

            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult("删除失败");
        }

    }

    @ResponseBody
    @RequiredPermission("订单审核")
    @RequestMapping("auditor")
    public JsonResult auditor(Long id) throws Exception {
        try {
            //审核哪个订单
            orderBillService.updateStatus(id);
            return new JsonResult();
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult("审核失败");
        }
    }

    @RequiredPermission("订单查看")
    @RequestMapping("view")
    public String view(Model model, Long id) throws Exception {
        //查询出所有的供应商
        List<Supplier> suppliers = supplierService.selectAll();
        model.addAttribute("suppliers", suppliers);
        if (id != null) {
            //回显数据,回显订单明细的数据,根据订单的编号去查询
            OrderBill orderBill = orderBillService.selectByPrimaryKey(id);
            model.addAttribute("orderBill", orderBill);
        }
        return "/orderBill/auditorView";
    }
}
