package cn.wolfcode.wms.web.controller;

import cn.wolfcode.wms.annotation.RequiredPermission;
import cn.wolfcode.wms.domain.SystemMenu;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.SystemMenuQueryObject;
import cn.wolfcode.wms.service.ISystemMenuService;
import cn.wolfcode.wms.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * created by king on 2017/11/26
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("systemMenu")
public class SystemMenuController {
    @Autowired
    private ISystemMenuService systemMenuService;

    @RequiredPermission("系统菜单的列表")
    @RequestMapping("query")
    public String query(Model model, @ModelAttribute("qo") SystemMenuQueryObject qo) throws Exception {
        //通过父类的id查出上面所有的父类
        SystemMenu parent = systemMenuService.selectByPrimaryKey(qo.getParentId());
        List<Map<String,Object>> list=new ArrayList<>();
        while (parent!=null){
            Map<String,Object> map=new HashMap<>();
            map.put("id",parent.getId());
            map.put("name",parent.getName());
            list.add(map);
            parent=parent.getParent();
            System.out.println(parent);
        }
        //放到共享作用域中
        Collections.reverse(list);
        model.addAttribute("parents",list);
        PageResult result = systemMenuService.qury(qo);
        model.addAttribute("result", result);
        System.out.println(list);
        return "systemMenu/list";
    }

    @RequiredPermission("系统菜单的编辑")
    @RequestMapping("input")
    public String input(Model model, Long id, Long parentId) throws Exception {
        //通过父类的id,把父类的信息查出来
        if (parentId != null) {
            SystemMenu parentMenu = systemMenuService.selectByPrimaryKey(parentId);
            model.addAttribute("parentId", parentMenu.getId());
            model.addAttribute("parentName", parentMenu.getName());
        }else {
            model.addAttribute("parentName", "根目录");
        }
        if (id != null) {
            //这里需要把他父类的菜单名字查出来放到共享域中
            SystemMenu systemMenu = systemMenuService.selectByPrimaryKey(id);
            model.addAttribute("systemMenu", systemMenu);
        }
        return "systemMenu/input";
    }

    @RequiredPermission("系统菜单的保存/更改")
    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Model model, SystemMenu entity) throws Exception {
        try {
            if (entity.getId() != null) {
                systemMenuService.updateByPrimaryKey(entity);
            } else {
                systemMenuService.insert(entity);
            }
            return new JsonResult(true, "systemMenu");
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult("保存失败");
        }
    }

    @RequiredPermission("系统菜单的删除")
    @ResponseBody
    @RequestMapping("delete")
    public JsonResult delete(Long id) throws Exception {
        try {
            if (id != null) {
                systemMenuService.deleteByPrimaryKey(id);
            }
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult("删除失败");
        }

    }
    @ResponseBody
    @RequestMapping("selectMenuByParentSn")
    public List<Map<String,Object>> selectMenuByParentSn(String parentSn) throws Exception {
       //sql怎么去写,通过
        return  systemMenuService.selectMenuByParentSn(parentSn);

    }
}
