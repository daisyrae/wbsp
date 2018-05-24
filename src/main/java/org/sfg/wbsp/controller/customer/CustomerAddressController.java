package org.sfg.wbsp.controller.customer;

import org.sfg.wbsp.controller.base.BaseController;
import org.sfg.wbsp.domain.CustomerAddress;
import org.sfg.wbsp.model.AjaxResult;
import org.sfg.wbsp.service.CustomerAddressService;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author huyang8
 * // TODO: 2018/5/22  客户收货地址controller
 */
@Controller
@RequestMapping("/customerAddress")
public class CustomerAddressController extends BaseController {

    @Resource
    private CustomerAddressService customerAddressService;

    @RequestMapping("/customerAddressManager.do")
    public String customerAddressManager(){
        return "/customer/customerAddressManager";
    }

    @RequestMapping("/saveCustomerAddress.do")
    @ResponseBody
    public AjaxResult saveCustomerAddress(CustomerAddress customerAddress){
        if(ObjectUtils.isEmpty(customerAddress.getId())){
            customerAddressService.insert(customerAddress);
        }else{
            customerAddressService.update(customerAddress);
        }
        return success();
    }

    @RequestMapping("/deleteCustomerAddress.do")
    @ResponseBody
    public AjaxResult deleteCustomerAddress(int id){
        customerAddressService.deleteById(id);
        return success();
    }


}
