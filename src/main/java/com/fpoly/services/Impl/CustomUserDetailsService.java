package com.fpoly.services.Impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.fpoly.dto.MyUser;
import com.fpoly.entity.AccountsEntity;
import com.fpoly.repository.IAccountRepository;


@Service("userDetailsService")
public class CustomUserDetailsService  implements UserDetailsService {

	@Autowired
	private IAccountRepository acc;
	@Override
	public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
		AccountsEntity accEntity = acc.findOneByUserName(username);
		if (accEntity ==null) {
			throw new UsernameNotFoundException("User not found");
		}
		/* String role = accEntity.getRole().name(); */
		  List<GrantedAuthority> authorities  = new ArrayList<>();
		 
			  authorities.add(new SimpleGrantedAuthority(accEntity.getRole().name().toString()));
		
		  
		MyUser myuser  = new MyUser(accEntity.getUserName(),accEntity.getPassword(), true, true, true, true, authorities);
			myuser.setFullName(accEntity.getFullname());
			myuser.setPhoto(accEntity.getPhoto());
			myuser.setRole(accEntity.getRole().name().toString());
		return myuser;
	}

}
