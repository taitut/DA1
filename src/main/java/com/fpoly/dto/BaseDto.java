package com.fpoly.dto;

import java.util.Date;


public abstract class BaseDto <T> {
	
	private Long id;

	private Date createDate;
	
	
    private Date modifiedDate;
	

    private String createdBy;
	

    private String modifiedBy;
    private Long [] ids;

	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public Date getModifiedDate() {
		return modifiedDate;
	}


	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}


	public String getCreatedBy() {
		return createdBy;
	}


	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}


	public String getModifiedBy() {
		return modifiedBy;
	}


	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}


	public Long[] getIds() {
		return ids;
	}


	public void setIds(Long[] ids) {
		this.ids = ids;
	}
    
}
