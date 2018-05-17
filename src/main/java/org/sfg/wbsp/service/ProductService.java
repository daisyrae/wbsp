package org.sfg.wbsp.service;

import org.sfg.wbsp.dao.ProductMapper;
import org.sfg.wbsp.domain.Product;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author huyang8
 * // TODO: 2018/5/15  商品service服务类
 */
@Service
public class ProductService {

    @Resource
    private ProductMapper productMapper;

    public List<Product> selectAll(){
        return productMapper.selectAll();
    }

    public Product selectById(Integer id){
        return productMapper.selectById(id);
    }

    public void insert(Product record){
        productMapper.insert(record);
    }

    public void update(Product record){
        productMapper.update(record);
    }

    public void deleteById(Integer id){
        productMapper.deleteById(id);
    }
}
