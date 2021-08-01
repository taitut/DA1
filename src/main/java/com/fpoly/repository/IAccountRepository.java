package com.fpoly.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.fpoly.entity.AccountsEntity;

public interface IAccountRepository extends JpaRepository<AccountsEntity, Long> {
	Page<AccountsEntity>findAllByUserNameContaining (String name, Pageable pageable);
	AccountsEntity findOneByUserName(String name);
	AccountsEntity findOneByEmail(String name);

}
