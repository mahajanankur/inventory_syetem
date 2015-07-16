/**
 * 
 */
package com.web.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Dream On
 * 
 */
public class CommonUtil {

	/**
	 * This method is used to split the photo's url string for a product.
	 * 
	 * @param photoURL
	 * @return photos
	 */
	public static String[] photoURLSplitter(String photoURL) {
		String[] photos = photoURL.split("\\|");
		return photos;
	}

	/**
	 * This method is used to convert a string to date in "MM/dd/yyyy" format.
	 * 
	 * @param s
	 * @return date
	 */
	public static Date dateFormat(String s) {
		DateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		Date d = null;
		try {
			d = format.parse(s);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return d;
	}

}
