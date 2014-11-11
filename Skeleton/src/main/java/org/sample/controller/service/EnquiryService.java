package org.sample.controller.service;

import org.sample.controller.pojos.EnquiryForm;
import org.sample.controller.pojos.EnquiryRatingForm;
import org.sample.model.Enquiry;

public interface EnquiryService {

	/**
	 * Completes the given enquiry form by adding timestamp and sender/receiver id and 
	 * saves the enquiry to the DB.
	 * 
	 * @param 	enquiryForm			the enquiry form to be saved to the DB
	 * @return 						the completed form
	 */
    public EnquiryForm submit(EnquiryForm enquiryForm);
    
    /**
	 * Compiles an iterable of all enquiries sent by the logged in user.
	 * 
	 * @return iterable of sent enquiries
	 */
    public Iterable<Enquiry> findSentEnquiries();
    
    /**
	 * Compiles an iterable of all enquiries received for the logged in user that have aöready been rated.
	 * 
	 * @return iterable of received enquiries
	 */
    public Iterable<Enquiry> findRatedReceivedEnquiries();
    
    /**
	 * Compiles an iterable of all enquiries received for the logged in user that haven't been rated yet.
	 * 
	 * @return iterable of received enquiries
	 */
    public Iterable<Enquiry> findNewReceivedEnquiries();

    public EnquiryRatingForm submitRating(EnquiryRatingForm form);

}
