package com.web.dto;

public class DtoAnalysisPie {

	public DtoAnalysisPie(String pName, long pCount) {
		this.pName = pName;
		this.pCount = pCount;
	}

	private String	pName;

	private long	pCount;

	/**
	 * @return the pName
	 */
	public String getpName() {
		return pName;
	}

	/**
	 * @param pName
	 *            the pName to set
	 */
	public void setpName(String pName) {
		this.pName = pName;
	}

	/**
	 * @return the pCount
	 */
	public long getpCount() {
		return pCount;
	}

	/**
	 * @param pCount
	 *            the pCount to set
	 */
	public void setpCount(long pCount) {
		this.pCount = pCount;
	}

}
