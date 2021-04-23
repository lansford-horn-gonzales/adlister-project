package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "DeleteAdServlet", urlPatterns = "/register")
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServlet request, HttpServletResponse response) throws IOException {
        long userId = (User)request.getParameter();

        DaoFactory.getUsersDao().deleteUser(userId);
        response.sendRedirect("/register");
    }
}