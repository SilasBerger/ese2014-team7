package org.sample.model.dao;

import java.util.List;

import org.sample.model.Ad;
import org.springframework.data.repository.CrudRepository;


public interface AdDao  extends CrudRepository<Ad,Long>{

	
	List<Ad> findByRentBetweenAndRoomSizeBetweenAndCityContainingAndAddCostLessThan(Long priceMin, Long priceMax, Long roomSizeMin, Long roomSizeMax, String city, Long addCostMax);

	
	List<Ad> findByPlacerId(Long loggedInUserId);
	
}