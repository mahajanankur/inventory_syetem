package com.web.ServiceImpl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.Dao.UserRole;
import com.web.Dao.Users;
import com.web.dto.DtoCustomUser;

/**
 * @author ankur
 * 
 *         This class is used to authenticate user by spring security's
 *         "user-service-ref" parameter.
 */
@Service("loginService")
public class LoginServiceImpl implements UserDetailsService {

	@Autowired
	private LoginDAOImpl	daoImpl;

	/*
	 * (non-Javadoc)
	 * @see org.springframework.security.core.userdetails.UserDetailsService#
	 * loadUserByUsername(java.lang.String)
	 */
	@Transactional(readOnly = true)
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		Users user = daoImpl.findUserByUsername(username);

		List<GrantedAuthority> authorities = buildUserAuthority(user
				.getUserRole());
		DtoCustomUser customUser = buildUserForAuthentication(user, authorities);
		return customUser;
	}

	/**
	 * This method is used to get role from user's UserRole attribute set and
	 * set it to authorities list.
	 * 
	 * @param userRole
	 * @return authorities
	 */
	private List<GrantedAuthority> buildUserAuthority(Set<UserRole> userRole) {

		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
		// Build user's authorities
		for (UserRole role : userRole) {
			setAuths.add(new SimpleGrantedAuthority(role.getRole()));
		}

		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>(
				setAuths);

		return authorities;
	}

	/**
	 * This method is used to set all the authenticate parameters(users and
	 * user_role table) to DtoCustomUser.
	 * 
	 * @param user
	 * @param authorities
	 * @return DtoCustomUser
	 */
	private DtoCustomUser buildUserForAuthentication(Users user,
			List<GrantedAuthority> authorities) {

		return new DtoCustomUser(user.getUsername(), user.getPassword(),
				user.isEnable(), true, true, true, authorities,
				user.getUserId());
	}

}
