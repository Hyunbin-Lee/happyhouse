package com.ssafy.happyhouse.model.dto;

import java.util.List;

public class NewsObj {
	public List<News> news;
	public List<String> related;
	public NewsObj(List<News> news, List<String> related) {
		super();
		this.news = news;
		this.related = related;
	}
	public NewsObj() {}
	public List<News> getNews() {
		return news;
	}
	public void setNews(List<News> news) {
		this.news = news;
	}
	public List<String> getRelated() {
		return related;
	}
	public void setRelated(List<String> related) {
		this.related = related;
	}
	
}
