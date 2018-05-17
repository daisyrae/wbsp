package org.sfg.wbsp.dao;

import org.sfg.wbsp.domain.ProductCategory;

import java.util.List;

public interface ProductCategoryMapper {
    List<ProductCategory> selectAll();

    ProductCategory selectById(Integer id);

    int insert(ProductCategory record);

    int update(ProductCategory record);

    int deleteById(Integer id);

    List<ProductCategory> selectAllProductCategoryNoSelf(int id);

    List<ProductCategory> selectAllProductCategoryByCompanyId(int companyId);
}