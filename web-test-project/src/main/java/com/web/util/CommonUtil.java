/**
 * 
 */
package com.web.util;

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

}
