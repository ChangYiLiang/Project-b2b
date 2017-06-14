package com.i9he.m2b.mapper;

import java.util.List;

import com.i9he.m2b.model.UserNumber;
import com.i9he.m2b.model.UserRegisterNumber;
import com.i9he.m2b.model.UserToGrAndQy;

public interface UserCensusMapper {
	
    public List<UserNumber> getUserNumber();
	
	public UserRegisterNumber getUserRegisterNumber();
	
	public UserToGrAndQy getUserToGrAndQy();
}
