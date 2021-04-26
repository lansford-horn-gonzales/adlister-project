package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/show-ad")
public class AdPageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long adId = Long.parseLong(request.getParameter("selected-ad"));
        try {
            request.setAttribute("ad", DaoFactory.getAdsDao().findAdById(adId));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/WEB-INF/ad-page.jsp").forward(request, response);


//        String selectedAd = request.getParameter("selected-ad");
//        Ad ad = null;
//
//        try {
//            ad = DaoFactory.getAdsDao().findAdById();
//        } catch (
//
//        )

//        request.setAttribute("ads", DaoFactory.getAdsDao().findAdById(adID).getId());
//        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String image = request.getParameter("image");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        long id = Long.parseLong(request.getParameter("id"));
        Ad showAd = new Ad(id, image, title, description);
        response.sendRedirect("/ad-page.jsp");
    }
}