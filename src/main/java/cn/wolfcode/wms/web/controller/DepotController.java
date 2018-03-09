package cn.wolfcode.wms.web.controller;

import cn.wolfcode.wms.annotation.RequiredPermission;
import cn.wolfcode.wms.domain.Depot;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.IDepotService;
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
@RequestMapping("depot")
public class DepotController {
    @Autowired
    private IDepotService depotService;
    @RequiredPermission("仓库的列表")
    @RequestMapping("query")
        public String query(Model model, @ModelAttribute("qo") QueryObject qo) throws Exception {
        PageResult result = depotService.qury(qo);
        model.addAttribute("result", result);
        return "depot/list";
    }
    @RequiredPermission("仓库的编辑")
    @RequestMapping("input")
    public String input(Model model, Long id) throws Exception {
        if (id != null) {
            Depot depot = depotService.selectByPrimaryKey(id);
            model.addAttribute("depot", depot);
        }
        return "depot/input";
    }
    @RequiredPermission("仓库的保存/更改")
    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Model model, Depot entity) throws Exception {
        try {
            if (entity.getId() != null) {
                depotService.updateByPrimaryKey(entity);
            } else {
                depotService.insert(entity);
            }
            return new JsonResult(true,"depot");
        } catch (Exception e) {
            e.printStackTrace();
            return  new JsonResult("保存失败");
        }
    }
    @RequiredPermission("仓库的删除")
    @ResponseBody
    @RequestMapping("delete")
    public JsonResult delete(Long id) throws Exception {
        try {
            if (id != null) {
                depotService.deleteByPrimaryKey(id);
            }
            return new JsonResult();
        }catch (Exception e){
            return new JsonResult("删除失败");
        }

    }
}
