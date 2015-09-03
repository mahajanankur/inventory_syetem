package com.web.Dao;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author ankur
 * 
 */
@Entity
@Table(name = "product_wise_stock")
// @NamedQueries({ @NamedQuery(name = "productWiseStockByStockId", query =
// "SELECT p FROM ProductWiseStock p WHERE p.") })
public class ProductWiseStock {

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

	@Column(name = "vendor_id")
	private int					vendorId;

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "stock_id")
	private Stock				stock;

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "productWiseStock")
	private List<ProductsBatch>	productsBatch;

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
	 * @return the stock
	 */
	public Stock getStock() {
		return stock;
	}

	/**
	 * @param stock
	 *            the stock to set
	 */
	public void setStock(Stock stock) {
		this.stock = stock;
	}

	/**
	 * @return the productsBatch
	 */
	public List<ProductsBatch> getProductsBatch() {
		return productsBatch;
	}

	/**
	 * @param productsBatch
	 *            the productsBatch to set
	 */
	public void setProductsBatch(List<ProductsBatch> productsBatch) {
		this.productsBatch = productsBatch;
	}

}
