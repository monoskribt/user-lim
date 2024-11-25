package com.limited_user.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    @GetMapping("/home")
    public String welcomePage() {
        return "Welcome in my home page";
    }

    @GetMapping("/user")
    public String userPage() {
        return "USER PAGE";
    }

    @GetMapping("/admin")
    public String adminPage() {
        return "ADMIN PAGE";
    }

}
