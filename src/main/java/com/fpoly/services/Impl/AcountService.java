package com.fpoly.services.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fpoly.config.testpass;
import com.fpoly.entity.AccountsEntity;
import com.fpoly.entity.Role;
import com.fpoly.repository.IAccountRepository;
import com.fpoly.services.IAccountService;
import com.fpoly.utils.RandomStringUtils;
@Service
public class AcountService implements IAccountService {
	@Autowired
	private IAccountRepository acc;
	@Autowired
	private RandomStringUtils random;
	@Override
	public Map<Long, String> findAll() {
		Map<Long, String> re = new HashMap<Long, String>();
		List<AccountsEntity> entity = acc.findAll();
		for (AccountsEntity item : entity) {
			re.put(item.getId(), item.getUserName());
		}
		return re;
	}

	@Override
	@Transactional
	public Long save(AccountsEntity account) {
		AccountsEntity accountsEntity = new AccountsEntity();
		String generatedString = random.randomString(4);
		if (account.getId() != null) {
			Optional<AccountsEntity> oldAccount = acc.findById(account.getId());
			if (account.getPhoto() == null) {
				account.setPhoto(oldAccount.get().getPhoto());
			}
			accountsEntity = account;
			
			if (!oldAccount.get().getPassword().equals(account.getPassword())) {
				accountsEntity.setPassword(testpass.encrytePassword(account.getPassword()));
			}else {
				accountsEntity.setPassword(oldAccount.get().getPassword());
			}
			
			accountsEntity.setForgotCode(generatedString);
			accountsEntity.setCreateDate(oldAccount.get().getCreateDate());
			acc.save(accountsEntity);
			return accountsEntity.getId();
		} else {
			accountsEntity = account;
			if (account.getRole()==null) {
				accountsEntity.setRole(Role.USER);
			}
			if (account.getPhoto() == null) {
				accountsEntity.setPhoto("/defaultAvatar.jpg");
			}
			accountsEntity.setForgotCode(generatedString);
			accountsEntity.setPassword(testpass.encrytePassword(account.getPassword()));
			acc.save(accountsEntity);
			return accountsEntity.getId();
		}

	}

	@Override
	public AccountsEntity findOne(Long id) {
		Optional<AccountsEntity> opt = acc.findById(id);
		if (opt.isPresent()) {
			return opt.get();
		}
		return null;
	}

	@Override
	public int delete(Long[] ids) {
		
			for (long id : ids) {
			acc.deleteById(id);
			
			}
			return 1;

	}

	@Override
	public Page<AccountsEntity> findAll(Pageable page) {
		return acc.findAll(page);
	}

	@Override
	public Page<AccountsEntity> searchByUserName(String keyString, Pageable page) {
		return acc.findAllByUserNameContaining(keyString, page);
	}

	@Override
	public AccountsEntity findBuyUsername(String userName) {
		
		return acc.findOneByUserName(userName);
	}

	@Override
	public AccountsEntity findBuyEmail(String userName) {
		// TODO Auto-generated method stub
		return acc.findOneByEmail(userName);
	}



}
