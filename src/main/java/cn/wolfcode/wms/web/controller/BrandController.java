package cn.wolfcode.wms.web.controller;

import cn.wolfcode.wms.annotation.RequiredPermission;
import cn.wolfcode.wms.domain.Brand;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.IBrandService;
import cn.wolfcode.wms.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@SuppressWarnings("all")
@Controller
@RequestMapping("brand")
public class BrandController {
    @Autowired
    private IBrandService brandService;
    @RequiredPermission("品牌的列表")
    @RequestMapping("query")
    public String query(Model model, @ModelAttribute("qo") QueryObject qo) throws Exception {
        PageResult result = brandService.query(qo);
        model.addAttribute("result", result);
        return "brand/list";
    }
    @RequiredPermission("品牌的编辑")
    @RequestMapping("input")
    public String input(Model model, Long id) throws Exception {
        if (id != null) {
            Brand brand = brandService.selectByPrimaryKey(id);
            model.addAttribute("brand", brand);
        }
        return "brand/input";
    }
    @RequiredPermission("品牌的保存/更改")
    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Model model, Brand entity) throws Exception {
        try {
            if (entity.getId() != null) {
                brandService.updateByPrimaryKey(entity);
            } else {
                brandService.insert(entity);
            }
            return new JsonResult(true,"brand");
        } catch (Exception e) {
            e.printStackTrace();
            return  new JsonResult("保存失败");
        }
    }
    @RequiredPermission("品牌的删除")
    @ResponseBody
    @RequestMapping("delete")
    public JsonResult delete(Long id) throws Exception {
        try {
            if (id != null) {
                brandService.deleteByPrimaryKey(id);
            }
            return new JsonResult();
        }catch (Exception e){
            return new JsonResult("删除失败");
        }

    }
}
