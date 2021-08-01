package com.fpoly.services;

import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.fpoly.entity.AccountsEntity;

public interface IAccountService {
	Map<Long,String> findAll();
	Long save(AccountsEntity accountsEntity);
	AccountsEntity findOne(Long id);
	int delete(Long [] ids);
	Page<AccountsEntity> findAll(Pageable page);
	Page<AccountsEntity> searchByUserName(String keyString,Pageable page);
	AccountsEntity findBuyUsername(String userName);
	AccountsEntity findBuyEmail(String userName);

}
