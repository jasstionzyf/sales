package com.yufei.sales.query;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yufei.pfw.service.QueryServiceExcetion;
import com.yufei.query.AbstractQuery;
import com.yufei.sales.entity.SpQueryInfo;
import com.yufei.sales.utils.SolrDataGetter;
import com.yufei.shopdata.entity.sp.Sp;
import com.yufei.shopdata.entity.sp.SpCatalog;
import com.yufei.utils.CommonUtil;

public class SpQuery extends AbstractQuery<SpQueryInfo, Sp> {

	public SpQuery(SpQueryInfo queryInfo) {
		super(queryInfo);
		// TODO Auto-generated constructor stub

	}

	@Override
	public void query() {
		boolean keyWordSearch=false;
		Map map = new HashMap();
		if(!CommonUtil.isEmptyOrNull(queryInfo.getKeyWord())){
			processKeyWordSearch(map);
			keyWordSearch=true;
		}
		//12,23,23
		String mallId = queryInfo.getMallId();
		if(!CommonUtil.isEmptyOrNull(mallId)){
			//map.put("mallId:=", mallId);
			map.put("mallId:in",mallId);
		}

		
     
		
		
		
		//上架状态并且有库存
        map.put("stockHave:=",this.queryInfo.getStockHave());
		map.put("undercarriage:=",false);
		setSortPara(map);
		
		// 价格
		double bprice = this.queryInfo.getBprice();
		double eprice = this.queryInfo.getEprice();
		long catalogId = this.queryInfo.getCatalogId();
		long parentCatalogId = queryInfo.getParentCatalogId();
		int dispalyedDays = queryInfo.getDispalyedDays();

		boolean isDisplayed = queryInfo.getDisplayed();
	
		map.put("displayed:=", isDisplayed);


		String spName = queryInfo.getSpName();
		if (spName != null && !spName.equals("")) {
			map.put("spName:like", spName);

		}

		
		if (bprice != 0 && eprice != 0) {
			map.put("price:bw", "" + bprice + "-" + eprice + "");

		}
		// lte:number;gte:number
		if (bprice == 0 && eprice != 0) {
			map.put("price:lte",eprice);

		}
		if (bprice != 0 && eprice == 0) {
			map.put("price:gte", bprice);

		}
		

		if (catalogId != 0) {
			map.put("catalogId:=", catalogId);

		}

		if (parentCatalogId != 0) {
			map.put("parentCategoryId:=", parentCatalogId);

		}
		// 每页显示多少
			
	
			
			long totalCount = pfwService.count(map, Sp.class);

			if (this.getQueryInfo().getTotalcount() == 0) {
				// firet page
				queryInfo.setTotalcount((int) totalCount);
			}
			int count = this.getQueryInfo().getCount();
			if (count > 100) {
				throw new RuntimeException();
			}
			int currentPageNumber = this.getQueryInfo().getCpn();
			map.put("skip", (currentPageNumber - 1) * count);
			map.put("limit", count);
		
	
		
		
		
		List<Sp> searchResult = null;
		if(!keyWordSearch){
		if (catalogId == 0 && parentCatalogId == 0) {
			List<SpCatalog> spcatalogs = pfwService.queryList(
					"parentCategoryId", 0, SpCatalog.class);
			List<List<Sp>> spLists = new ArrayList<List<Sp>>();
			
			for (SpCatalog spCatalog : spcatalogs) {
				map.put("skip",
						(this.getQueryInfo().getCpn()- 1) * this.getQueryInfo().getCount() / spcatalogs.size());
				map.put("limit", this.getQueryInfo().getCount() / spcatalogs.size());

				map.put("catalogId:=", spCatalog.getId());
				spLists.add(pfwService.query(map, Sp.class));
			}
			
			searchResult = new ArrayList<>();
			for (int i = 0; i < (this.getQueryInfo().getCount() / spcatalogs.size()); i++) {
				for (List<Sp> sps : spLists) {
					if (sps.size() > i) {
						searchResult.add(sps.get(i));

					}
				}

			}

		} 
		else{
			searchResult = pfwService.query(map, Sp.class);
		}
		}
		else{
			searchResult = pfwService.query(map, Sp.class);
		}
		
		

		
		for (Sp sp : searchResult) {
			SpCatalog spc=pfwService.query("id", sp.getCatalogId(), SpCatalog.class);
			if(spc==null){
				continue;
			}
					
			String name = spc.getName();
			sp.setCatalogName(name);
		}
		
		this.setSearchResult(searchResult);
		/*long compareTimes = dispalyedDays * 1000 * 60 * 60 * 24;
		// 上架时间大于两天
		if (dispalyedDays != 0) {
			map.put("displayedTime:bw",
					"0-"
							+ String.valueOf(System.currentTimeMillis()
									- compareTimes) + "");

		}*/
	}
    
	private void processKeyWordSearch(Map map) {
		// TODO Auto-generated method stub
		
		
		String keyWord=queryInfo.getKeyWord();
		List<String> spIds=null;
		try {
			spIds = SolrDataGetter.getSpIdsBySolrQuery(keyWord, 3000);
					//indexService.search(keyWord, "des");
		
		
		if(!CommonUtil.isEmptyOrNull(spIds)){
			map.put("_id:in", CommonUtil.LinkStringWithSpecialSymbol(spIds, ","));
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	private void setSortPara(Map map) {
		// TODO Auto-generated method stub
		String sortP=this.queryInfo.getSortP();

		if(CommonUtil.isEmptyOrNull(sortP)){
			//use default order
			map.put("priority#price#findTime:sort", "d#a#d");
           
		}
		else{
		    //priority#price#findTime:d#a#d	
			String[] split = sortP.split(":");
			map.put(""+split[0]+":sort", split[1]);
		}
	}

	private List<Sp> resetListIndex(List<Sp> sp) {

		return sp;

	}

	public static void main(String[] args) throws QueryServiceExcetion {
		/*SpQueryInfo spQueryInfo = new SpQueryInfo();

		SpQuery spQuery = new SpQuery(spQueryInfo);
		spQuery.query();
		List<Sp> spR = spQuery.getSearchResult();

		List<SpCatalog> topSpCatalog = PfwService.pfwService.queryList(
				"parentCategoryId", new Long(0), SpCatalog.class);
		System.out.print(spR.size());
*/
	/*	Map map=new HashMap();
		map.put("price:gte", 60.0);
	List<Sp> sps=	PfwService.pfwService.query(map, Sp.class);
	System.out.print(sps.size());*/
		
		SpQueryInfo spQueryInfo=new SpQueryInfo();
		spQueryInfo.setMallId("2,");
		spQueryInfo.setCount(40);
		spQueryInfo.setKeyWord("水晶");
		spQueryInfo.setDisplayed(true);


	

	


		
		SpQuery spQuery=new SpQuery(spQueryInfo);
		spQuery.query();
		List<Sp> sps=spQuery.getSearchResult();
		for(Sp sp:sps){
			System.out.print(sp.getSpName()+"\n");
		}
	}

}
