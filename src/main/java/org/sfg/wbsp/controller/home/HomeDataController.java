package org.sfg.wbsp.controller.home;

import org.sfg.wbsp.controller.base.BaseController;
import org.sfg.wbsp.model.AjaxResult;
import org.sfg.wbsp.service.HomeDataService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author huyang8
 * // TODO: 2018/5/16  首页数据controller
 */
@Controller
@RequestMapping("/homeData")
public class HomeDataController extends BaseController {

    @Resource
    private HomeDataService homeDataService;

    @RequestMapping("/selectHomeData.do")
    @ResponseBody
    public AjaxResult selectHomeData(){
        return successData(homeDataService.selectHomeData());
    }
}
