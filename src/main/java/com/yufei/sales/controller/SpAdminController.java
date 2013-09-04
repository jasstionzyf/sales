package com.yufei.sales.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

import net.sf.json.JSONArray;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;
import org.xml.sax.SAXException;

import com.yufei.pfw.service.PfwService;
import com.yufei.pfw.service.QueryPaire;
import com.yufei.pfw.service.QueryServiceExcetion;
import com.yufei.sales.entity.SpQueryInfo;
import com.yufei.sales.entity.SpQueryParameters;
import com.yufei.sales.query.SpQuery;
import com.yufei.shopdata.entity.sp.CatalogMapping;
import com.yufei.shopdata.entity.sp.CompetitiveSp;
import com.yufei.shopdata.entity.sp.ExternalLink;
import com.yufei.shopdata.entity.sp.Sp;
import com.yufei.shopdata.entity.sp.SpCatalog;
import com.yufei.utils.CommonUtil;

@org.springframework.stereotype.Controller
@RequestMapping("/admin/sp")
public class SpAdminController {
	PfwService pfwService=PfwService.pfwService;
	/**按照分类，价格区间，状态
	 * catalogId=-1(全部)，begainPrice,endPrice,状态：isDisplayed,isHidden
	 * @param query
	 * @param model
	 * @return
	 * @throws QueryServiceExcetion 
	 */
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String ListSp(@ModelAttribute(value="spQueryInfo")SpQueryInfo spQueryInfo,Model mode) throws QueryServiceExcetion{
		
		
	
		spQueryInfo.setCount(40);
		getSpCatalog(mode,false);


	

	


		
		SpQuery spQuery=new SpQuery(spQueryInfo);
		spQuery.query();
		List<Sp> searchResult = spQuery.getSearchResult();
		for(Sp  find:searchResult){
			
			find.setFindDate(new Date(find.getFindTime()==null?0L:find.getFindTime()));
			find.setUpdatedDate(new Date(find.getUpdateTime()==null?0L:find.getUpdateTime()));
			find.setDisplayedDate(new Date(find.getDisplayedTime()==null?0L:find.getDisplayedTime()));
		}
		
		mode.addAttribute("sps", searchResult);
		mode.addAttribute("spQueryInfo", spQuery.getQueryInfo());
		return "sp/list";
	}
	//获取sp catalog(多级分类)
		@RequestMapping(value="/getSpCatalog",method=RequestMethod.GET)
	    public void  getSpCatalog(HttpServletResponse response) throws IOException{
			List<SpCatalog> spCatalogs = null;
			spCatalogs = PfwService.pfwService.queryList(null, null, SpCatalog.class);
			String spCatalogStr = JSONArray.fromObject(spCatalogs).toString();
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(spCatalogStr);
		
		}
		@RequestMapping(value="/addCatalogMapping",method=RequestMethod.POST)
		public RedirectView  addCatalogMapping(@ModelAttribute(value="catalogMapping")CatalogMapping catalogMapping, Model model,HttpServletResponse response) throws IOException{
			
			String message= "操作成功！";
	try{
			pfwService.save(catalogMapping);
	}catch (Exception e) {
		// TODO: handle exception
		message="操作失败，已存在！";

	}
			//response.setContentType("text/html;charset=utf-8");
			model.addAttribute("message",message);
		    RedirectView redirectView = new RedirectView("/admin/sp/forwardAddSpCatalogMapping", true);
			//response.getWriter().write("添加分类映射成功！");
			return redirectView;

		}
		//添加分类
		@RequestMapping(value="/addSpCatalog",method=RequestMethod.POST)
		public RedirectView  addSpCatalog(@ModelAttribute(value="spCatalog") SpCatalog spCatalog,Model model,HttpServletResponse response) throws IOException{
			String message= "操作成功！";

			try{
			pfwService.save(spCatalog);
			}catch (Exception e) {
				// TODO: handle exception
				message="操作失败，已存在！";

			}
		//	response.setContentType("text/html;charset=utf-8");
			model.addAttribute("message",message);

		//	response.getWriter().write("添加分类成功！");	
			  RedirectView redirectView = new RedirectView("/admin/sp/forwardAddSpCatalog", true);
				//response.getWriter().write("添加分类映射成功！");
				return redirectView;
			//return "sp/addSpCatalog";

			
		}
		//添加采集链接
			@RequestMapping(value="/addExternalLink",method=RequestMethod.POST)
			public RedirectView  addExternalLink(@ModelAttribute(value="externalLink") ExternalLink externalLink,Model model,HttpServletResponse response) throws IOException{
				String  message=null;
				message= "操作成功！";
				try{
				pfwService.save(externalLink);
				}catch(Exception e){
					message="操作失败，已存在！";
				}
				//response.setContentType("text/html;charset=utf-8");

				//response.getWriter().write("添加分类链接成功！");
				
				model.addAttribute("message",message);
				 RedirectView redirectView = new RedirectView("/admin/sp/forwardAddExternalLink", true);
					//response.getWriter().write("添加分类映射成功！");
					return redirectView;
				
			}
			@RequestMapping(value="/forwardAddExternalLink",method=RequestMethod.GET)
			public String  forwardAddExternalLink(@RequestParam(value="message",required=false)String message,Model mode,HttpServletResponse response) throws IOException{
				mode.addAttribute("externalLink", new ExternalLink());
				mode.addAttribute("message", message);

				mode.addAttribute("hover", "111-3");

				
				return "sp/addLink";
			}
			@RequestMapping(value="/forwardAddSp",method=RequestMethod.GET)
			public String  forwardAddSp(@RequestParam(value="message",required=false)String message,Model mode,HttpServletResponse response) throws IOException{
				mode.addAttribute("sp", new Sp());
				mode.addAttribute("message", message);

			

				
				return "sp/addSp";
			}
			@RequestMapping(value="/forwardAddSpCatalog",method=RequestMethod.GET)
			public String  forwardAddSpCatalog(@RequestParam(value="message",required=false)String message,Model mode,HttpServletResponse response) throws IOException, QueryServiceExcetion{
				mode.addAttribute("spCatalog", new SpCatalog());
				mode.addAttribute("message", message);
				
				List<SpCatalog> topSpCatalog = PfwService.pfwService.queryList("parentCategoryId", 0, SpCatalog.class);

				topSpCatalog.add(new SpCatalog(0L, 0L, null, null));
				mode.addAttribute("topSpCatalog", topSpCatalog);

				return "sp/addSpCatalog";
			}
			@RequestMapping(value="/forwardAddSpCatalogMapping",method=RequestMethod.GET)
			public String  forwardAddCatalogMapping(@RequestParam(value="message",required=false)String message,Model mode,HttpServletResponse response) throws IOException{
				mode.addAttribute("catalogMapping", new CatalogMapping());
				mode.addAttribute("message", message);
				mode.addAttribute("hover", "111-4");

				getSpCatalog(mode,false);
				return "sp/addCatalogMapping";
			}

