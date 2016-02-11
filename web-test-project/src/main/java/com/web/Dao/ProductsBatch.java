package com.web.Dao;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * @author ankur
 * 
 */
@Entity
@Table(name = "product_batch")
@NamedQueries({ @NamedQuery(name = "batchListLinkedToAStock", query = "SELECT b FROM ProductsBatch b") })
public class ProductsBatch {
	// query =
	// "SELECT b FROM ProductsBatch b WHERE b.vendorId = :vendorId AND b.stockId = :stockId AND b.productId = :productId")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "batch_id")
	private int			batchId;

	@Column(name = "manf_date")
	private Date		manfDate;

	@Column(name = "expiry_date")
	private Date		expiryDate;

	// @Column(name = "vendor_id")
	// private int vendorId;

	// @Column(name = "stock_id")
	// private int stockId;

	@Column(name = "product_id")
	private int			productId;

	@Column(name = "product_name")
	private String		productName;

	@Column(name = "status")
	private String		status;

	@Column(name = "sold_on")
	private Timestamp	soldOn;

	@Column(name = "client_id")
	private Integer		clientId;

	/**
	 * @return the batchId
	 */
	public int getBatchId() {
		return batchId;
	}

	/**
	 * @param batchId
	 *            the batchId to set
	 */
	public void setBatchId(int batchId) {
		this.batchId = batchId;
	}

	/**
	 * @return the manfDate
	 */
	public Date getManfDate() {
		return manfDate;
	}

	/**
	 * @param manfDate
	 *            the manfDate to set
	 */
	public void setManfDate(Date manfDate) {
		this.manfDate = manfDate;
	}

	/**
	 * @return the expiryDate
	 */
	public Date getExpiryDate() {
		return expiryDate;
	}

	/**
	 * @param expiryDate
	 *            the expiryDate to set
	 */
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	/**
	 * @return the vendorId
	 */
	// public int getVendorId() {
	// return vendorId;
	// }
	//
	// /**
	// * @param vendorId
	// * the vendorId to set
	// */
	// public void setVendorId(int vendorId) {
	// this.vendorId = vendorId;
	// }
	//
	// /**
	// * @return the stockId
	// */
	// public int getStockId() {
	// return stockId;
	// }
	//
	// /**
	// * @param stockId
	// * the stockId to set
	// */
	// public void setStockId(int stockId) {
	// this.stockId = stockId;
	// }

	/**
	 * @return the soldOn
	 */
	public Timestamp getSoldOn() {
		return soldOn;
	}

	/**
	 * @param soldOn
	 *            the soldOn to set
	 */
	public void setSoldOn(Timestamp soldOn) {
		this.soldOn = soldOn;
	}

	/**
	 * @return the clientId
	 */
	public Integer getClientId() {
		return clientId;
	}

	/**
	 * @param clientId
	 *            the clientId to set
	 */
	public void setClientId(Integer clientId) {
		this.clientId = clientId;
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
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status
	 *            the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
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

}
