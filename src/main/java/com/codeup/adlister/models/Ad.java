package com.codeup.adlister.models;

public class Ad {
    private long id;
    private long userId;
    private String image;
    private String title;
    private String description;

    public Ad(long id, long userId, String image, String title, String description) {
        this.id = id;
        this.userId = userId;
        this.image = image;
        this.title = title;
        this.description = description;
    }

    public Ad(long id, String image, String title, String description) {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getImage() { return image; }

    public void setImage() { this.image = image; }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
