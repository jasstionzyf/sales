package com.yufei.sales.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import com.yufei.dataget.entity.ProxyServer;
import com.yufei.dataretriver.DataRetrieverFactory;
import com.yufei.dataretriver.DataRetrieverFeatures;
import com.yufei.dataretriver.HttpDataRetriever;
import com.yufei.sales.utils.AppUtil;
import com.yufei.utils.ExceptionUtil;
import com.yufei.utils.FileUtil;
import com.yufei.utils.ImageTools;
@org.springframework.stereotype.Controller
@RequestMapping("ud")
public class ImageUploadController {
	private static Log mLog = LogFactory.getLog(ImageUploadController.class);

	@RequestMapping(value = "/img")
	public void upload(HttpServletRequest request ,HttpServletResponse response
			,Model model) {
		try{
			String imgDir=AppUtil.getVlaue("//imgUploadPath");
		
		File dirPath = new File(imgDir);
		if (!dirPath.exists()) {
			dirPath.mkdirs();
		}
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest.getFile("Filedata");//这里是表单的名字，在swfupload.js中this.ensureDefault("file_post_name", "filedata");
		
		InputStream stream = file.getInputStream();
		String fileName = file.getOriginalFilename();
		
		
		fileName = String.valueOf(new Date().getTime())+"_"+String.valueOf(Math.random()*9000+1000).substring(0, 3)+fileName.substring(fileName.lastIndexOf('.'), fileName.length()); 
		fileName = new String(fileName.getBytes(),"utf-8");
	
		String fileNameFull = imgDir+ fileName;
		OutputStream bos = new FileOutputStream(fileNameFull);
		int bytesRead = 0;
		byte[] buffer = new byte[8192];
		while ((bytesRead = stream.read(buffer, 0, 8192)) != -1) {
			bos.write(buffer, 0, bytesRead);
		}
		bos.flush();
		bos.close();
		// close the stream
		stream.close();
		model.addAttribute("SUCCESS",  fileNameFull);
		JSONObject json = JSONObject.fromObject(model);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(json.toString());
	}catch(Exception e){
		e.printStackTrace();
	}
	
	}
	///i/100-40/
/*	@RequestMapping(value = "/i/{size}/{imgUrl}")
*/	@RequestMapping(value = "/i/{size}")
	public RedirectView upload1(@PathVariable("size")String size,HttpServletRequest request){
		 int w=Integer.parseInt(size.split("-")[0]);
		 String imgUrl=request.getParameter("pl");
		 int h=Integer.parseInt(size.split("-")[1]);
		// 获取当前项目路径
					//String currentPath = request.getServletContext().getRealPath("/");
					
					/*// 当前项目名称
					String projectName = request.getContextPath().substring(1);
					// web应用根路径
					String webRootPath = currentPath.substring(0,
							currentPath.indexOf(projectName) - 1);*/
					//String imagesPath="D:\\data\\images\\";
		            String imagesPath=AppUtil.getVlaue("//imgSavedPath");
					String imgDir=imagesPath+size+File.separator+imgUrl;
					File file2 = new File(imgDir);
					File output = file2;
					File file=output;

					if(file.exists()){
						return new RedirectView(request.getContextPath()+"/i/"+size+"/"+imgUrl);
					}
					
					String sourceUrl="http://"+imgUrl+"";
					ProxyServer proxy=null;
					InputStream input=null;
				    DataRetrieverFeatures dataRetrieverFeatures = new DataRetrieverFeatures(false, proxy);
				    dataRetrieverFeatures.setRequestTimeout(1000*1000);
				    dataRetrieverFeatures.setConnectionTimeout(1000*1000);
					HttpDataRetriever dataRetriever=DataRetrieverFactory.createDataRetriever(dataRetrieverFeatures);
					 try {
							dataRetriever.setUrl(new URL(sourceUrl));
										    	     dataRetriever.connect();
				    	      input=dataRetriever.getContent();
				    	      String topDirectory = imgDir.substring(0,imgDir.lastIndexOf("/"));
								File fd=new File(topDirectory);
					    		 //  FileOutputStream fos=new FileOutputStream(new File(topDirectory+File.separator+"+System.currentTimeMillis()+."+ImageType.getType(sourceUrl)+""));
								 if(!fd.exists()){
					    			   fd.mkdirs();
					    		   }
								String tmpFileName = ""+System.currentTimeMillis()+".jpg";
								FileUtil.makeFile(topDirectory+File.separator, tmpFileName, input);
				    	      dataRetriever.disconnect();
				    	 //   Image image=new Image(new ByteArrayInputStream(bs), ImageType.getType(sourceUrl));
                           
			    		
			    		  
			    			if(!file2.exists()){
			    				file2.createNewFile();
			    			}
			    			//Image resultImage=image.getResizedToWidth(w);
				    	   // image.soften(0f).writeToJPG(file2, 0.95f);

			    			//resultImage.writeToFile(file2);
			    			 ImageTools.cutImage(w,topDirectory+File.separator+tmpFileName, imgDir);
			    			 new File(tmpFileName).delete();

				    	   } catch (Exception e) {
				   			// TODO Auto-generated catch block
				    		   e.printStackTrace();
				   			   mLog.debug(ExceptionUtil.getExceptionDetailsMessage(e));
				   		}
		
		return new RedirectView(request.getContextPath()+"/i/"+size+"/"+imgUrl);

		
	}
}
