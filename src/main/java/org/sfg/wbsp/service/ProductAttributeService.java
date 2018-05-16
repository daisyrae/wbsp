package org.sfg.wbsp.service;

import org.sfg.wbsp.dao.ProductAttributeMapper;
import org.sfg.wbsp.domain.ProductAttribute;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author huyang8
 * // TODO: 2018/5/15  属性service服务类
 */
@Service
public class ProductAttributeService {

    @Resource
    private ProductAttributeMapper productAttributeMapper;

    public List<ProductAttribute> selectAll(){
        return productAttributeMapper.selectAll();
    }

    public ProductAttribute selectById(Integer id){
        return productAttributeMapper.selectById(id);
    }

    public void insert(ProductAttribute record){
        productAttributeMapper.insert(record);
    }

    public void update(ProductAttribute record){
        productAttributeMapper.update(record);
    }

    public void deleteId(Integer id){
        productAttributeMapper.deleteId(id);
    }
}
