package com.i9he.m2b.manage.biz;

import java.util.List;

import com.i9he.m2b.model.Concern;
import com.i9he.m2b.model.InterestedModel;
import com.i9he.m2b.model.search.ConcernSearchModel;

public interface IConcernService {
	
	public  List<Concern> getList(ConcernSearchModel csm);
	
	public List<InterestedModel> getInterestedModel();

}