			private void getSpCatalog(Model mode,boolean justChildren) {
				List<SpCatalog> spCatalogs = null;
				if(justChildren){
					List<QueryPaire> queryPaires=new ArrayList<>();
					queryPaires.add(new QueryPaire("parentCategoryId", "gt:0"));
					spCatalogs = PfwService.pfwService.query(queryPaires, SpCatalog.class);

				}
				else{
					spCatalogs = PfwService.pfwService.queryList(null, null, SpCatalog.class);

				}
				
				for(SpCatalog find:  spCatalogs){
					
					if(find.getParentCategoryId()==0){
						String name = find.getName();
						find.setName("<font  color=\"red\">"+name+"</font>");
					}
				}
				
				mode.addAttribute("spCatalog", spCatalogs);
			}
			@RequestMapping(value="/forwardUpdateSpInfo",method=RequestMethod.GET)
			public String  forwardUpdateSpInfo(@RequestParam(value="spId",required=false)long spId, Model mode,HttpServletResponse response) throws IOException{
				Sp sp=null;
				if(spId==0L){
					sp=new  Sp();
				}
				else{
					 
						sp=pfwService.query("id", spId, Sp.class);
					
					 
					 long catalogId=sp.getCatalogId();
					 StringBuffer str=new StringBuffer();
					 SpCatalog catalog = pfwService.query("id", catalogId, SpCatalog.class);
					SpCatalog pSpcaCatalog= pfwService.query("id", catalog.getParentCategoryId(), SpCatalog.class);
					str.append(pSpcaCatalog==null?"":pSpcaCatalog.getName())
					.append(">").append(catalog.getName());
					sp.setCatalogs(str.toString());
					 

				}
				mode.addAttribute("sp",sp);

				return "sp/editSp";
			}
		//修改特价商品有关信息比如：修改标题，商品图片链接等
		@RequestMapping(value="/updateSpInfo",method=RequestMethod.POST)
		public void updateSpInfo(@ModelAttribute(value="sp") Sp sp,HttpServletResponse response) throws IOException{
			sp.setUpdateTime(System.currentTimeMillis());
			pfwService.update(sp);
			
			response.setContentType("text/html;charset=utf-8");

			response.getWriter().write("更新sp信息成功！");
			 /* redirectView=new RedirectView("/spAdmin/list", true);
				//response.getWriter().write("添加分类映射成功！");
				return redirectView;*/
			 	

		}
	
