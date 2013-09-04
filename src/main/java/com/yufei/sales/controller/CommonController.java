package com.yufei.sales.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.yufei.pfw.service.PfwService;
import com.yufei.shopdata.entity.sp.Sp;

@org.springframework.stereotype.Controller
@RequestMapping("/common")
public class CommonController {
	@RequestMapping("/redirectSp")
	public RedirectView redirectSp(@RequestParam(value="spId",required=true)String spId){
		RedirectView redirectView =null;
		String spLink=PfwService.pfwService.query("id", Long.parseLong(spId), Sp.class).getLink();
		redirectView=new RedirectView(spLink);
		return redirectView;
	}
	@RequestMapping("/menuList")
	public String menu(){
	
	return "common/listmenu";
}
}
