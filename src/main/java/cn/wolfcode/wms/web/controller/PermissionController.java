package cn.wolfcode.wms.web.controller;

import cn.wolfcode.wms.annotation.RequiredPermission;
import cn.wolfcode.wms.domain.Permission;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.IPermissionService;
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
@RequestMapping("permission")
public class PermissionController {
    @Autowired
    private IPermissionService permissionService;
    @RequiredPermission("权限的列表")
    @RequestMapping("query")
    public String query(Model model, @ModelAttribute("qo") QueryObject qo) throws Exception {
        PageResult result = permissionService.qury(qo);
        model.addAttribute("result", result);
        return "permission/list";
    }
    @RequiredPermission("权限的删除")
    @ResponseBody
    @RequestMapping("delete")
    public JsonResult delete(Long id) throws Exception {
        try {
            if (id != null) {
                permissionService.deleteByPrimaryKey(id);
            }
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult("删除失败");
        }

    }

    //权限的加载
    @ResponseBody
    @RequestMapping("reload")
    public JsonResult reload() throws Exception {
        try{
            permissionService.reload();
            return new JsonResult();
        }catch (Exception e){
            return new JsonResult("加载失败");
        }

    }

}
