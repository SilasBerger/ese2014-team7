package org.sample.controller.service;

import java.util.LinkedList;

import org.sample.controller.pojos.SearchForm;
import org.sample.model.Search;
import org.sample.model.User;
import org.sample.model.dao.AdDao;
import org.sample.model.dao.SearchDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired SearchDao SearchDao;
	@Autowired LoginService loginService;
	@Autowired AdDao adDao;

	@Transactional
	public Search saveSearch(SearchForm searchForm) {
		Long priceMin = searchForm.getPriceMinAsLong();
		Long priceMax = searchForm.getPriceMaxAsLong();
		Long roomSizeMin = searchForm.getRoomSizeMinAsLong();
		Long roomSizeMax = searchForm.getRoomSizeMaxAsLong();
		String city = searchForm.getCity();
		
		Search search = new Search(new Long(0), priceMin, priceMax, roomSizeMin, roomSizeMax, city);
		search.setUserId(loginService.getLoggedInUser().getId());

		SearchDao.save(search);

		return search;
	}

	@Transactional
	public Iterable<Search> findSearches(User user) {
		Iterable<Search> allSearches = SearchDao.findAll();
		LinkedList<Search> results = new LinkedList<Search>();

		for(Search s : allSearches)
			if(s.getUserId() == loginService.getLoggedInUser().getId())
				results.add(s);

		return (Iterable<Search>)results;
	}

	@Transactional
	public boolean alreadySaved(User user, Long searchId) {
		Iterable<Search> searches = findSearches(user);
		
		for(Search search : searches) {
			if(search.getId() == searchId)
				return true;
		}
		
		return false;
	}
	
	@Transactional
	public Search removeSearch(Search Search) {
		SearchDao.delete(Search);
		
		return Search;
	}

}
