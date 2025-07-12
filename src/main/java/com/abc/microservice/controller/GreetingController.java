package com.abc.microservice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingController {
    @GetMapping("/")
    public String home() {
        return "Welcome to the Spring Boot Microservice!";
    }
    @GetMapping("/greeting")
    public String getGreeting() {
        return "Hello, World!";
    }
}