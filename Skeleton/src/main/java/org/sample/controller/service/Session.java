package org.sample.controller.service;

import org.sample.model.User;

public class Session {

	private static User user;
	
	public static User getUser()
	{
		return user;
	}
	
	public static void setUser(User user)
	{
		Session.user = user;
	}
	
	public static void resetUser()
	{
		user = null;
	}
	
}
