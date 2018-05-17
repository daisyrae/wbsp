package org.sfg.wbsp.dao;

import org.sfg.wbsp.domain.ProductAttribute;

import java.util.List;

public interface ProductAttributeMapper {

    List<ProductAttribute> selectAll();

    ProductAttribute selectById(Integer id);

    int insert(ProductAttribute record);

    int update(ProductAttribute record);

    int deleteId(Integer id);

    List<ProductAttribute> selectAllProductAttributeByCompanyId(int companyId);
}