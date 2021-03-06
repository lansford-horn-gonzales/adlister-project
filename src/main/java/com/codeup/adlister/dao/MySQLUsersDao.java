package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;

public class MySQLUsersDao implements Users {
    private Connection connection;

    public MySQLUsersDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUsername(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }


    @Override
    public User findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

    @Override
    public Long insert(User user) {
        String query = "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

    private User extractUser(ResultSet rs) throws SQLException {
        if (!rs.next()) {
            return null;
        }
        return new User(
                rs.getLong("id"),
                rs.getString("username"),
                rs.getString("email"),
                rs.getString("password")
        );
    }


    public void deleteUser(long userID) {
        try {
            String query = "DELETE FROM users WHERE id=?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, userID);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("No user match.", e);
        }
    }

//Editing ad by using oldUser and inserting new info into new User.
    public void editUser(User oldUser, User newUser) throws SQLException {
        String updateUserQuery = ("Update users set username = ?, email = ? where username = ?");
        try {
            PreparedStatement stmt = connection.prepareStatement(updateUserQuery);
            stmt.setString(1, newUser.getUsername());
            stmt.setString(2, newUser.getEmail());
            stmt.setString(3, oldUser.getUsername());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Can't update profile", e);
        }
    }

//searching an User by its id.
    public User findUserById(long id) {
        String query = ("SELECT * FROM users WHERE id = ? LIMIT 1");
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Can't find user by id", e);
        }
    }

}

