package com.i9he.m2b.server.biz;

import java.util.List;
import com.i9he.common.exception.I9heException;
import com.i9he.m2b.model.Area;


public interface IAreaService {

	public List<Area> getallArea() throws I9heException;
	

}