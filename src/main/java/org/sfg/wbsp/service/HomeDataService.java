package org.sfg.wbsp.service;

import org.sfg.wbsp.dao.HomeDataMapper;
import org.sfg.wbsp.model.HomeDataModel;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author huyang8
 * // TODO: 2018/5/16  首页数据汇总service服务类
 */
@Service
public class HomeDataService {

    @Resource
    private HomeDataMapper homeDataMapper;

    private static final SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public HomeDataModel selectHomeData(){
        String nowDate=sdf.format(new Date());
        String nowMonth=nowDate.substring(0,4);
        String nowDay=nowDate.substring(0,10);
        HomeDataModel dataModel=new HomeDataModel();
        dataModel.setTotalCompany(homeDataMapper.selectCountCompany());
        dataModel.setTotalProduct(homeDataMapper.selectCountProduct());
        dataModel.setTotalCustomer(homeDataMapper.selectCountCustomer());
        dataModel.setTotalOrder(homeDataMapper.selectCountOrder());
        dataModel.setTotalOrderPrice(homeDataMapper.selectTotalPrice());
        dataModel.setDayOrderTotalPrice(homeDataMapper.selectTotalPriceByDay(nowDay));
        dataModel.setDayOrderTotalNum(homeDataMapper.selectOrderNumByDay(nowDay));
        dataModel.setNewsInfoModels(homeDataMapper.selectNewsInfoData(nowMonth));
        dataModel.setOrderNewsModels(homeDataMapper.selectOrderNewsData(nowDay));
        return dataModel;
    }
}
