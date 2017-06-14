package com.i9he.m2b.manage.biz;

import java.util.List;

import com.i9he.m2b.model.UserNumber;
import com.i9he.m2b.model.UserRegisterNumber;
import com.i9he.m2b.model.UserToGrAndQy;


public interface IUserCensusService {
	
    public List<UserNumber> getUserNumber();
	
	public UserRegisterNumber getUserRegisterNumber();
	
	public UserToGrAndQy getUserToGrAndQy();
}
