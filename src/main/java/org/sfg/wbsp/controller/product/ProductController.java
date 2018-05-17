package org.sfg.wbsp.controller.product;

import org.codehaus.plexus.util.StringUtils;
import org.sfg.wbsp.controller.base.BaseController;
import org.sfg.wbsp.domain.Product;
import org.sfg.wbsp.model.AjaxResult;
import org.sfg.wbsp.service.ProductService;
import org.sfg.wbsp.util.FileUploadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;

/**
 * @author huyang8
 * // TODO: 2018/5/10  商品管理controller
 */
@Controller
@RequestMapping("/product")
public class ProductController extends BaseController {

    @Resource
    private ProductService productService;

    @RequestMapping("/productManager.do")
    public String productManager() {
        return "/product/productManager";
    }

    @RequestMapping("/selectAllProduct.do")
    @ResponseBody
    public AjaxResult selectAllProduct() {
        return successData(productService.selectAll());
    }

    @RequestMapping("/findProduct.do")
    @ResponseBody
    public AjaxResult findProduct(int id) {
        return successData(productService.selectById(id));
    }

    @RequestMapping("/saveProduct.do")
    @ResponseBody
    public AjaxResult saveProduct(@RequestParam(value = "id", required = false) String id,
                                  String companyId,
                                  String categoryId,
                                  @RequestParam(value = "attributeId", required = false) String attributeId,
                                  String name,
                                  BigDecimal price,
                                  String memo,
                                  @RequestParam(value = "picFile", required = false) MultipartFile file,
                                  HttpServletRequest request) {
        Product product = new Product();
        product.setCompanyId(Integer.parseInt(companyId));
        product.setCategoryId(Integer.parseInt(categoryId));
        if (StringUtils.isNotEmpty(attributeId)) {
            product.setAttributeId(Integer.parseInt(attributeId));
        }
        product.setName(name);
        product.setPrice(price);
        product.setMemo(memo);
        product.setPic(FileUploadUtil.uploadFile(file, request, "product"));
        if (StringUtils.isEmpty(id)) {
            productService.insert(product);
        } else {
            product.setId(Integer.parseInt(id));
            productService.update(product);
        }
        return success();
    }

    @RequestMapping("/deleteProduct.do")
    @ResponseBody
    public AjaxResult deleteProduct(int id) {
        productService.deleteById(id);
        return success();
    }
}
