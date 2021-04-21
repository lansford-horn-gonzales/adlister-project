package com.codeup.adlister.controllers;


import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name="controllers.SearchAdsServlet", urlPatterns= "/ads/search")
public class SearchAdsServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String searchAds = request.getParameter("search");

        List<Ad> foundAds = DaoFactory.getAdsDao().searchAdsFromResults(searchAds);


        request.getRequestDispatcher("/WEB-INF/ads/search.jsp");

    }

}
