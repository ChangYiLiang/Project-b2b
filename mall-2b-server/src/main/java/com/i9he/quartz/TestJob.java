package com.i9he.quartz;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.i9he.common.exception.I9heException;
import com.i9he.m2b.biz.IWalletService;
import com.i9he.m2b.model.Wallet;
import com.i9he.privilege.api.IPrivilegeBaseApiService;

/**
 * 测试
 * @author Administrator
 *
 */
public class TestJob {
	
	/*@Autowired
	private IPrivilegeBaseApiService privilegeBaseApiService;
	@Autowired
	private IWalletService walletService;*/
	
	/*@Scheduled(cron="30 * * * * ?")
	public void work() throws I9heException{
		
		List<Integer> ids = privilegeBaseApiService.getIdByUsername("");
		for(Integer id : ids){
			Wallet w = new Wallet();
			w.setUserId(id);
			w.setErrorAll(5);
			w.setCreateTime(new Date());
			w.setErrorCount(0);
			w.setMoney(new BigDecimal(0));
			walletService.insert(w);
		}
		
		
		
	}*/

}
