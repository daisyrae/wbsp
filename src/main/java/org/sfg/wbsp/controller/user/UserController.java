package org.sfg.wbsp.controller.user;

import org.sfg.wbsp.controller.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author huyang8
 * // TODO: 2018/5/10  用户管理controller
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @RequestMapping("/manager.do")
    public String manager(){
        return "/user/userManager";
    }
}
