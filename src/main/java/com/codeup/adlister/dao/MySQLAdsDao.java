package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
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
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        System.out.println(ad);
        try {
            String insertQuery = "INSERT INTO ads(user_id, image, title, description) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getImage());
            stmt.setString(3, ad.getTitle());
            stmt.setString(4, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public void delete(long id) {
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement("DELETE FROM ads WHERE id='" + id + "'");
            stmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error deleting ad.");
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("image"),
                rs.getString("title"),
                rs.getString("description")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }


    //    searchAds
    @Override
    public List<Ad> searchAdsFromResults(String searchInput) throws SQLException {
        try {
            String searchQuery = "SELECT * FROM ads WHERE title LIKE ? OR description LIKE ?";
            String searchQueryPlus = "%" + searchInput + "%";
            PreparedStatement stmt = connection.prepareStatement(searchQuery);
            stmt.setString(1, searchQueryPlus);
            stmt.setString(2, searchQueryPlus);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("No ads match your search.", e);
        }
    }


    public void editAd(Ad oldAd, Ad newAd) throws SQLException {
        String updateQuery = ("update ads set image = ?, title = ?, description = ? where title = ?");
        try {
            PreparedStatement stmt = connection.prepareStatement(updateQuery);
            stmt.setString(1, newAd.getImage());
            stmt.setString(2, newAd.getTitle());
            stmt.setString(3, newAd.getDescription());
            stmt.setString(4, oldAd.getTitle());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Can't update ad", e);
        }
    }

    public Ad findAdById(long id) {
        String query = ("select * from ads where id = ? limit 1");
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return extractAd(rs);
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException("Can't find ad by id", e);
        }
    }

    @Override
    public List<Ad> searchAdsByUser(long id) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE user_id=?");
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);

        }
    }

//    public Ad adPageDisplayOneAd(long id) {
//        String query = ("SELECT * FROM ads WHERE id = ?");
//        try {
//            PreparedStatement stmt = connection.prepareStatement(query);
//            stmt.executeUpdate(String.valueOf(id));
//            Ad ad = stmt.executeQuery(rs);
//            return ad;
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
}
