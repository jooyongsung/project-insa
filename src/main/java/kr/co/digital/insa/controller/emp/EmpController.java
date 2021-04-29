/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package kr.co.digital.insa.controller.emp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.digital.insa.service.emp.EmpService;
import kr.co.digital.insa.vo.emp.EmpVO;
import kr.co.digital.insa.vo.emp.SearchVO;

/**
 * @Class Name : EmpController.java
 * @Description : Emp Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
@RequestMapping("/emp/")
public class EmpController {

	/** EmpService */
	@Resource(name = "empService")
	private EmpService empService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * 글 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SearchVO
	 * @param model
	 * @return "empList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/empList.do")
	public String selectEmpList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model) throws Exception {

		/** EgovPropertyService.emp */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> empList = empService.selectEmpList(searchVO);
		model.addAttribute("resultList", empList);

		int totCnt = empService.selectEmpListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "emp/empList";
	}

	/**
	 * 글 등록 화면을 조회한다.
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "empRegister"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addEmp.do", method = RequestMethod.GET)
	public String addEmpView(@ModelAttribute("searchVO") SearchVO searchVO, Model model) throws Exception {
		model.addAttribute("empVO", new EmpVO());
		return "emp/empRegister";
	}

	/**
	 * 글을 등록한다.
	 * @param empVO - 등록할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @return "forward:/empList.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addEmp.do", method = RequestMethod.POST)
	public String addEmp(@ModelAttribute("searchVO") SearchVO searchVO, EmpVO empVO, BindingResult bindingResult, Model model)
			throws Exception {

		if (bindingResult.hasErrors()) {
			model.addAttribute("empVO", empVO);
			return "emp/empRegister";
		}

		empService.insertEmp(empVO);
		return "forward:/empList.do";
	}

	/**
	 * 글 수정화면을 조회한다.
	 * @param id - 수정할 글 id
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "empRegister"
	 * @exception Exception
	 */
	@RequestMapping("/updateEmpView.do")
	public String updateEmpView(@RequestParam("selectedId") String id, @ModelAttribute("searchVO") SearchVO searchVO, Model model) throws Exception {
		EmpVO empVO = new EmpVO();
		empVO.setId(id);
		// 변수명은 CoC 에 따라 empVO
		model.addAttribute(selectEmp(empVO, searchVO));
		return "emp/empRegister";
	}

	/**
	 * 글을 조회한다.
	 * @param empVO - 조회할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @return @ModelAttribute("empVO") - 조회한 정보
	 * @exception Exception
	 */
	public EmpVO selectEmp(EmpVO empVO, @ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
		return empService.selectEmp(empVO);
	}

	/**
	 * 글을 수정한다.
	 * @param empVO - 수정할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @return "forward:/empList.do"
	 * @exception Exception
	 */
	@RequestMapping("/updateEmp.do")
	public String updateEmp(@ModelAttribute("searchVO") SearchVO searchVO, EmpVO empVO, BindingResult bindingResult, Model model)
			throws Exception {

		empService.updateEmp(empVO);
		return "forward:/empList.do";
	}
	
	/**
	 * 글을 수정한다.
	 * @param empVO - 수정할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @return "forward:/empList.do"
	 * @exception Exception
	 */
	@RequestMapping("/updateEmpAjax.do")
	public Model updateEmp(@ModelAttribute("EmpVO") EmpVO empVO, Model model)
			throws Exception {

		empService.updateEmp(empVO);
		return model;
	}

	/**
	 * 글을 삭제한다.
	 * @param empVO - 삭제할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @return "forward:/empList.do"
	 * @exception Exception
	 */
	@RequestMapping("/deleteEmp.do")
	public String deleteEmp(EmpVO empVO, @ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
		empService.deleteEmp(empVO);
		return "forward:/empList.do";
	}

}
