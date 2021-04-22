package com.codeup.adlister.controllers;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServlet request, HttpServletResponse response) throws IOException {
        public static long delete(long id) {
            int i = 0;
            try {
                Connection conn = JDBCDataSource.getConnection();
                PreparedStatement stmt = conn.prepareStatement("DELETE from user where id=?");
                stmt.setLong(1, id);
                i = stmt.executeUpdate();
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return i;
        }
    }
}
