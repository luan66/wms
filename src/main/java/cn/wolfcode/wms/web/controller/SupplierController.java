package cn.wolfcode.wms.web.controller;

import cn.wolfcode.wms.annotation.RequiredPermission;
import cn.wolfcode.wms.domain.Supplier;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.ISupplierService;
import cn.wolfcode.wms.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * created by king on 2017/11/26
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("supplier")
public class SupplierController {
    @Autowired
    private ISupplierService supplierService;
    @RequiredPermission("供应商的列表")
    @RequestMapping("query")
    public String query(Model model, @ModelAttribute("qo") QueryObject qo) throws Exception {
        PageResult result = supplierService.qury(qo);
        model.addAttribute("result", result);
        return "supplier/list";
    }
    @RequiredPermission("供应商的编辑")
    @RequestMapping("input")
    public String input(Model model, Long id) throws Exception {
        if (id != null) {
            Supplier supplier = supplierService.selectByPrimaryKey(id);
            model.addAttribute("supplier", supplier);
        }
        return "supplier/input";
    }
    @RequiredPermission("供应商的保存/更改")
    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Model model, Supplier entity) throws Exception {
        try {
            if (entity.getId() != null) {
                supplierService.updateByPrimaryKey(entity);
            } else {
                supplierService.insert(entity);
            }
            return new JsonResult(true,"supplier");
        } catch (Exception e) {
            e.printStackTrace();
            return  new JsonResult("保存失败");
        }
    }
    @RequiredPermission("供应商的删除")
    @ResponseBody
    @RequestMapping("delete")
    public JsonResult delete(Long id) throws Exception {
        try {
            if (id != null) {
                supplierService.deleteByPrimaryKey(id);
            }
            return new JsonResult();
        }catch (Exception e){
            return new JsonResult("删除失败");
        }

    }
}
