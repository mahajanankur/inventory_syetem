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
@Table(name = "stock")
@NamedQueries({ @NamedQuery(name = "stockList", query = "select s from Stock s") })
public class Stock {

	@Id
	@Column(name = "stock_id")
	private int			stockId;

	@Column(name = "cat_id")
	private int			catId;

	@Column(name = "sub_cat_id")
	private int			subCatId;

	@Column(name = "product_id")
	private int			productId;

	@Column(name = "product_name")
	private String		productName;

	@Column(name = "stock_in")
	private int			stockIn;

	@Column(name = "stock_out")
	private int			soldStock;

	@Column(name = "created_on")
	private Timestamp	createdOn;

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
	 * @return the catId
	 */
	public int getCatId() {
		return catId;
	}

	/**
	 * @param catId
	 *            the catId to set
	 */
	public void setCatId(int catId) {
		this.catId = catId;
	}

	/**
	 * @return the subCatId
	 */
	public int getSubCatId() {
		return subCatId;
	}

	/**
	 * @param subCatId
	 *            the subCatId to set
	 */
	public void setSubCatId(int subCatId) {
		this.subCatId = subCatId;
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
	 * @return the soldStock
	 */
	public int getSoldStock() {
		return soldStock;
	}

	/**
	 * @param soldStock
	 *            the soldStock to set
	 */
	public void setSoldStock(int soldStock) {
		this.soldStock = soldStock;
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
		return "Stock [stockId=" + stockId + ", catId=" + catId + ", subCatId="
				+ subCatId + ", productId=" + productId + ", productName="
				+ productName + ", stockIn=" + stockIn
				+ ", soldStock=" + soldStock + ", createdOn=" + createdOn + "]";
	}

}
