package org.sfg.wbsp.controller.product;

import org.sfg.wbsp.controller.base.BaseController;
import org.sfg.wbsp.domain.ProductCategory;
import org.sfg.wbsp.model.AjaxResult;
import org.sfg.wbsp.service.ProductCategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author huyang8
 * // TODO: 2018/5/10  类目管理controller
 */
@Controller
@RequestMapping("/product")
public class ProductCategoryController extends BaseController {

    @Resource
    private ProductCategoryService productCategoryService;

    @RequestMapping("/productCategoryManager.do")
    public String productCategoryManager(){
        return "/product/productCategoryManager";
    }

    @RequestMapping("/selectAllProductCategoryNoSelf.do")
    @ResponseBody
    public AjaxResult selectAllProductCategoryNoSelf(@RequestParam(value = "id",required = false)String id){
        if(StringUtils.isEmpty(id)){
            return successData(productCategoryService.selectAll());
        }else{
            return successData(productCategoryService.selectAllProductCategoryNoSelf(Integer.parseInt(id)));
        }
    }

    @RequestMapping("/selectAllProductCategory.do")
    @ResponseBody
    public AjaxResult selectAllProductCategory(){
        return successData(productCategoryService.selectAll());
    }

    @RequestMapping("/saveProductCategory.do")
    @ResponseBody
    public AjaxResult saveProductCategory(ProductCategory productCategory){
        if(ObjectUtils.isEmpty(productCategory.getId())){
            productCategoryService.insert(productCategory);
        }else{
            productCategoryService.update(productCategory);
        }
        return success();
    }

    @RequestMapping("/findProductCategory.do")
    @ResponseBody
    public AjaxResult findProductCategory(int id){
        return successData(productCategoryService.selectById(id));
    }

    @RequestMapping("/deleteProductCategory.do")
    @ResponseBody
    public AjaxResult deleteProductCategory(int id){
        productCategoryService.deleteById(id);
        return success();
    }
}
