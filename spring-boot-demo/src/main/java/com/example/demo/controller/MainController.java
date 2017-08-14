package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;

/**
 * @author Alfonsus Manggala N Subiakto
 */
@RestController
public class MainController {

  @Autowired
  private UserRepository repository;

  @RequestMapping("/user")
  public List<User> getAll() {
    return repository.findAll();
  }

  @RequestMapping("/hello")
  public String hello() {
    return "Hello World!";
  }
}
