package org.sfg.wbsp.service;

import org.sfg.wbsp.dao.OrderProductMapper;
import org.sfg.wbsp.domain.OrderProduct;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class OrderProductService {

    @Resource
    private OrderProductMapper orderProductMapper;

    public OrderProduct selectById(Integer id) {
        return orderProductMapper.selectById(id);
    }

    public void insert(OrderProduct record) {
        orderProductMapper.insert(record);
    }

    public void update(OrderProduct record) {
        orderProductMapper.update(record);
    }

    public void deleteById(Integer id) {
        orderProductMapper.deleteById(id);
    }
}
