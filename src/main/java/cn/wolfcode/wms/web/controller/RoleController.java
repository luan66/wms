package cn.wolfcode.wms.web.controller;

import cn.wolfcode.wms.annotation.RequiredPermission;
import cn.wolfcode.wms.domain.Permission;
import cn.wolfcode.wms.domain.Role;
import cn.wolfcode.wms.domain.SystemMenu;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.IPermissionService;
import cn.wolfcode.wms.service.IRoleService;
import cn.wolfcode.wms.service.ISystemMenuService;
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
@RequestMapping("role")
public class RoleController {
    @Autowired
    private IRoleService roleService;
    @Autowired
    private IPermissionService permissionService;
    @Autowired
    private ISystemMenuService systemMenuService;
    @RequiredPermission("角色的列表")
    @RequestMapping("query")
    public String query(Model model, @ModelAttribute("qo") QueryObject qo) throws Exception {
        PageResult result = roleService.qury(qo);
        model.addAttribute("result", result);
        return "role/list";
    }
    @RequiredPermission("角色的编辑")
    @RequestMapping("input")
    public String input(Model model, Long id) throws Exception {
        //查出数据库中所有的系统菜单
        List<SystemMenu> systemMenus = systemMenuService.selectAll();
        model.addAttribute("menus",systemMenus);
        //查询出数据库中所有的权限
        List<Permission> permissions = permissionService.selectAll();
        model.addAttribute("permissions",permissions);
        if (id != null) {
            //在这里查出角色所对应的权限,以便于在页面上回显
            Role role = roleService.selectByPrimaryKey(id);

            model.addAttribute("role", role);
        }
        return "role/input";
    }
    @RequiredPermission("角色的保存/更改")
    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Model model, Role entity,Long[] ids,Long[] menuIds) throws Exception {
        try {
            if (entity.getId() != null) {
                roleService.updateByPrimaryKey(entity,ids,menuIds);
            } else {
                roleService.insert(entity,ids,menuIds);
            }
            return new JsonResult(true,"role");
        } catch (Exception e) {
            e.printStackTrace();
            return  new JsonResult("保存失败");
        }
    }
    @RequiredPermission("角色的删除")
    @ResponseBody
    @RequestMapping("delete")
    public JsonResult delete(Long id) throws Exception {
        try {
            if (id != null) {
                roleService.deleteByPrimaryKey(id);
            }
            return new JsonResult();
        }catch (Exception e){
            return new JsonResult("删除失败");
        }

    }
}
