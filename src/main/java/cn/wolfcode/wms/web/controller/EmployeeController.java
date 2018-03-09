package cn.wolfcode.wms.web.controller;

import cn.wolfcode.wms.annotation.RequiredPermission;
import cn.wolfcode.wms.domain.Department;
import cn.wolfcode.wms.domain.Employee;
import cn.wolfcode.wms.domain.Role;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.EmployeeQueryObject;
import cn.wolfcode.wms.service.IDepartmentService;
import cn.wolfcode.wms.service.IEmployeeService;
import cn.wolfcode.wms.service.IRoleService;
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
@Controller
@RequestMapping("employee")
public class EmployeeController {
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    IDepartmentService departmentService;
    @Autowired
    IRoleService roleService;
    @RequiredPermission("员工的列表")
    @RequestMapping("query")
    public String query(Model model, @ModelAttribute("qo") EmployeeQueryObject qo) throws Exception {
        //查出所有的部门
        List<Department> depts = departmentService.selectAll();
        model.addAttribute("depts", depts);
        PageResult result = employeeService.qury(qo);
        model.addAttribute("result", result);
        return "employee/list";
    }
    @RequiredPermission("员工的编辑")
    @RequestMapping("input")
    public String input(Model model, Long id) throws Exception {
        //查出数据库中所有的角色
        List<Role> roles = roleService.selectAll();
        model.addAttribute("roles",roles);
        //查出所有的部门
        List<Department> depts = departmentService.selectAll();
        model.addAttribute("depts", depts);
        if (id != null) {
            //在这里查出员工所对应的角色
            Employee employee = employeeService.selectByPrimaryKey(id);
            model.addAttribute("employee", employee);
        }
        return "employee/input";
    }
    //对员工的保存进行ajax的提示,保存成功后跳到/query.do的界面
    @RequiredPermission("员工的保存/更改")
    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Model model, Employee entity,Long[] ids) throws Exception {
        try {
            if (entity.getId() != null) {
                employeeService.updateByPrimaryKey(entity,ids);
            } else {
                employeeService.insert(entity,ids);
            }
            return new JsonResult(true,"employee");
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult("保存失败");
        }
    }
    @RequiredPermission("员工的删除")
    @ResponseBody
    @RequestMapping("delete")
    public JsonResult delete(Long id) throws Exception {
        try {
            if (id != null) {
                employeeService.deleteByPrimaryKey(id);
            }
        } catch (Throwable e) {
            return new JsonResult("删除失败");

        }
        return new JsonResult();
    }
    @RequiredPermission("员工的批量删除")
    @ResponseBody
    @RequestMapping("batchDelete")
    public JsonResult batchDelete(Long[] ids) throws Exception {
        try {
            if (ids != null) {
                employeeService.bachDelete(ids);
            }
            return new JsonResult();
        } catch (Throwable e) {
            return new JsonResult("删除失败");

        }
    }
}
