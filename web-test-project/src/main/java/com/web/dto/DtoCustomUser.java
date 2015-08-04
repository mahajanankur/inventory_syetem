package com.web.dto;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

public class DtoCustomUser extends User implements UserDetails {

	public DtoCustomUser(String username, String password, boolean enabled,
			boolean accountNonExpired, boolean credentialsNonExpired,
			boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities, int userId) {
		super(username, password, enabled, accountNonExpired,
				credentialsNonExpired, accountNonLocked, authorities);

		this.userId = userId;
	}

	private static final long	serialVersionUID	= 1L;

	private int					userId;

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

}
