package cn.wolfcode.wms.web.controller;

import cn.wolfcode.wms.annotation.RequiredPermission;
import cn.wolfcode.wms.domain.Department;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.QueryObject;
import cn.wolfcode.wms.service.IDepartmentService;
import cn.wolfcode.wms.utils.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
@RequestMapping("department")
public class DepartmentController {

    @Autowired
    private IDepartmentService departmentService;

    @RequiredPermission("部门的列表")
    @RequestMapping("query")
    public String query(Model model, @ModelAttribute("qo") QueryObject qo) throws Exception {
        PageResult result = departmentService.qury(qo);
        model.addAttribute("result", result);
        return "department/list";
    }

    @RequiredPermission("部门的删除")
    @ResponseBody
    @RequestMapping("delete")
    public JsonResult delete(Long id) throws Exception {
        try {
            if (id != null) {
                departmentService.deleteByPrimaryKey(id);
            }
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult("删除失败");
        }

    }

//=====================easyUI方法====================================

    @RequiredPermission("部门列表页面")
    @RequestMapping("list")
    public String list() throws Exception {
        //String json = departmentService.queryJson();
        return "department/list";
    }

    @RequiredPermission("部门Json的列表")
    @RequestMapping("queryJson")
    @ResponseBody
    public Map<String, Object> queryJson(Integer page, Integer rows) throws Exception {
        QueryObject queryObject = new QueryObject();
        queryObject.setCurrentPage(page);
        queryObject.setPageSize(rows);
        PageResult result = departmentService.qury(queryObject);
        Map<String, Object> map = new LinkedHashMap<>();
        map.put("rows", result.getData());
        map.put("total", result.getTotalCount());
        return map;
    }


    @RequiredPermission("部门的保存/更改")
    @RequestMapping("save")
    @ResponseBody
    public JsonResult save(Department entity) throws Exception {
        try {
            if (entity.getId() != null) {
                departmentService.updateByPrimaryKey(entity);
            } else {
                departmentService.insert(entity);
            }
            return new JsonResult(true, "department");
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult("保存失败");
        }
    }
}
