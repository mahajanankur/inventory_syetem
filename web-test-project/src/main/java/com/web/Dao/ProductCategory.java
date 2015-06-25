package com.web.Dao;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "product_category")
@NamedQuery(name = "productCategory", query = "select p from ProductCategory p")
// @NamedQuery(name = "orderByQuery", query =
// "SELECT column_name, column_name FROM table_name ORDER BY column_name ASC|DESC, column_name ASC|DESC")
public class ProductCategory {

	// Don't use @GeneratedValue for manually generated ID's.
	/*
	 * @GeneratedValue(strategy = GenerationType.AUTO)
	 * 
	 * @SequenceGenerator(name = "seq", initialValue = 1, allocationSize = 100)
	 * 
	 * @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq")
	 */
	@Id
	@Column(name = "p_cat_id")
	private int pCatrgoryId;

	@Column(name = "p_cat_name")
	private String pCategoryName;

	@Column(name = "user_id")
	private int userId;

	/**
	 * @return the pCatrgoryId
	 */
	public int getpCatrgoryId() {
		return pCatrgoryId;
	}

	/**
	 * @param pCatrgoryId
	 *            the pCatrgoryId to set
	 */
	public void setpCatrgoryId(int pCatrgoryId) {
		this.pCatrgoryId = pCatrgoryId;
	}

	/**
	 * @return the pCategoryName
	 */
	public String getpCategoryName() {
		return pCategoryName;
	}

	/**
	 * @param pCategoryName
	 *            the pCategoryName to set
	 */
	public void setpCategoryName(String pCategoryName) {
		this.pCategoryName = pCategoryName;
	}

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ProductCategory [pCatrgoryId=" + pCatrgoryId
				+ ", pCategoryName=" + pCategoryName + ", userId=" + userId
				+ "]";
	}


}
