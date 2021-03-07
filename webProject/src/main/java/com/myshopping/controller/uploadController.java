package com.myshopping.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.myshopping.domain.ProductImageVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class uploadController {
	
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	
	
	
	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form");
	}
	
	@PostMapping(value = "/uploadFormAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProductImageVO>> uploadFormPost(MultipartFile[] uploadFile, Model model){
		
		List<ProductImageVO> list = new ArrayList<ProductImageVO>();
		
		String uploadFolder = "C:\\upload";
		
		File uploadPath = new File(uploadFolder, getFolder());
		
		if (uploadPath.exists() == false) { //file exist check 
			uploadPath.mkdirs(); //make file
		}
		
		
		for(MultipartFile multipartFile : uploadFile) {	
			
			ProductImageVO productImage = new ProductImageVO();
			
			log.info("-----------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			UUID uuid = UUID.randomUUID();
			
			
			String uploadFileName = uuid.toString() + "_" + multipartFile.getOriginalFilename();
			
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
			
				multipartFile.transferTo(saveFile);
				
				productImage.setUploadPath(uploadPath.getCanonicalPath());
				productImage.setUuid(uuid.toString());
				productImage.setFileName(uploadFileName);
				
				if(checkImageType(saveFile)) {
					productImage.setFileType(true);
				}
				
				list.add(productImage);
			} catch (Exception e) {
				log.error(e.getMessage());
			} 
		}
		return new ResponseEntity<> (list, HttpStatus.OK);
	}
	
	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		
		log.info("delete File: " + fileName);
		
		File file;
		
		try {
			file = new File(URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("파일이 삭제되었습니다.", HttpStatus.OK);
	}
	
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		} catch(IOException e) {
			e.printStackTrace();
		}
		return false;
	}
}
