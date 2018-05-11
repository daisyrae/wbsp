package org.sfg.wbsp.controller.base;

import org.sfg.wbsp.model.AjaxResult;

/**
 * @author huyang8
 * // TODO: 2018/5/10 基础controller
 */
public abstract class BaseController {

    protected <T> AjaxResult successData(T data){
        AjaxResult ajaxResult=new AjaxResult();
        ajaxResult.setData(data);
        ajaxResult.setMessage(null);
        ajaxResult.setCode(200);
        return ajaxResult;
    }

    protected AjaxResult successMessage(String message){
        AjaxResult ajaxResult=new AjaxResult();
        ajaxResult.setMessage(message);
        ajaxResult.setCode(200);
        return ajaxResult;
    }

    protected AjaxResult failMessage(String message){
        AjaxResult ajaxResult=new AjaxResult();
        ajaxResult.setMessage(message);
        ajaxResult.setCode(500);
        return ajaxResult;
    }

    protected AjaxResult errorMessage(){
        AjaxResult ajaxResult=new AjaxResult();
        ajaxResult.setMessage("服务异常，请稍后重试！");
        ajaxResult.setCode(500);
        return ajaxResult;
    }
}
