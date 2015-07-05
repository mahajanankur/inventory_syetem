package com.web.Dao;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * @author ankur
 * 
 */
@Entity
@Table(name = "products")
@NamedQueries({
		@NamedQuery(name = "productList", query = "select p from Products p"),
		@NamedQuery(name = "productListBySubCatId", query = "select p from Products p WHERE p.subCategoryId = :subCatId"),
		@NamedQuery(name = "productListByQuantity", query = "select p from Products p WHERE p.quantity < :lQuantity") })
public class Products {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "product_id")
	private int						productId;

	@Column(name = "product_name")
	private String					productName;

	@Column(name = "product_brand")
	private String					productBrand;

	@Column(name = "cost_price")
	private double					costPrice;

	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "product_specifications", nullable = false)
	private ProductSpecifications	productSpecifications;

	@Column(name = "product_photos")
	private String					productPhotos;

	@Column(name = "product_offer")
	private String					productOffer;

	@Column(name = "created_on")
	private Timestamp				createdOn;

	@Column(name = "user_id")
	private int						userId;

	@Column(name = "sub_category_id")
	private int						subCategoryId;

	@Column(name = "category_id")
	private int						categoryId;

	@Column(name = "quantity")
	private int						quantity;

	@Column(name = "sold_quantity")
	private int						soldQuantity;

	@Column(name = "sale_price")
	private double					salePrice;

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
	 * @return the productBrand
	 */
	public String getProductBrand() {
		return productBrand;
	}

	/**
	 * @param productBrand
	 *            the productBrand to set
	 */
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}

	/**
	 * @return the productPhotos
	 */
	public String getProductPhotos() {
		return productPhotos;
	}

	/**
	 * @param productPhotos
	 *            the productPhotos to set
	 */
	public void setProductPhotos(String productPhotos) {
		this.productPhotos = productPhotos;
	}

	/**
	 * @return the productOffer
	 */
	public String getProductOffer() {
		return productOffer;
	}

	/**
	 * @param productOffer
	 *            the productOffer to set
	 */
	public void setProductOffer(String productOffer) {
		this.productOffer = productOffer;
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
	 * @return the productSpecifications
	 */
	public ProductSpecifications getProductSpecifications() {
		return productSpecifications;
	}

	/**
	 * @param productSpecifications
	 *            the productSpecifications to set
	 */
	public void setProductSpecifications(
			ProductSpecifications productSpecifications) {
		this.productSpecifications = productSpecifications;
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
	 * @return the soldQuantity
	 */
	public int getSoldQuantity() {
		return soldQuantity;
	}

	/**
	 * @param soldQuantity
	 *            the soldQuantity to set
	 */
	public void setSoldQuantity(int soldQuantity) {
		this.soldQuantity = soldQuantity;
	}

	/**
	 * @return the costPrice
	 */
	public double getCostPrice() {
		return costPrice;
	}

	/**
	 * @param costPrice
	 *            the costPrice to set
	 */
	public void setCostPrice(double costPrice) {
		this.costPrice = costPrice;
	}

	/**
	 * @return the salePrice
	 */
	public double getSalePrice() {
		return salePrice;
	}

	/**
	 * @param salePrice
	 *            the salePrice to set
	 */
	public void setSalePrice(double salePrice) {
		this.salePrice = salePrice;
	}

	/*
	 * (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Products [productId=" + productId + ", productName="
				+ productName + ", productBrand=" + productBrand
				+ ", costPrice=" + costPrice + ", productSpecifications="
				+ productSpecifications + ", productPhotos=" + productPhotos
				+ ", productOffer=" + productOffer + ", createdOn=" + createdOn
				+ ", userId=" + userId + ", subCategoryId=" + subCategoryId
				+ ", categoryId=" + categoryId + ", quantity=" + quantity
				+ ", soldQuantity=" + soldQuantity + ", salePrice=" + salePrice
				+ "]";
	}

}
