package org.sfg.wbsp.controller.order;

import org.sfg.wbsp.controller.base.BaseController;
import org.sfg.wbsp.domain.OrderProduct;
import org.sfg.wbsp.model.AjaxResult;
import org.sfg.wbsp.service.OrderProductService;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/orderProduct")
public class OrderProductController extends BaseController {

    @Resource
    private OrderProductService orderProductService;

    @RequestMapping("/orderProductManager.do")
    public String orderProductManager(){
        return "/order/orderProductManager";
    }

    @RequestMapping("/saveOrderProduct.do")
    @ResponseBody
    public AjaxResult saveOrderProduct(OrderProduct orderProduct){
        if(ObjectUtils.isEmpty(orderProduct.getId())){
            orderProductService.insert(orderProduct);
        }else{
            orderProductService.update(orderProduct);
        }
        return success();
    }

    @RequestMapping("/deleteOrderProduct.do")
    @ResponseBody
    public AjaxResult deleteOrderProduct(int id){
        orderProductService.deleteById(id);
        return success();
    }
}
