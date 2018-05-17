package org.sfg.wbsp.service;

import org.sfg.wbsp.dao.ProductCategoryMapper;
import org.sfg.wbsp.domain.ProductCategory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author huyang8
 * // TODO: 2018/5/15  类目service服务类
 */
@Service
public class ProductCategoryService {

    @Resource
    private ProductCategoryMapper productCategoryMapper;

    public List<ProductCategory> selectAll(){return productCategoryMapper.selectAll();}

    public ProductCategory selectById(Integer id){
        return productCategoryMapper.selectById(id);
    }

    public void insert(ProductCategory record){
        productCategoryMapper.insert(record);
    }

    public void update(ProductCategory record){
        productCategoryMapper.update(record);
    }

    public void deleteById(Integer id){
        productCategoryMapper.deleteById(id);
    }

    public List<ProductCategory> selectAllProductCategoryNoSelf(int id) {
        return productCategoryMapper.selectAllProductCategoryNoSelf(id);
    }

    public List<ProductCategory> selectAllProductCategoryByCompanyId(int companyId) {
        return productCategoryMapper.selectAllProductCategoryByCompanyId(companyId);
    }
}
