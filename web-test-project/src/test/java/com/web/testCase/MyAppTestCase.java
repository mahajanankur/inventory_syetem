/**
 * 
 */
package com.web.testCase;

import java.util.List;

import com.web.Dao.SubProductCategory;
import com.web.ServiceImpl.UsersServiceImpl;

/**
 * @author ankur
 *
 */
public class MyAppTestCase {

	/**
	 * @param args
	 */
	private static UsersServiceImpl	serviceImpl;
	
	public static void main(String[] args) {
		testfindSubProductCategoriesLinkedToACategory(10);

	}

	private static void testfindSubProductCategoriesLinkedToACategory(int catId) {
		
		List<SubProductCategory> ls = serviceImpl.findSubProductCategoriesLinkedToACategory(catId);
		for (SubProductCategory subProductCategory : ls) {
			System.out.println("Name : " +subProductCategory.getSubCategoryName());
			System.out.println("Cat Id : "+subProductCategory.getCategoryId());
		}
	}

}
