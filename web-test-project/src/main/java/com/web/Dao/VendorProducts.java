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
@Table(name = "vendor_products")
@NamedQueries({
		@NamedQuery(name = "vendorProductsList", query = "select v from VendorProducts v WHERE v.vendorId = :vendorId") })
public class VendorProducts {

	@Id
	@Column(name = "vp_id")
	private int			vpId;

	@Column(name = "vendor_id")
	private int			vendorId;

	@Column(name = "product_id")
	private int			productId;

	@Column(name = "vendor_name")
	private String		company;

	@Column(name = "product_name")
	private String		productName;

	@Column(name = "created_on")
	private Timestamp	createdOn;

	/**
	 * @return the vpId
	 */
	public int getVpId() {
		return vpId;
	}

	/**
	 * @param vpId
	 *            the vpId to set
	 */
	public void setVpId(int vpId) {
		this.vpId = vpId;
	}

	/**
	 * @return the vendorId
	 */
	public int getVendorId() {
		return vendorId;
	}

	/**
	 * @param vendorId
	 *            the vendorId to set
	 */
	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}

	/**
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
	}

	/**
	 * @param productId
	 *            the productId to set
	 */
	public void setProductId(int productId) {
		this.productId = productId;
	}

	/**
	 * @return the company
	 */
	public String getCompany() {
		return company;
	}

	/**
	 * @param company
	 *            the company to set
	 */
	public void setCompany(String company) {
		this.company = company;
	}

	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}

	/**
	 * @param productName
	 *            the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
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
		return "VendorProducts [vpId=" + vpId + ", vendorId=" + vendorId
				+ ", productId=" + productId + ", company=" + company
				+ ", productName=" + productName + ", createdOn=" + createdOn
				+ "]";
	}

}
