package com.ssafy.happyhouse.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.HouseMapDao;
import com.ssafy.happyhouse.model.dto.HouseInfoDto;
import com.ssafy.happyhouse.model.dto.SidoGugunCodeDto;

@Service
public class HouseMapServiceImpl implements HouseMapService {
	
	@Autowired
	private HouseMapDao houseMapDao;

	@Override
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return houseMapDao.getSido();
	}

	@Override
	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception {
		return houseMapDao.getGugunInSido(sido);
	}

	@Override
	public List<HouseInfoDto> getDongInGugun(String gugun) throws Exception {
		return houseMapDao.getDongInGugun(gugun);
	}

	@Override
	public List<HouseInfoDto> getAptInDong(String dong) throws Exception {
		return houseMapDao.getAptInDong(dong);
	}

	@Override
	public List<HouseInfoDto> getAptInName(String aptName) throws Exception {
		return houseMapDao.getAptInName(aptName);
	}

	@Override
	public List<HouseInfoDto> sortApt(String criteria, String dong) throws Exception {
		List<HouseInfoDto> aptInDong = houseMapDao.getAptInDong(dong);
		HouseInfoDto []arr = new HouseInfoDto[aptInDong.size()];
		//sort by criteria
		aptInDong.toArray(arr);
		for(int i = 0; i < arr.length - 1; i++) {
			int min_index = i;	
			
			// 최솟값을 갖고있는 인덱스 찾기 
			for(int j = i + 1; j < arr.length; j++) {
				switch(criteria) {
				case "price":
					if(Integer.parseInt(arr[j].getRecentPrice().replaceAll(",", "").trim()) < Integer.parseInt(arr[min_index].getRecentPrice().replaceAll(",", "").trim())) {
						min_index = j;
					}
					break;
				case "name":
					if( arr[min_index].getAptName().compareTo(arr[j].getAptName())>0) {
						min_index = j;
					}
					break;
				}
				
			}
			// i번째 값과 찾은 최솟값을 서로 교환
			HouseInfoDto temp = arr[min_index];
			arr[min_index] = arr[i];
			arr[i] = temp;
		}
	
		return Arrays.asList(arr);
	}

}
