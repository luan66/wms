package cn.wolfcode.wms.web.controller;

import cn.wolfcode.wms.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * created by king on 2017/11/28
 */
@Controller
public class LoginController {
    @Autowired
    private IEmployeeService employeeService;
    @RequestMapping("login")
    public String login(Model model,String name, String password) throws  Exception{
        try {
            employeeService.ckeckLogin(name,password);
        } catch (Exception e) {
            model.addAttribute("erroMsg",e.getMessage());
            e.printStackTrace();
            return "forward:/login.jsp";
            //登录失败返回登录页面,并共享错误信息
        }
        return "redirect:/main.do";
    }
    @RequestMapping("main")
    public String main() throws  Exception{
        return "main";
    }
}
