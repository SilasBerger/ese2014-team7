package org.sample.controller.pojos;

import java.util.Date;

public class SearchForm {
	
	private String priceMin;
	private String priceMax;
	private String roomSizeMin;
	private String roomSizeMax;
	private String city;
	private String addCostMax;
	private Date earliestMoveInDate;
	private Date latestMoveInDate;

	public String getRoomSizeMin() {
		return roomSizeMin;
	}
	public void setRoomSizeMin(String roomSizeMin) {
		this.roomSizeMin = roomSizeMin;
	}
	public String getRoomSizeMax() {
		return roomSizeMax;
	}
	public void setRoomSizeMax(String roomSizeMax) {
		this.roomSizeMax = roomSizeMax;
	}
	public String getPriceMin() {
		return priceMin;
	}
	public void setPriceMin(String priceMin) {
		this.priceMin = priceMin;
	}
	public String getPriceMax() {
		return priceMax;
	}
	public void setPriceMax(String priceMax) {
		this.priceMax = priceMax;
	}
	
	public Long getPriceMinAsLong(){
		return Long.parseLong(priceMin);
	}
	public Long getPriceMaxAsLong(){
		return Long.parseLong(priceMax);
	}
	public Long getRoomSizeMinAsLong(){
		return Long.parseLong(roomSizeMin);
	}
	public Long getRoomSizeMaxAsLong(){
		return Long.parseLong(roomSizeMax);
	}
	public Long getAddCostMaxAsLong(){
		try {
			return Long.parseLong(addCostMax);
		} catch(Exception e){
			
		}
		return 1000L;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getAddCostMax() {
		return addCostMax;
	}
	public void setAddCostMax(String addCostMax) {
		this.addCostMax = addCostMax;
	}
	public Date getEarliestMoveInDate() {
		return earliestMoveInDate;
	}
	public void setEarliestMoveInDate(Date earliestMoveInDate) {
		this.earliestMoveInDate = earliestMoveInDate;
	}
	public Date getLatestMoveInDate() {
		return latestMoveInDate;
	}
	public void setLatestMoveInDate(Date latestMoveInDate) {
		this.latestMoveInDate = latestMoveInDate;
	}
}
