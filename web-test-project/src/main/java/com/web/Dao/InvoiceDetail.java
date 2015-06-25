/**
 * 
 */
package com.web.Dao;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author ankur
 * 
 */
@Entity
@Table(name = "invoice_detail")
public class InvoiceDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "invoice_detail_id")
	private int		iDetailId;

	@Column(name = "client_id")
	private int		clientId;

	@Column(name = "client_name")
	private String	clientName;

	@Column(name = "product_id")
	private int		productId;

	@Column(name = "product_name")
	private String	productName;

	@Column(name = "quantity")
	private int		quantity;

	@Column(name = "price")
	private double	price;

	/**
	 * @return the iDetailId
	 */
	public int getiDetailId() {
		return iDetailId;
	}

	/**
	 * @param iDetailId
	 *            the iDetailId to set
	 */
	public void setiDetailId(int iDetailId) {
		this.iDetailId = iDetailId;
	}

	/**
	 * @return the clientId
	 */
	public int getClientId() {
		return clientId;
	}

	/**
	 * @param clientId
	 *            the clientId to set
	 */
	public void setClientId(int clientId) {
		this.clientId = clientId;
	}

	/**
	 * @return the clientName
	 */
	public String getClientName() {
		return clientName;
	}

	/**
	 * @param clientName
	 *            the clientName to set
	 */
	public void setClientName(String clientName) {
		this.clientName = clientName;
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
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}

	/**
	 * @param quantity
	 *            the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	/**
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}

	/**
	 * @param price
	 *            the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}

	/*
	 * (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "InvoiceDetail [iDetailId=" + iDetailId + ", clientId="
				+ clientId + ", clientName=" + clientName + ", productId="
				+ productId + ", productName=" + productName + ", quantity="
				+ quantity + ", price=" + price + "]";
	}

}
