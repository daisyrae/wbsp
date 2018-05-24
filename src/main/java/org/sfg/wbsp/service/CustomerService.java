package org.sfg.wbsp.service;

import org.sfg.wbsp.dao.CustomerMapper;
import org.sfg.wbsp.domain.Customer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CustomerService {

    @Resource
    private CustomerMapper customerMapper;

    public Customer selectById(Integer id) {
        return customerMapper.selectById(id);
    }

    public void insert(Customer record) {
        customerMapper.insert(record);
    }

    public void update(Customer record) {
        customerMapper.update(record);
    }

    public void deleteById(Integer id) {
        customerMapper.deleteById(id);
    }
}
