/**
 * 
 */
package com.web.Dao;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * @author ankur
 * 
 */
@Entity
@Table(name = "sub_product_category")
@NamedQueries({
		@NamedQuery(name = "subProductCategoryList", query = "select sc from SubProductCategory sc"),
		@NamedQuery(name = "subProductCategoryLinkedToACatId", query = "select s from SubProductCategory s WHERE s.categoryId = :catId") })
public class SubProductCategory {

	@Id
	@Column(name = "sub_cat_id")
	private int			subCategoryId;

	@Column(name = "cat_id")
	private int			categoryId;

	@Column(name = "sub_cat_name")
	private String		subCategoryName;

	@Column(name = "user_id")
	private int			userId;

	@Column(name = "created_on")
	private Timestamp	createdOn;

	/**
	 * @return the subCategoryId
	 */
	public int getSubCategoryId() {
		return subCategoryId;
	}

	/**
	 * @param subCategoryId
	 *            the subCategoryId to set
	 */
	public void setSubCategoryId(int subCategoryId) {
		this.subCategoryId = subCategoryId;
	}

	/**
	 * @return the categoryId
	 */
	public int getCategoryId() {
		return categoryId;
	}

	/**
	 * @param categoryId
	 *            the categoryId to set
	 */
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	/**
	 * @return the subCategoryName
	 */
	public String getSubCategoryName() {
		return subCategoryName;
	}

	/**
	 * @param subCategoryName
	 *            the subCategoryName to set
	 */
	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
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

	/**
	 * @return the createdOn
	 */
	public Timestamp getCreatedOn() {
		return createdOn;
	}

	/**
	 * @param createdOn
	 *            the createdOn to set
	 */
	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}

	/*
	 * (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ProductSubCategory [subCategoryId=" + subCategoryId
				+ ", categoryId=" + categoryId + ", subCategoryName="
				+ subCategoryName + ", userId=" + userId + ", createdOn="
				+ createdOn + "]";
	}

}
