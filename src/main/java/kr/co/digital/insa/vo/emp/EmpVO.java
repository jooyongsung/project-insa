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
package kr.co.digital.insa.vo.emp;

/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
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
public class EmpVO extends SearchVO {

	private static final long serialVersionUID = 1L;

	/** 아이디 */
	private String id;

	/** 이름 */
	private String name;

	/** 내용 */
	private String description;

	/** 사용여부 */
	private String useYn;

	/** 등록자 */
	private String regUser;
	/** 아이디 */
	private String commCd;

	/** 이름 */
	private String commNm;
	
	private String emp_No;
	private String emp_Name;
	private String emp_Eng_Name;
	private String emp_Sex;
	private String emp_Email;
	private String emp_Phone;
	private String emp_Position; //직책
	private String emp_Rank; //직급
	private String emp_Hire_Date; //입사일
	private String emp_Retire_Date; //퇴사일
	private String emp_Work; //재직구분

	public String getEmp_No() {
		return emp_No;
	}

	public void setEmp_No(String emp_No) {
		this.emp_No = emp_No;
	}

	public String getEmp_Name() {
		return emp_Name;
	}

	public void setEmp_Name(String emp_Name) {
		this.emp_Name = emp_Name;
	}

	public String getEmp_Eng_Name() {
		return emp_Eng_Name;
	}

	public void setEmp_Eng_Name(String emp_Eng_Name) {
		this.emp_Eng_Name = emp_Eng_Name;
	}

	public String getEmp_Sex() {
		return emp_Sex;
	}

	public void setEmp_Sex(String emp_Sex) {
		this.emp_Sex = emp_Sex;
	}

	public String getEmp_Email() {
		return emp_Email;
	}

	public void setEmp_Email(String emp_Email) {
		this.emp_Email = emp_Email;
	}

	public String getEmp_Phone() {
		return emp_Phone;
	}

	public void setEmp_Phone(String emp_Phone) {
		this.emp_Phone = emp_Phone;
	}

	public String getEmp_Position() {
		return emp_Position;
	}

	public void setEmp_Position(String emp_Position) {
		this.emp_Position = emp_Position;
	}

	public String getEmp_Rank() {
		return emp_Rank;
	}

	public void setEmp_Rank(String emp_Rank) {
		this.emp_Rank = emp_Rank;
	}

	public String getEmp_Hire_Date() {
		return emp_Hire_Date;
	}

	public void setEmp_Hire_Date(String emp_Hire_Date) {
		this.emp_Hire_Date = emp_Hire_Date;
	}

	public String getEmp_Retire_Date() {
		return emp_Retire_Date;
	}

	public void setEmp_Retire_Date(String emp_Retire_Date) {
		this.emp_Retire_Date = emp_Retire_Date;
	}

	public String getEmp_Work() {
		return emp_Work;
	}

	public void setEmp_Work(String emp_Work) {
		this.emp_Work = emp_Work;
	}

	public String getCommCd() {
		return commCd;
	}

	public void setCommCd(String commCd) {
		this.commCd = commCd;
	}

	public String getCommNm() {
		return commNm;
	}

	public void setCommNm(String commNm) {
		this.commNm = commNm;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getRegUser() {
		return regUser;
	}

	public void setRegUser(String regUser) {
		this.regUser = regUser;
	}

}
