package org.sfg.wbsp.service;

import org.sfg.wbsp.dao.CustomerAddressMapper;
import org.sfg.wbsp.domain.CustomerAddress;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CustomerAddressService {

    @Resource
    private CustomerAddressMapper customerAddressMapper;

    public CustomerAddress selectById(Integer id) {
        return customerAddressMapper.selectById(id);
    }

    public void insert(CustomerAddress record) {
        customerAddressMapper.insert(record);
    }

    public void update(CustomerAddress record) {
        customerAddressMapper.update(record);
    }

    public void deleteById(Integer id) {
        customerAddressMapper.deleteById(id);
    }
}
