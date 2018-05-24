package org.sfg.wbsp.controller.customer;

import org.sfg.wbsp.controller.base.BaseController;
import org.sfg.wbsp.domain.Customer;
import org.sfg.wbsp.model.AjaxResult;
import org.sfg.wbsp.service.CustomerService;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author huyang8
 * // TODO: 2018/5/22  客户controller
 */
@Controller
@RequestMapping("/customer")
public class CustomerController extends BaseController {

    @Resource
    private CustomerService customerService;

    @RequestMapping("/customerManager.do")
    public String customerManager(){
        return "/customer/customerManager";
    }

    @RequestMapping("/saveCustomer.do")
    @ResponseBody
    public AjaxResult saveCustomer(Customer customer){
        if(ObjectUtils.isEmpty(customer.getId())){
            customerService.insert(customer);
        }else{
            customerService.update(customer);
        }
        return success();
    }

    @RequestMapping("/deleteCustomer.do")
    @ResponseBody
    public AjaxResult deleteCustomer(int id){
        customerService.deleteById(id);
        return success();
    }
}
