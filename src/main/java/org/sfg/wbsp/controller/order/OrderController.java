package org.sfg.wbsp.controller.order;

import org.sfg.wbsp.controller.base.BaseController;
import org.sfg.wbsp.domain.Order;
import org.sfg.wbsp.model.AjaxResult;
import org.sfg.wbsp.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {

    @Resource
    private OrderService orderService;

    @RequestMapping("/orderManager.do")
    public String orderManager(){
        return "/order/orderManager";
    }

    @RequestMapping("/saveOrder.do")
    @ResponseBody
    public AjaxResult saveOrder(Order order){
        if(ObjectUtils.isEmpty(order.getId())){
            orderService.insert(order);
        }else{
            orderService.update(order);
        }
        return success();
    }

    @RequestMapping("/deleteOrder.do")
    @ResponseBody
    public AjaxResult deleteOrder(int id){
        orderService.deleteById(id);
        return success();
    }
}
