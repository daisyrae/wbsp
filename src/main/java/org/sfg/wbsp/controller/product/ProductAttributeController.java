package org.sfg.wbsp.controller.product;

import org.sfg.wbsp.controller.base.BaseController;
import org.sfg.wbsp.domain.ProductAttribute;
import org.sfg.wbsp.model.AjaxResult;
import org.sfg.wbsp.service.ProductAttributeService;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author huyang8
 * // TODO: 2018/5/10  属性管理controller
 */
@Controller
@RequestMapping("/product")
public class ProductAttributeController extends BaseController {

    @Resource
    private ProductAttributeService productAttributeService;

    @RequestMapping("/productAttributeManager.do")
    public String productCategoryManager(){
        return "/product/productAttributeManager";
    }

    @RequestMapping("/selectAllProductAttribute.do")
    @ResponseBody
    public AjaxResult selectAllProductAttribute(){
        return successData(productAttributeService.selectAll());
    }

    @RequestMapping("/saveProductAttribute.do")
    @ResponseBody
    public AjaxResult saveProductAttribute(ProductAttribute productAttribute){
        if(ObjectUtils.isEmpty(productAttribute.getId())){
            productAttributeService.insert(productAttribute);
        }else{
            productAttributeService.update(productAttribute);
        }
        return success();
    }

    @RequestMapping("/deleteProductAttribute.do")
    @ResponseBody
    public AjaxResult deleteProductAttribute(int id){
        productAttributeService.deleteId(id);
        return success();
    }
}
