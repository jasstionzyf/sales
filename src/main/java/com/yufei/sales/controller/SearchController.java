package com.yufei.sales.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yufei.sales.entity.SpQueryInfo;
import com.yufei.sales.query.SpQuery;

@org.springframework.stereotype.Controller
@RequestMapping("/query")
public class SearchController {
	@RequestMapping("/sp")
public String querySp(@ModelAttribute(value="spQueryInfo")SpQueryInfo spQueryInfo,Model model){
		spQueryInfo.setDisplayed(true);
		SpQuery spQuery=new SpQuery(spQueryInfo);
		spQuery.query();
		model.addAttribute("sps", spQuery.getSearchResult());
		model.addAttribute("spQueryInfo", spQuery.getQueryInfo());
		return "index";
	
}


	
}
