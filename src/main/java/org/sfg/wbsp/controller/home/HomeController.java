package org.sfg.wbsp.controller.home;

import org.sfg.wbsp.controller.base.BaseController;
import org.sfg.wbsp.domain.User;
import org.sfg.wbsp.model.AjaxResult;
import org.sfg.wbsp.model.Constant;
import org.sfg.wbsp.service.UserService;
import org.sfg.wbsp.util.PasswordUtil;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @author huyang8
 * // TODO: 2018/5/10  首页controller
 */
@Controller
@RequestMapping("")
public class HomeController extends BaseController {

    @Resource
    private UserService userService;

    /**
     * 登录页
     */
    @RequestMapping("/login.do")
    public String login(){
        return "/home/login";
    }

    /**
     * 登录鉴权
     * @param session session
     * @param account 账号
     * @param pwd 密码
     */
    @RequestMapping("/home.do")
    @ResponseBody
    public AjaxResult home(HttpSession session, String account, String pwd){
        User user=userService.checkUser(account);
        if(ObjectUtils.isEmpty(user)){
            return failMessage(Constant.NOT_EXIST);
        }
        //管理员权限
        if(!ObjectUtils.isEmpty(user)&&1==user.getRole()&&pwd.equals(user.getPwd())){
            session.setAttribute(Constant.SESSION_KEY,user);
            return success();
        }
        //验证用户账号是否正确
        if(!ObjectUtils.isEmpty(user)&&!PasswordUtil.encrypt(pwd).equals(user.getPwd())){
            return failMessage(Constant.LOGIN_ERROR);
        }else{
            session.setAttribute(Constant.SESSION_KEY,user);
            return success();
        }
    }

    /**
     * 跳转主页
     */
    @RequestMapping("/index.do")
    public String index(){
        return "/home/index";
    }

    /**
     * 退出系统
     */
    @RequestMapping("/logout.do")
    public String logout(HttpSession session){
        //退出系统时清除session
        session.invalidate();
        return "redirect:login.do";
    }
}
