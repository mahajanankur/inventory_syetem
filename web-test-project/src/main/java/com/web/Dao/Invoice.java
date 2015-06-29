/**
 * 
 */
package com.web.Dao;

import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * @author ankur
 * 
 */
@Entity
@Table(name = "invoice")
@NamedQueries({ @NamedQuery(name = "invoiceList", query = "select i from Invoice i") })
public class Invoice {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "invoice_id")
	private int					invoiceId;

	@Column(name = "invoice_name")
	private String				invoiceName;

	@Column(name = "created_on")
	private Timestamp			createdOn;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "invoice_id", nullable = false)
	private Set<InvoiceDetail>	invoiceDetail;

	/**
	 * @return the invoiceId
	 */
	public int getInvoiceId() {
		return invoiceId;
	}

	/**
	 * @param invoiceId
	 *            the invoiceId to set
	 */
	public void setInvoiceId(int invoiceId) {
		this.invoiceId = invoiceId;
	}

	/**
	 * @return the invoiceName
	 */
	public String getInvoiceName() {
		return invoiceName;
	}

	/**
	 * @param invoiceName
	 *            the invoiceName to set
	 */
	public void setInvoiceName(String invoiceName) {
		this.invoiceName = invoiceName;
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
	 * @return the invoiceDetail
	 */
	public Set<InvoiceDetail> getInvoiceDetail() {
		return invoiceDetail;
	}

	/**
	 * @param invoiceDetail
	 *            the invoiceDetail to set
	 */
	public void setInvoiceDetail(Set<InvoiceDetail> invoiceDetail) {
		this.invoiceDetail = invoiceDetail;
	}

	/*
	 * (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Invoice [invoiceId=" + invoiceId + ", invoiceName="
				+ invoiceName + ", createdOn=" + createdOn + ", invoiceDetail="
				+ invoiceDetail + "]";
	}

}
