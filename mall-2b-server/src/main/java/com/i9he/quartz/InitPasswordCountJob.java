package com.i9he.quartz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.i9he.m2b.biz.IWalletService;
/**
 * 初始化密码错误次数
 * @author Administrator
 *
 */
public class InitPasswordCountJob {
	@Autowired
	private IWalletService walletService;
	@Scheduled(cron="0 0 0 * * ?")
	public void work(){
		walletService.initPassword();
	}

}
