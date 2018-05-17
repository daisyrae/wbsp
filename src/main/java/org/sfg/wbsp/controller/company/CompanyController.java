package org.sfg.wbsp.controller.company;

import org.sfg.wbsp.controller.base.BaseController;
import org.sfg.wbsp.domain.Company;
import org.sfg.wbsp.model.AjaxResult;
import org.sfg.wbsp.service.CompanyService;
import org.sfg.wbsp.util.FileUploadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
    public String manager() {
        return "/company/companyManager";
    }

    @RequestMapping("/selectAll.do")
    @ResponseBody
    public AjaxResult selectAll() {
        return successData(companyService.selectAll());
    }

    @RequestMapping("/findCompany.do")
    @ResponseBody
    public AjaxResult findCompany(int id) {
        return successData(companyService.selectById(id));
    }

    @RequestMapping("/saveCompany.do")
    @ResponseBody
    public AjaxResult saveCompany1(@RequestParam(value = "id", required = false) String id,
                                   String name,
                                   String define,
                                   String address,
                                   @RequestParam(value = "logoFile", required = false) MultipartFile file,
                                   HttpServletRequest request) {
        Company company = new Company();
        company.setName(name);
        company.setDefine(Integer.parseInt(define));
        company.setAddress(address);
        company.setLogo(FileUploadUtil.uploadFile(file, request, "company"));
        if (StringUtils.isEmpty(id)) {
            //新增数据
            companyService.insert(company);
        } else {
            //修改数据
            company.setId(Integer.parseInt(id));
            companyService.update(company);
        }
        return success();
    }

    @RequestMapping("/deleteCompany.do")
    @ResponseBody
    public AjaxResult deleteCompany(int id) {
        companyService.deleteById(id);
        return success();
    }
}
