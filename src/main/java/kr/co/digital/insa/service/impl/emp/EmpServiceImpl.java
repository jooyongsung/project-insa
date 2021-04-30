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
package kr.co.digital.insa.service.impl.emp;

import java.util.List;
import java.util.Map;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.co.digital.insa.dao.emp.EmpDAO;
import kr.co.digital.insa.service.emp.EmpService;
import kr.co.digital.insa.vo.emp.EmpVO;
import kr.co.digital.insa.vo.emp.SearchVO;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * @Class Name : EmpServiceImpl.java
 * @Description : Emp Business Implement Class
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

@Service("empService")
public class EmpServiceImpl extends EgovAbstractServiceImpl implements EmpService {

	private static final Logger LOGGER = LoggerFactory.getLogger(EmpServiceImpl.class);
	
	/**
	 * EmpMapper
	 */
	@Resource(name = "empMapper")
	private EmpMapper empMapper;

	/** EmpDAO */
	// TODO ibatis 사용
	@Resource(name = "empDAO")
	private EmpDAO empDAO;
	// TODO mybatis 사용
	//  @Resource(name="empMapper")
	//	private EmpMapper empDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 EmpVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public String insertEmp(EmpVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		/** ID Generation Service */
		String id = egovIdGnrService.getNextStringId();
		vo.setId(id);
		LOGGER.debug(vo.toString());

		empDAO.insertEmp(vo);
		return id;
	}

	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 EmpVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void updateEmp(EmpVO vo) throws Exception {
		empDAO.updateEmp(vo);
	}

	/**
	 * 글을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 EmpVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void deleteEmp(EmpVO vo) throws Exception {
		empDAO.deleteEmp(vo);
	}

	/**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 EmpVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	@Override
	public List<Map>  selectEmp(EmpVO vo) throws Exception {
		return empMapper.selectEmp(vo);
	}

	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectEmpList(SearchVO searchVO) throws Exception {
		return empDAO.selectEmpList(searchVO);
	}

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	@Override
	public int selectEmpListTotCnt(SearchVO searchVO) {
		return empDAO.selectEmpListTotCnt(searchVO);
	}

}
