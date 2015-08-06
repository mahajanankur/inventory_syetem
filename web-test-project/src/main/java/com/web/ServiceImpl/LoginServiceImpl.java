package com.web.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.Dao.Users;
import com.web.dto.DtoCustomUser;

@Service("loginService")
public class LoginServiceImpl implements UserDetailsService {

	@Autowired
	private LoginDAOImpl	daoImpl;

	@Transactional(readOnly = true)
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		Users user = daoImpl.findUserByUsername(username);

		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		DtoCustomUser customUser = buildUserForAuthentication(user, authorities);
		return customUser;
	}

	private DtoCustomUser buildUserForAuthentication(Users user,
			List<GrantedAuthority> authorities) {

		return new DtoCustomUser(user.getUsername(), user.getPassword(),
				user.isEnable(), true, true, true, authorities,
				user.getUserId());
	}

}
