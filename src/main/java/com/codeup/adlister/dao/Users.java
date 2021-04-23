package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.sql.SQLException;
import java.util.List;

public interface Users {
    User findByUsername(String username);
    Long insert(User user);
<<<<<<< HEAD
    User deleteUser(long userId);
=======

    void editUser(User username, User username1) throws SQLException;

    User findUserById(long id) throws SQLException;
>>>>>>> main
}
