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

@WebServlet(name = "controllers.EditAdServlet", urlPatterns = "/edit-ads")
public class EditAdServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        long adId = Long.parseLong(request.getParameter("editAd"));
        try {
            request.setAttribute("ad", DaoFactory.getAdsDao().findAdById(adId));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/WEB-INF/edit-ads.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String image = request.getParameter("image");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
//        Ad oldAd = (Ad) request.getSession().getAttribute("ad");
        long id = Long.parseLong(request.getParameter("id"));
        Ad oldAd = null;
        try {
            oldAd = DaoFactory.getAdsDao().findAdById(id);
        } catch (SQLException exception) {
            exception.printStackTrace();
        }

        Ad editAd = new Ad(oldAd.getId(), image, title, description);
        try {
            DaoFactory.getAdsDao().editAd(oldAd, editAd);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getSession().setAttribute("ad", editAd);
        response.sendRedirect("/ads");
    }
}
