package org.sample.controller.service;

import java.io.IOException;
import java.sql.Timestamp;

import org.json.JSONException;
import org.sample.controller.NominatimConnector;
import org.sample.controller.exceptions.InvalidUserException;
import org.sample.controller.pojos.LoginForm;
import org.sample.controller.pojos.SignupForm;
import org.sample.controller.pojos.AdForm;
import org.sample.model.Address;
import org.sample.model.Coordinates;
import org.sample.model.User;
import org.sample.model.Ad;
import org.sample.model.dao.AddressDao;
import org.sample.model.dao.UserDao;
import org.sample.model.dao.AdDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;


@Service
public class AdServiceImpl implements AdService {

	@Autowired AdDao adDao;
    
    @Transactional
	public AdForm saveFrom(AdForm adForm) {
	    
    	Ad ad = new Ad();
    	Coordinates coordinates;
		try {
			coordinates = NominatimConnector.getCoordinatesFromAddress(adForm.getStreet(), adForm.getHouseNr().toString(), adForm.getCity(), adForm.getZip().toString());
		    ad.setLon(coordinates.getLon());
		    ad.setLat(coordinates.getLat());
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
	    ad.setId(adForm.getId());
	    ad.setPlacerId(0L); //TODO: hardcoded id!
	    Timestamp timestamp  = new Timestamp(System.currentTimeMillis());
		ad.setTimestamp(timestamp);
	    ad.setTitle(adForm.getTitle());
	    ad.setStreet(adForm.getStreet());
	    ad.setHouseNr(adForm.getHouseNr());
	    ad.setCity(adForm.getCity());
	    ad.setZip(adForm.getZip());
	    ad.setRent(adForm.getRent());
	    ad.setAddCost(adForm.getAddCost());
	    ad.setDateIn(adForm.getDateIn());
	    ad.setDateOut(adForm.getDateOut());
	    ad.setType(adForm.getType());
	    ad.setRoomSize(adForm.getRoomSize());
	    ad.setDescription(adForm.getDescription());
	    ad.setUs(adForm.getUs());
	    ad.setYou(adForm.getYou());

	    ad = adDao.save(ad);
		
	    return  adForm;
	}

	public Iterable<Ad> adCatcher() {
		return adDao.findAll();
	}

}
