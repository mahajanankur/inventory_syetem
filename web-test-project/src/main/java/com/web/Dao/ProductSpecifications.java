/**
 * 
 */
package com.web.Dao;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * @author ankur
 * 
 */
@Entity
@Table(name = "product_specifications")
@NamedQuery(name = "countSpecificationRows", query = "SELECT COUNT(p) FROM ProductSpecifications p")
public class ProductSpecifications {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "specification_id")
	private int		specificationId;

	@Column(name = "specification_detail")
	private String	specificationsDetail;

	/**
	 * @return the specificationId
	 */
	public int getSpecificationId() {
		return specificationId;
	}

	/**
	 * @param specificationId
	 *            the specificationId to set
	 */
	public void setSpecificationId(int specificationId) {
		this.specificationId = specificationId;
	}

	/**
	 * @return the specificationsDetail
	 */
	public String getSpecificationsDetail() {
		return specificationsDetail;
	}

	/**
	 * @param specificationsDetail
	 *            the specificationsDetail to set
	 */
	public void setSpecificationsDetail(String specificationsDetail) {
		this.specificationsDetail = specificationsDetail;
	}

	/*
	 * (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ProductSpecifications [specificationId=" + specificationId
				+ ", specificationsDetail=" + specificationsDetail + "]";
	}

}
