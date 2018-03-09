package cn.wolfcode.wms.web.controller;

import cn.wolfcode.wms.annotation.RequiredPermission;
import cn.wolfcode.wms.domain.Client;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.IClientService;
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
@RequestMapping("client")
public class ClientController {
    @Autowired
    private IClientService clientService;
    @RequiredPermission("客户的列表")
    @RequestMapping("query")
    public String query(Model model, @ModelAttribute("qo") QueryObject qo) throws Exception {
        PageResult result = clientService.query(qo);
        model.addAttribute("result", result);
        return "client/list";
    }
    @RequiredPermission("客户的编辑")
    @RequestMapping("input")
    public String input(Model model, Long id) throws Exception {
        if (id != null) {
            Client client = clientService.selectByPrimaryKey(id);
            model.addAttribute("client", client);
        }
        return "client/input";
    }
    @RequiredPermission("客户的保存/更改")
    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Model model, Client entity) throws Exception {
        try {
            if (entity.getId() != null) {
                clientService.updateByPrimaryKey(entity);
            } else {
                clientService.insert(entity);
            }
            return new JsonResult(true,"client");
        } catch (Exception e) {
            e.printStackTrace();
            return  new JsonResult("保存失败");
        }
    }
    @RequiredPermission("客户的删除")
    @ResponseBody
    @RequestMapping("delete")
    public JsonResult delete(Long id) throws Exception {
        try {
            if (id != null) {
                clientService.deleteByPrimaryKey(id);
            }
            return new JsonResult();
        }catch (Exception e){
            return new JsonResult("删除失败");
        }

    }
}
