package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.User;

/**
 * @author Alfonsus Manggala N Subiakto
 */
public interface UserRepository extends JpaRepository<User, String> {}
