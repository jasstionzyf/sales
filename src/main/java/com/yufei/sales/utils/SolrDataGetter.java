package com.yufei.sales.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.yufei.dataget.utils.HtmlUtil;
import com.yufei.utils.PatternUtils;

public class SolrDataGetter {
	public static Log mLog = LogFactory.getLog(SolrDataGetter.class);
/**
 * @param keyWord
 * @param maxRows
 * @return spIds,  maybe null or empty so just check when you get this value
 */
public static List<String>  getSpIdsBySolrQuery(String keyWord,int maxRows){
	List<String> spIds=null;
	
	String salesSolrUrl="http://zhezhezhe.cn/solr/sp/select?q="+HtmlUtil.encoderUrl(keyWord)+"&fl=spId&wt=xml&indent=true&start=0&rows="+maxRows+"";
	String resultHtml=null;

	try {
		resultHtml=HtmlUtil.getHtmlContent(salesSolrUrl, false);
		spIds=PatternUtils.getListStrByRegex(resultHtml, "\"spId\">(.*?)<");
		
		mLog.info(spIds.size());
		
	} catch (IOException e) {
		// TODO Auto-generated catch block
		mLog.info("使用关键字:"+keyWord+"查询出错!"+com.yufei.utils.ExceptionUtil.getExceptionDetailsMessage(e)+"");
	}
	return spIds;
}
public static void main(String[] args){
	System.out.print(SolrDataGetter.getSpIdsBySolrQuery("手机", 1).get(0));
	
}
}
