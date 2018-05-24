package org.sfg.wbsp.dao;

import org.sfg.wbsp.domain.Customer;

public interface CustomerMapper {

    Customer selectById(Integer id);

    int insert(Customer record);

    int update(Customer record);

    int deleteById(Integer id);
}