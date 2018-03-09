package cn.wolfcode.wms.web.controller;

import cn.wolfcode.wms.annotation.RequiredPermission;
import cn.wolfcode.wms.domain.Brand;
import cn.wolfcode.wms.domain.Product;
import cn.wolfcode.wms.page.PageResult;
import cn.wolfcode.wms.query.ProductQueryObject;
import cn.wolfcode.wms.service.IBrandService;
import cn.wolfcode.wms.service.IProductService;
import cn.wolfcode.wms.utils.JsonResult;
import cn.wolfcode.wms.utils.UploadUtil;
import com.alibaba.druid.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.util.List;

/**
 * created by king on 2017/11/26
 */
@SuppressWarnings("all")
@Controller
@RequestMapping("product")
public class ProductController {
    @Autowired
    private IProductService productService;
    @Autowired
    private IBrandService brandService;
    @Autowired
    private ServletContext ctx;

    @RequiredPermission("商品的列表")
    @RequestMapping("query")
    public String query(Model model, @ModelAttribute("qo") ProductQueryObject qo) throws Exception {
        //查询数据库中所有的品牌
        List<Brand> brands = brandService.selectAll();
        model.addAttribute("brands", brands);
        PageResult result = productService.query(qo);
        model.addAttribute("result", result);
        return "product/list";
    }

    @RequiredPermission("商品的编辑")
    @RequestMapping("input")
    public String input(Model model, Long id) throws Exception {
        //查询数据库中所有的品牌
        List<Brand> brands = brandService.selectAll();
        model.addAttribute("brands", brands);
        if (id != null) {
            Product product = productService.selectByPrimaryKey(id);
            model.addAttribute("product", product);
        }
        return "product/input";
    }

    @RequiredPermission("商品的保存/更改")
    @RequestMapping("saveOrUpdate")
    @ResponseBody
    public JsonResult saveOrUpdate(Model model, Product entity, MultipartFile pic) throws Exception {
        String basePath = ctx.getRealPath("/upload");
        //保存图片有两种情况,点编辑,原来有图片,并且没选图片,那就不保存,有图片选了图片,那么我们应该删除旧的图片
        if (pic != null&& !StringUtils.isEmpty(entity.getImagePath())){
            //如果是编辑的用户,先删除旧的数据,再保存新的数据
            UploadUtil.deleteFile(ctx,entity.getImagePath());

        }
        //原来没有图片,选了和没选,都可以去更新的时候就不更新,我们在ProductMapper.xml中判断
        if (pic != null) {
            //如果传了图片那么就去保存
            String imagePath = UploadUtil.upload(pic, basePath);
            entity.setImagePath(imagePath);
        }
        Brand brand = brandService.selectByPrimaryKey(entity.getBrandId());
        entity.setBrandName(brand.getName());
        try {
            if (entity.getId() != null) {
                productService.updateByPrimaryKey(entity);
            } else {
                productService.insert(entity);
            }
            return new JsonResult(true, "product");
        } catch (Exception e) {
            e.printStackTrace();
            return new JsonResult("保存失败");
        }
    }

    @RequiredPermission("商品的删除")
    @ResponseBody
    @RequestMapping("delete")
    public JsonResult delete(Long id,String imagePath) throws Exception {
        //删除数据库中的数据的时候,删除图片
        if (!StringUtils.isEmpty(imagePath)) {
            UploadUtil.deleteFile(ctx,imagePath);
        }
        try {
            if (id != null) {
                productService.deleteByPrimaryKey(id);
            }
            return new JsonResult();
        } catch (Exception e) {
            return new JsonResult("删除失败");
        }

    }
    @RequestMapping("selectProduct")
    public String selectProduct(Model model) throws Exception {
        List<Product> result = productService.selectAll();
        model.addAttribute("result", result);
        return "product/selectProduct";
    }
}
