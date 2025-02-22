package com.ssafy.happyhouse.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.HouseInfoDto;
import com.ssafy.happyhouse.model.dto.SidoGugunCodeDto;
import com.ssafy.happyhouse.service.HouseMapService;
@RestController
@RequestMapping("/map")
@CrossOrigin("*")
public class HouseMapController {
	
	private final Logger logger = LoggerFactory.getLogger(HouseMapController.class);

	@Autowired
	private HouseMapService haHouseMapService;
	
	
	
	@PostMapping("/fav")
	public void fav(
			@RequestParam("aptName") String aptName,
			@RequestParam("buildYear") String buildYear,
			@RequestParam("recentPrice") String recentPrice,
			@RequestParam("isfav") boolean isfav
			) throws Exception {
		haHouseMapService.updateIsfav(aptName, buildYear, recentPrice, isfav);
	}
	
	@GetMapping("/fav")
	public ResponseEntity<List<HouseInfoDto>> fav() throws Exception {
		return new ResponseEntity<List<HouseInfoDto>>(haHouseMapService.getFavorites(), HttpStatus.OK);
	}
	@PostMapping("/fav/remove")
	public ResponseEntity<List<HouseInfoDto>> removeFav(@RequestParam("aptCode") String aptCode) throws Exception {
		haHouseMapService.removeFavorite(aptCode);
		return new ResponseEntity<List<HouseInfoDto>>(haHouseMapService.getFavorites(), HttpStatus.OK);
	}
	
	@GetMapping("/sido")
	public ResponseEntity<List<SidoGugunCodeDto>> sido() throws Exception {
		logger.debug("sido : {}", haHouseMapService.getSido());
		return new ResponseEntity<List<SidoGugunCodeDto>>(haHouseMapService.getSido(), HttpStatus.OK);
	}
	
	@GetMapping("/gugun")
	public ResponseEntity<List<SidoGugunCodeDto>> gugun(@RequestParam("sido") String sido) throws Exception {
		return new ResponseEntity<List<SidoGugunCodeDto>>(haHouseMapService.getGugunInSido(sido), HttpStatus.OK);
	}
	
	@GetMapping("/dong")
	public ResponseEntity<List<HouseInfoDto>> dong(@RequestParam("gugun") String gugun) throws Exception {
		return new ResponseEntity<List<HouseInfoDto>>(haHouseMapService.getDongInGugun(gugun), HttpStatus.OK);
	}
	
	@GetMapping("/apt")
	public ResponseEntity<List<HouseInfoDto>> apt(@RequestParam("dong") String dong) throws Exception {
		return new ResponseEntity<List<HouseInfoDto>>(haHouseMapService.getAptInDong(dong), HttpStatus.OK);
	}
	@GetMapping("/apt/name")
	public ResponseEntity<List<HouseInfoDto>> aptSearch(@RequestParam("aptSearch") String aptName) throws Exception {
		if(aptName.contentEquals(""))
			return new ResponseEntity<List<HouseInfoDto>>(new ArrayList<>(), HttpStatus.OK);
		return new ResponseEntity<List<HouseInfoDto>>(haHouseMapService.getAptInName(aptName), HttpStatus.OK);
	}
	@GetMapping("/apt/detail")
	public ResponseEntity<HouseInfoDto> aptSearchDetail(
			@RequestParam("aptName") String aptName,
			@RequestParam("buildYear") String buildYear,
			@RequestParam("recentPrice") String recentPrice
			) throws Exception {
		return new ResponseEntity<HouseInfoDto>(haHouseMapService.getAptDetail(aptName,buildYear,recentPrice), HttpStatus.OK);
	}
	@GetMapping("/apt/sort")
	public ResponseEntity<List<HouseInfoDto>> aptSort(@RequestParam("criteria") String criteria ,@RequestParam("dong") String dong) throws Exception {
		return new ResponseEntity<List<HouseInfoDto>>(haHouseMapService.sortApt(criteria, dong), HttpStatus.OK);
	}
	
}
