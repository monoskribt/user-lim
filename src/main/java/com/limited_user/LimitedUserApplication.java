package com.limited_user;

import com.limited_user.entity.Authority;
import com.limited_user.entity.CustomUser;
import com.limited_user.service.UserRepo;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;

@SpringBootApplication
public class LimitedUserApplication {

	public static void main(String[] args) {
		SpringApplication.run(LimitedUserApplication.class, args);
	}

}
