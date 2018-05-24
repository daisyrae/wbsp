package org.sfg.wbsp.service;

import org.sfg.wbsp.dao.OrderMapper;
import org.sfg.wbsp.domain.Order;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class OrderService {

    @Resource
    private OrderMapper orderMapper;

    public Order selectById(Integer id) {
        return orderMapper.selectById(id);
    }

    public void insert(Order record) {
        orderMapper.insert(record);
    }

    public void update(Order record) {
        orderMapper.update(record);
    }

    public void deleteById(Integer id) {
        orderMapper.deleteById(id);
    }
}
