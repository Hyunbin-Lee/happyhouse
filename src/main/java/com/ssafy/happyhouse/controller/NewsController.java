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
import com.ssafy.happyhouse.model.dto.NewsObj;

@RestController
@RequestMapping("/articles")
@CrossOrigin("*")
public class NewsController {
	private static final Logger logger = LoggerFactory.getLogger(NewsController.class);
	private static final String URL_HEAD = "https://search.naver.com/search.naver?where=news&sm=tab_pge&query=";
	private static final String URL_BODY = "&sort=0&photo=0&field=0&pd=0&ds=&de=&cluster_rank=72&mynews=0&office_type=0&office_section_code=0&news_office_checked=&nso=so:r,p:all,a:all&start=";
	@GetMapping
	public ResponseEntity<NewsObj> getNewsList(@RequestParam("pageNo") int pageNo,
												  @RequestParam("searchKey") String searchKey){
		NewsObj newsObj = new NewsObj();
		List<News> newsList = new ArrayList<>();
		List<String> relatedList = new ArrayList<>();
		
		try {
			News news;
			Document doc = Jsoup.connect(URL_HEAD+searchKey+URL_BODY+pageNo).get();
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
			if(!doc.getElementsByClass("lst_related_srch").isEmpty()) {
				Elements relatedElements = doc.getElementsByClass("lst_related_srch").get(0).children();
				for(Element related : relatedElements) {
					//title
					Elements titleElements = related.getElementsByClass("tit");
					for(Element title : titleElements) {
						relatedList.add(title.text());
					}
				}
			}
			newsObj.setNews(newsList);
			newsObj.setRelated(relatedList);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<NewsObj>(newsObj, HttpStatus.OK);
	}
}
