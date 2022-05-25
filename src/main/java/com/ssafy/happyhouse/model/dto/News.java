package com.ssafy.happyhouse.model.dto;


public class News {
	String title;
	String titleLink;
	String date;
	String imgURL;
	String body;
	String bodyLink;
	String relatedKey;
	public News() {}
	
	public News(String title, String titleLink, String date, String imgURL, String body, String bodyLink) {
		this.title = title;
		this.titleLink = titleLink;
		this.date = date;
		this.imgURL = imgURL;
		this.body = body;
		this.bodyLink = bodyLink;
	}
	
	public String getRelatedKey() {
		return relatedKey;
	}

	public void setRelatedKey(String relatedKey) {
		this.relatedKey = relatedKey;
	}

	public String getTitleLink() {
		return titleLink;
	}
	public void setTitleLink(String titleLink) {
		this.titleLink = titleLink;
	}
	public String getImgURL() {
		return imgURL;
	}
	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}
	public String getBodyLink() {
		return bodyLink;
	}
	public void setBodyLink(String bodyLink) {
		this.bodyLink = bodyLink;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	
}
