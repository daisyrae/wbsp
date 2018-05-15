package org.sfg.wbsp.controller.user;

import org.sfg.wbsp.controller.base.BaseController;
import org.sfg.wbsp.model.AjaxResult;
import org.sfg.wbsp.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author huyang8
 * // TODO: 2018/5/10  用户管理controller
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Resource
    private UserService userService;

    @RequestMapping("/manager.do")
    public String manager(){
        return "/user/userManager";
    }

    @RequestMapping("/selectAll")
    @ResponseBody
    public AjaxResult selectAll(){
        return successData(userService.selectAll());
    }

    @RequestMapping("/deleteUser")
    @ResponseBody
    public AjaxResult deleteUser(int id){
        userService.deleteById(id);
        return success();
    }
}
