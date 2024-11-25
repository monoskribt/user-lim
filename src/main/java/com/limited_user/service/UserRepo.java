package com.limited_user.service;

import com.limited_user.entity.CustomUser;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepo extends JpaRepository<CustomUser, Integer> {

    Optional<CustomUser> findByName(String email);

}
