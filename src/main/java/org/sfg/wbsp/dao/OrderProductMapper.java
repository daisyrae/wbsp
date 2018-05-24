package org.sfg.wbsp.dao;

import org.sfg.wbsp.domain.OrderProduct;

public interface OrderProductMapper {

    OrderProduct selectById(Integer id);

    int insert(OrderProduct record);

    int update(OrderProduct record);

    int deleteById(Integer id);
}