package com.portfolio.erp.controller.admin.company;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.portfolio.erp.model.company.CompanyVO;
import com.portfolio.erp.service.admin.company.CompanySrv;

@Controller
public class CompanyCtr {
	
	@Autowired
	CompanySrv companySrv;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	@RequestMapping(value="/admin/company", method = RequestMethod.GET)
	public ModelAndView getCompanyInfo() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("company", companySrv.getCompanyInfo());
		mav.setViewName("erp/admin/erp_company/company_info");
		
		return mav;
	}
	
	@RequestMapping(value="/admin/company", method = RequestMethod.POST)
	public String setCompanyInfo(@ModelAttribute CompanyVO cvo, 
									@RequestPart MultipartFile comCeoImgFile, 
									@RequestPart MultipartFile comStampImgFile, 
									@RequestPart MultipartFile comCeoStampImgFile,
									@RequestPart MultipartFile comCeoSignImgFile) throws IOException {

		System.out.println(comCeoImgFile.getSize());
		System.out.println(comStampImgFile.getSize());
		UUID uuid = UUID.randomUUID();
		String fileName = "";
		File location = null;
		
		// 사진이 있으면 그대로 표시하고 업데이트 NULL로 안하도록 예외처리
		CompanyVO com = companySrv.getCompanyInfo();
		
		cvo.setComCeoImg(com.getComCeoImg());
		cvo.setComStampImg(com.getComStampImg());
		cvo.setComCeoStampImg(com.getComCeoStampImg());
		cvo.setComCeoSignImg(com.getComCeoSignImg());
		
		/* 대표자 이미지 업로드 */
		if(!comCeoImgFile.isEmpty()) {
			fileName = uuid.toString() + "_" + comCeoImgFile.getOriginalFilename();
			location = new File(uploadPath+"/companyImg", fileName);
			FileCopyUtils.copy(comCeoImgFile.getBytes(), location);
			cvo.setComCeoImg(fileName);
		}
		
		/* 회사 도장 이미지 업로드 */
		if (!comStampImgFile.isEmpty()) {
			fileName = uuid.toString() + "_" + comStampImgFile.getOriginalFilename();
			location = new File(uploadPath+"/companyImg", fileName);
			FileCopyUtils.copy(comStampImgFile.getBytes(), location);
			cvo.setComStampImg(fileName);
		}
		
		/* 대표자 도장 이미지 업로드 */
		if (!comCeoStampImgFile.isEmpty()) {
			fileName = uuid.toString() + "_" + comCeoStampImgFile.getOriginalFilename();
			location = new File(uploadPath+"/companyImg", fileName);
			FileCopyUtils.copy(comCeoStampImgFile.getBytes(), location);
			cvo.setComCeoStampImg(fileName);
		}
		
		/* 대표자 서명 이미지 업로드 */
		if (!comCeoSignImgFile.isEmpty()) {
			fileName = uuid.toString() + "_" + comCeoSignImgFile.getOriginalFilename();
			location = new File(uploadPath+"/companyImg", fileName);
			FileCopyUtils.copy(comCeoSignImgFile.getBytes(), location);
			cvo.setComCeoSignImg(fileName);
		}
		
		companySrv.setCompanyInfo(cvo);	
		return "redirect:/admin/company";
	}

}
