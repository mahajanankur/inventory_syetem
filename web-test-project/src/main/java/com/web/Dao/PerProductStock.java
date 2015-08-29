package com.web.Dao;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author ankur
 * 
 */
@Entity
@Table(name = "per_product_stock")
public class PerProductStock {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "pp_id")
	private int					ppId;

	@Column(name = "product_id")
	private int					productId;

	@Column(name = "product_name")
	private String				productName;

	@Column(name = "pp_quantities")
	private int					ppQuantities;

	@Column(name = "vendoer_id")
	private int					vendorId;

	@Column(name = "stock_id")
	private int					stockId;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumns({ @JoinColumn(name = "stock_id", nullable = false),
			@JoinColumn(name = "product_id", nullable = false) })
	private Set<ProductsBatch>	productsBatch;

	/**
	 * @return the ppId
	 */
	public int getPpId() {
		return ppId;
	}

	/**
	 * @param ppId
	 *            the ppId to set
	 */
	public void setPpId(int ppId) {
		this.ppId = ppId;
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
	 * @return the ppQuantities
	 */
	public int getPpQuantities() {
		return ppQuantities;
	}

	/**
	 * @param ppQuantities
	 *            the ppQuantities to set
	 */
	public void setPpQuantities(int ppQuantities) {
		this.ppQuantities = ppQuantities;
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
	 * @return the productsBatch
	 */
	public Set<ProductsBatch> getProductsBatch() {
		return productsBatch;
	}

	/**
	 * @param productsBatch
	 *            the productsBatch to set
	 */
	public void setProductsBatch(Set<ProductsBatch> productsBatch) {
		this.productsBatch = productsBatch;
	}

	/*
	 * (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PerProductStock [ppId=" + ppId + ", productId=" + productId
				+ ", productName=" + productName + ", ppQuantities="
				+ ppQuantities + ", vendorId=" + vendorId + ", stockId="
				+ stockId + ", productsBatch=" + productsBatch + "]";
	}

}
