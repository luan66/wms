package cn.wolfcode.wms.service;

import cn.wolfcode.wms.domain.Department;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.xml.parsers.SAXParser;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class DepartmentServiceTest {
    @Autowired
    private  IDepartmentService departmentService;
    @Test
    public void deleteByPrimaryKey() throws Exception {
        departmentService.deleteByPrimaryKey(8L);

    }

    @Test
    public void insert() throws Exception {
        Department department = new Department(null,"小卖部","XMB");
        departmentService.insert(department);

    }

    @Test
    public void selectByPrimaryKey() throws Exception {
        Department department = departmentService.selectByPrimaryKey(8L);
        System.out.println(department);
    }

    @Test
    public void selectAll() throws Exception {
        List<Department> list = departmentService.selectAll();
        for (Department department : list) {
            System.out.println(department);
        }
    }

    @Test
    public void updateByPrimaryKey() throws Exception {
        Department department = new Department(8L,"小卖部22","XMB22");
        departmentService.updateByPrimaryKey(department);
    }

}