		//屏蔽sp(前台是否显示)
		@RequestMapping(value="/setDisplayOrNot",method=RequestMethod.GET)
	    public void  setDisplayOrNot(@RequestParam(value="spId")long spid,@RequestParam(value="isDisplay")boolean isDisplay,HttpServletResponse response) throws IOException{
			Sp sp = null;
			sp = pfwService.query("id", spid, Sp.class);
			sp.setDisplayed(isDisplay);
			if(isDisplay){
				//设置上架时间
				sp.setDisplayedTime(System.currentTimeMillis());
			}
			
			pfwService.update(sp);
			response.setContentType("text/html;charset=utf-8");

		response.getWriter().write("更新sp前台显示状态态成功！");
			//return listPage;


			
		}
		//批量屏蔽sp(前台是否显示)
			@RequestMapping(value="/batchSetDisplay",method=RequestMethod.POST)
		    public void batchSetDisplay(HttpServletRequest request,@RequestParam(value="isDisplay")boolean isDisplay,HttpServletResponse response) throws IOException, NumberFormatException, QueryServiceExcetion{
			    String[] spids=request.getParameterValues("checkedSpId");
			    for(String spId:spids){
			    	Sp sp=pfwService.find(Sp.class, Long.parseLong(spId));
					sp.setDisplayed(isDisplay);
					//如果是上架设置上架时间
					if(isDisplay){
						//设置上架时间
						sp.setDisplayedTime(System.currentTimeMillis());
					}
					pfwService.update(sp);
			    }
				
				response.setContentType("text/html;charset=utf-8");

				response.getWriter().write("批量更新sp前台显示状态态成功！");
			//	return "listPage";


				
			}
			@RequestMapping(value="/forwardAddCompetitiveSp",method=RequestMethod.GET)
			public String  forwardAddCompetitiveSp(@RequestParam(value="message",required=false)String message,Model mode,HttpServletResponse response) throws IOException{



				return "sp/addCompetitiveSp";
			}
			@RequestMapping(value="addCompetitiveSp")
			public void addCompetitiveSp(@RequestParam(value="spId")long spId,@RequestParam(value="type")String type,Model mode,HttpServletResponse response) throws IOException, QueryServiceExcetion{
				String  message=null;
				message= "操作成功！";
				Sp sp=pfwService.find(Sp.class, spId);
				if(!sp.getDisplayed()){
					message="必须是审核通过的商品才能加入9.9专区!";
				}
				try{
					CompetitiveSp competitiveSp=new CompetitiveSp();
					competitiveSp.setSpId(spId);
					competitiveSp.setType(type);
					competitiveSp.setTime(System.currentTimeMillis());
				pfwService.save(competitiveSp);
				
				}catch(Exception e){
					message="操作失败，已存在！";
				}
				response.setContentType("text/html;charset=utf-8");

				response.getWriter().write(message);
			    }
			/**
			 * @param mode
			 * @return
			 * @throws QueryServiceExcetion 
			 */
			@RequestMapping(value="/listCompetitiveSp",method=RequestMethod.GET)
			public String ListCompetitiveSp(Model mode) throws QueryServiceExcetion{
				
	
				
				List<QueryPaire> queryPaires=new ArrayList<>();
				queryPaires.add(new QueryPaire("priority", "sort:d"));
				queryPaires.add(new QueryPaire("time", "sort:d"));

				List<CompetitiveSp> cSps=pfwService.query(queryPaires, CompetitiveSp.class);
				for(CompetitiveSp csp:cSps){
					


                   Sp sp=pfwService.find(Sp.class, csp.getId());
					
					sp.setDisplayedDate(new Date(sp.getDisplayedTime()));
					
						csp.setSp(sp);
		
				
					
				}
				
				mode.addAttribute("cSps", cSps);
				
				
				
				
				
				return "sp/listForCompetitiveSp";
			}
			@RequestMapping(value="setPriority",method=RequestMethod.POST)
			public void setPriority(HttpServletRequest request,HttpServletResponse response) throws IOException, NumberFormatException, QueryServiceExcetion{
				String[] spIds=request.getParameterValues("spId");
				int count=spIds.length;
				for(int i=0;i<count;i++){
					Sp csp=pfwService.find(Sp.class, Long.parseLong(spIds[i]));
					csp.setPriority(count-i);
					pfwService.save(csp);
				}
				String message="排序成功!";
				response.setContentType("text/html;charset=utf-8");

				response.getWriter().write(message);
			}
			
