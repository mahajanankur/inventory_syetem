/**
 * 
 */
package com.web.Dao;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author ankur
 * 
 */
@Entity
@Table(name = "stock")
@NamedQueries({ @NamedQuery(name = "stockList", query = "select s from Stock s") })
public class Stock {

	@Id
	@Column(name = "stock_id")
	private int						stockId;

	@Column(name = "stock_name")
	private String					stockName;

	@Column(name = "vendor_id")
	private int						vendorId;

	@Column(name = "user_id")
	private int						userId;

	@Column(name = "total_quantities")
	private int						stockIn;

	@Column(name = "created_on")
	private Timestamp				createdOn;

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "stock")
	// @OneToMany(cascade = CascadeType.ALL)
	// @JoinColumn(name = "stock_id", nullable = false)
	private List<ProductWiseStock>	productWiseStock;

	/**
	 * @return the stockId
	 */
	public int getStockId() {
		return stockId;
	}

	/**
	 * @param stockId
	 *            the stockId to set
	 */
	public void setStockId(int stockId) {
		this.stockId = stockId;
	}

	/**
	 * @return the stockName
	 */
	public String getStockName() {
		return stockName;
	}

	/**
	 * @param stockName
	 *            the stockName to set
	 */
	public void setStockName(String stockName) {
		this.stockName = stockName;
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
	 * @return the stockIn
	 */
	public int getStockIn() {
		return stockIn;
	}

	/**
	 * @param stockIn
	 *            the stockIn to set
	 */
	public void setStockIn(int stockIn) {
		this.stockIn = stockIn;
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

	/**
	 * @return the productWiseStock
	 */
	public List<ProductWiseStock> getProductWiseStock() {
		return productWiseStock;
	}

	/**
	 * @param productWiseStock
	 *            the productWiseStock to set
	 */
	public void setProductWiseStock(List<ProductWiseStock> productWiseStock) {
		this.productWiseStock = productWiseStock;
	}

}
