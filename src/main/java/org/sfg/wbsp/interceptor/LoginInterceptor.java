package org.sfg.wbsp.interceptor;

import org.sfg.wbsp.domain.User;
import org.sfg.wbsp.model.Constant;
import org.sfg.wbsp.service.UserService;
import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author huyang8
 * // TODO: 2018/5/10  登录拦截器，校验用户登录session
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Resource
    private UserService userService;

    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //创建session
        HttpSession session = httpServletRequest.getSession();
        //拦截并校验登录用户TOKEN
        User user = (User) session.getAttribute(Constant.SESSION_KEY);
        if (ObjectUtils.isEmpty(user)) {
            //未登录则跳转到登录页
            httpServletResponse.sendRedirect("/login.do");
            return false;
        }else{
            //校验session是否合法有效
            User findUser=userService.checkUser(user.getAccount());
            if(ObjectUtils.isEmpty(findUser)||!findUser.getPwd().equals(user.getPwd())){
                //非法token跳转登录页
                httpServletResponse.sendRedirect("/login.do");
                return false;
            }
        }
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
