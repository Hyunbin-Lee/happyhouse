package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.News;

@RestController
@RequestMapping("/articles")
@CrossOrigin("*")
public class NewsController {
	private static final Logger logger = LoggerFactory.getLogger(NewsController.class);
	private static final String URL = 
			"https://search.naver.com/search.naver?where=news&sm=tab_pge&query=아파트"+
			"&sort=0&photo=0&field=0&pd=0&ds=&de=&cluster_rank=72&mynews=0&office_type=0"+
			"&office_section_code=0&news_office_checked=&nso=so:r,p:all,a:all&start=";
	@GetMapping
	public ResponseEntity<List<News>> getNewsList(@RequestParam("pageNo") int pageNo){
		List<News> newsList = new ArrayList<>();
		try {
			News news;
			Document doc = Jsoup.connect(URL+pageNo).get();
			Elements elementsByClass = doc.getElementsByClass("list_news").get(0).children();
			for(Element box : elementsByClass) {
				news = new News();
				//title
				Elements titleElements = box.getElementsByClass("news_tit");
				for(Element title : titleElements) {
					news.setTitle(title.text());
					news.setTitleLink(title.attr("href"));
				}
				//body
				Elements bodyElements = box.getElementsByClass("api_txt_lines dsc_txt_wrap");
				for(Element body : bodyElements) {
					news.setBody(body.text());
					news.setBodyLink(body.attr("href"));
				}
				//image
				Elements imgElements = box.getElementsByClass("thumb api_get");
				for(Element img : imgElements) {
					news.setImgURL(img.attr("src"));
				}
				//date
				Elements dateElements = box.getElementsByClass("info");
				StringBuilder d = new StringBuilder();
				for(Element date : dateElements) {
					d.append(date.text() + " ");
				}
				news.setDate(d.toString());
				
				newsList.add(news);
			}
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<List<News>>(newsList, HttpStatus.OK);
	}
}
