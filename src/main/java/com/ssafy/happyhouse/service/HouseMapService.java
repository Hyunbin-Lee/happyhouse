package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.dto.HouseInfoDto;
import com.ssafy.happyhouse.model.dto.SidoGugunCodeDto;

public interface HouseMapService {

	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception;
	List<HouseInfoDto> getDongInGugun(String gugun) throws Exception;
	List<HouseInfoDto> getAptInDong(String dong) throws Exception;
	List<HouseInfoDto> getAptInName(String aptName) throws Exception;
	HouseInfoDto getAptDetail(String aptName,String buildYear,String recentPrice) throws Exception;
	List<HouseInfoDto> sortApt(String criteria, String dong) throws Exception;
	
}
