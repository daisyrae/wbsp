package org.sfg.wbsp.dao;

import org.sfg.wbsp.domain.Company;

import java.util.List;

public interface CompanyMapper {
    List<Company> selectAll();

    Company selectById(Integer id);

    int insert(Company record);

    int update(Company record);

    int deleteById(Integer id);
}