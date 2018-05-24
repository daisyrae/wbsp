package org.sfg.wbsp.dao;

import org.sfg.wbsp.domain.Order;

public interface OrderMapper {

    Order selectById(Integer id);

    int insert(Order record);

    int update(Order record);

    int deleteById(Integer id);
}