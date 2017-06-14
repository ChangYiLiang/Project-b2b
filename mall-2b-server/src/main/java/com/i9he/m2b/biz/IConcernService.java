package com.i9he.m2b.biz;

import java.util.List;

import com.i9he.m2b.model.Concern;
import com.i9he.m2b.model.search.ConcernSearchModel;

public interface IConcernService {
	
	public  List<Concern> getConcernList(ConcernSearchModel csm);
	
	public int cancelConcern(String concernId);
	
	public int updateRemind(Concern concern);
	
	public int addConcern(Concern concern,String state);
	
	public Concern isConcern(Concern concern);
	
	public Concern isRemind(Concern concern);
	
	public int concernCount();

}
