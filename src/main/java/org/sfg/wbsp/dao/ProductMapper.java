package org.sfg.wbsp.dao;

import org.sfg.wbsp.domain.Product;

import java.util.List;

public interface ProductMapper {

    List<Product> selectAll();

    Product selectById(Integer id);

    int insert(Product record);

    int update(Product record);

    int deleteById(Integer id);
}