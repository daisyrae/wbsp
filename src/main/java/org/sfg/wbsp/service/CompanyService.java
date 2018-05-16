package org.sfg.wbsp.service;

import org.sfg.wbsp.dao.CompanyMapper;
import org.sfg.wbsp.domain.Company;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author huyang8
 * // TODO: 2018/5/10  商家service服务类
 */
@Service
public class CompanyService {

    @Resource
    private CompanyMapper companyMapper;

    public List<Company> selectAll(){
        return companyMapper.selectAll();
    }

    public Company selectById(Integer id){
        return companyMapper.selectById(id);
    }

    public void insert(Company record){
        companyMapper.insert(record);
    }

    public void update(Company record){
        companyMapper.update(record);
    }

    public void deleteById(Integer id){
        companyMapper.deleteById(id);
    }

    public int selectAllCount(){
        return companyMapper.selectAllCount();
    }
}
