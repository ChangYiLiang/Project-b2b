package com.i9he.m2b.manage.biz;

import java.util.List;

import com.i9he.m2b.model.SerialNumber;
import com.i9he.m2b.model.search.SerialSearchModel;

public interface ISerialNumberService {
	
	public int insert(SerialNumber serialNumber);
	
	public int  update(SerialNumber serialNumber);
	
	public List<SerialNumber> getAll(SerialSearchModel ssm);
	
	public SerialNumber findById(String id);	
	
	public SerialNumber searchModel(String id); 

}
