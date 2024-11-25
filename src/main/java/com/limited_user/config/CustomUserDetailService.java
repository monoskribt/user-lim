package com.limited_user.config;

import com.limited_user.entity.CustomUser;
import com.limited_user.service.UserRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CustomUserDetailService implements UserDetailsService {

    private final UserRepo userRepo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        CustomUser user = userRepo.findByName(username).orElseThrow(
                () -> new UsernameNotFoundException("User details is not correct: " + username));

        List<GrantedAuthority> grantedAuthorityList = user
                .getAuthorities().stream()
                .map(auth -> new SimpleGrantedAuthority("ROLE_" + auth.getName()))
                .collect(Collectors.toList());

        return new User(user.getName(), user.getPassword(), grantedAuthorityList);
    }
}
