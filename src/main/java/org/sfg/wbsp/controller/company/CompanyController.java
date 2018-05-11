package org.sfg.wbsp.controller.company;

import org.sfg.wbsp.controller.base.BaseController;
import org.sfg.wbsp.model.AjaxResult;
import org.sfg.wbsp.service.CompanyService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author huyang8
 * // TODO: 2018/5/10  商家管理controller
 */
@Controller
@RequestMapping("/company")
public class CompanyController extends BaseController {

    @Resource
    private CompanyService companyService;

    @RequestMapping("/manager.do")
    public String manager(){
        return "/company/companyManager";
    }

    @RequestMapping("/selectAll.do")
    @ResponseBody
    public AjaxResult selectAll(){
        return successData(companyService.selectAll());
    }
}
