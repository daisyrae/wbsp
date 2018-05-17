package org.sfg.wbsp.dao;

import org.sfg.wbsp.model.NewsInfoModel;
import org.sfg.wbsp.model.OrderNewsModel;

import java.math.BigDecimal;
import java.util.List;

public interface HomeDataMapper {

    int selectCountCompany();

    int selectCountProduct();

    int selectCountCustomer();

    int selectCountOrder();

    BigDecimal selectTotalPrice();

    //根据日期查看当天的订单总额
    BigDecimal selectTotalPriceByDay(String day);

    //根据日期查看当天的订单量
    int selectOrderNumByDay(String day);

    //根据月份查询
    List<NewsInfoModel> selectNewsInfoData(String month);

    //根据某一天查询
    List<OrderNewsModel> selectOrderNewsData(String day);
}
