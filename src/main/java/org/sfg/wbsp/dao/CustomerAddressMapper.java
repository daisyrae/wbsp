package org.sfg.wbsp.dao;

import org.sfg.wbsp.domain.CustomerAddress;

public interface CustomerAddressMapper {

    CustomerAddress selectById(Integer id);

    int insert(CustomerAddress record);

    int update(CustomerAddress record);

    int deleteById(Integer id);
}