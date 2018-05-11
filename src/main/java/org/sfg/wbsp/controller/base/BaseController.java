package org.sfg.wbsp.controller.base;

import org.sfg.wbsp.model.AjaxResult;
import org.sfg.wbsp.model.Constant;

/**
 * @author huyang8
 * // TODO: 2018/5/10 基础controller
 */
public abstract class BaseController {

    protected <T> AjaxResult successData(T data){
        AjaxResult result=new AjaxResult();
        result.setCode(Constant.SUCCESS_CODE);
        result.setData(data);
        return result;
    }

    protected AjaxResult success(){
        AjaxResult result=new AjaxResult();
        result.setCode(Constant.SUCCESS_CODE);
        return result;
    }

    protected AjaxResult failMessage(String message){
        AjaxResult result=new AjaxResult();
        result.setCode(Constant.FAIL_CODE);
        result.setMessage(message);
        return result;
    }

    protected AjaxResult error(){
        AjaxResult result=new AjaxResult();
        result.setCode(Constant.FAIL_CODE);
        result.setMessage(Constant.ERROR_MESSAGE);
        return result;
    }
}
