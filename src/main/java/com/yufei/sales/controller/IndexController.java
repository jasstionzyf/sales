package com.yufei.sales.controller;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yufei.pfw.service.PfwService;
import com.yufei.sales.entity.SpQueryInfo;
import com.yufei.sales.query.SpQuery;
import com.yufei.shopdata.entity.sp.Mall;
import com.yufei.shopdata.entity.sp.SpCatalog;

@org.springframework.stereotype.Controller
@RequestMapping("/")

//@("spCatalogs")
public class IndexController {
	List<SpCatalog> spCatalogs = null;
	List<Mall>  malls=null;
	@Autowired
	ServletContext context;
	@PostConstruct
	public void init() {
		spCatalogs = PfwService.pfwService.queryList(null, null, SpCatalog.class);
		malls=PfwService.pfwService.queryList(null, null, Mall.class);
		context.setAttribute("spCatalogs", spCatalogs);
		context.setAttribute("malls", malls);
		

		
	}
	PfwService pfwService =PfwService.pfwService;
	@RequestMapping("/index")
	public String index(Model model,HttpServletRequest request){
	String page="index";
	SpQueryInfo spQueryInfo=new SpQueryInfo();
	spQueryInfo.setCount(40);
	spQueryInfo.setDisplayed(true);
	SpQuery spQuery=new SpQuery(spQueryInfo);
	spQuery.query();
	model.addAttribute("sps", spQuery.getSearchResult());
	model.addAttribute("spQueryInfo", spQuery.getQueryInfo());

	return page;
}
	
}