			@RequestMapping(value="/listForSort",method=RequestMethod.GET)
			public String listForSort(@ModelAttribute(value="spQueryPara")SpQueryParameters spQueryPara, Model mode) throws QueryServiceExcetion{
				//页面菜单特别显示
			
				
				
				getSpCatalog(mode,false);
				String catalogId = spQueryPara.getCatalogId();

				/*Map map=new HashMap();
				map.put("displayed:=", true);

				
				
				if(catalogId!=null&&!catalogId.trim().equals("")&&Integer.valueOf(catalogId.trim())>0){
					long parseLong = Long.parseLong(catalogId);
					SpCatalog spCatalog=pfwService.find(SpCatalog.class,  parseLong);
					if(spCatalog.getParentCategoryId()!=0){
						map.put("catalogId:=", spCatalog.getId());

					}
					else{
						map.put("catalogId:=", spCatalog.getId());



					}

				}




				
				List<Sp> spList=new ArrayList<>();
				map.put("priority:sort", "d");
				map.put("stockHave:=",true);




				List<Sp> spIds=pfwService.query(map, Sp.class);*/
				SpQueryInfo spQueryInfo=new SpQueryInfo();
				if(!CommonUtil.isEmptyOrNull(catalogId)){
					spQueryInfo.setCatalogId(Long.parseLong(catalogId));
				}
				spQueryInfo.setDisplayed(true);

				spQueryInfo.setCount(100);
				SpQuery spQuery=new SpQuery(spQueryInfo);
				spQuery.query();
				
				List<Sp> spIds=spQuery.getSearchResult();
				
				for(Sp  find:spIds){
				
					
					find.setDisplayedDate(new Date(find.getDisplayedTime()));
				}
				
				mode.addAttribute("spList", spIds);
				
				
				
				
				//
				return "sp/listSort";
			}
			@RequestMapping(value="/index",method=RequestMethod.GET)
			public String manager() throws QueryServiceExcetion{


				return "manager";
			}
	public static void main(String[] args) throws Exception, ParserConfigurationException, SAXException, IOException {
		PfwService pfwService=PfwService.pfwService;
	/*	Map map=new HashMap();
		map.put("limit", 100);
		map.put("price:bw","9.98-10.00");
		map.put("price:sort", "d");

		List<Sp> sps=pfwService.query(map, Sp.class);
		
		Map setVlauesMap=new HashMap<>();
		setVlauesMap.put("price", 10000);
		pfwService.updateAll(map, setVlauesMap, Sp.class);
		 map=new HashMap();
		map.put("limit", 100);
		map.put("price:bw","9999-10001");
		map.put("price:sort", "d");

		sps=pfwService.query(map, Sp.class);
		for(Sp sp:sps){
			System.out.print(sp.getPrice()+"\n");
		}
		pfwService.removeAll(map, Sp.class);
		 map=new HashMap();
			map.put("limit", 100);
			map.put("price:bw","9999-10001");
			map.put("price:sort", "d");

			sps=pfwService.query(map, Sp.class);
			for(Sp sp:sps){
				System.out.print(sp.getPrice()+"\n");
			}*/
		/*Sp sp=new Sp();
		sp.setMallId(2L);
		sp.setLink("http://www.amazon.cn/%E7%81%B5%E7%B4%A0-108%E9%A2%97%E4%B8%B2%E7%8F%A0%E6%89%8B%E9%93%BE3A%E7%BA%A7%E5%B7%B4%E8%A5%BF%E7%8E%9B%E7%91%99-%E5%A4%A9%E7%84%B6%E9%BB%91%E7%8E%9B%E7%91%99-%E5%8D%95%E7%8F%A0%E7%9B%B4%E5%BE%846mm%E5%8F%AF%E7%BB%95%E6%89%8B3-4%E5%9C%88-%E6%97%B6%E4%B8%8B%E6%B5%81%E8%A1%8C/dp/B008R61W60/ref=sr_1_14?s=jewelry&ie=UTF8&qid=1371871243&sr=1-14");
		sp.setCatalogId(7L);
		String spUrl=sp.getLink();

		Sp sp0=AmazoneService.getSpInfo(spUrl);
		sp0.setCatalogId(sp.getCatalogId());
		sp0.setMallId(2L);
		pfwService.save(sp0);
		*/
	}
	@RequestMapping(value="/addSp",method=RequestMethod.POST)
	public RedirectView  addSp(@ModelAttribute(value="sp") Sp sp,Model mode) throws IOException{
		String message="添加成功!";
	/*	String spUrl=sp.getLink();
		Long catalogId=sp.getCatalogId();
		
        try {
			Sp sp0=AmazoneService.getSpInfo(spUrl);
			sp0.setCatalogId(catalogId);
			sp0.setMallId(2L);
			pfwService.save(sp0);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			message="添加失败，失败信息:"+ExceptionUtil.getExceptionDetailsMessage(e)+"";
		}*/


			
			
		
		mode.addAttribute("message",message);
		 RedirectView redirectView = new RedirectView("/admin/sp/forwardAddSp", true);
			//response.getWriter().write("添加分类映射成功！");
			return redirectView;
			}

}
