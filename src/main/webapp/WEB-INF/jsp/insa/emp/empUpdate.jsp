<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleRegister.jsp
  * @Description : Sample Register 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    
    <!--For Commons Validator Client Side-->
    <!--  
    <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script> 
    <validator:javascript formName="empVO" staticJavascript="false" xhtml="true" cdata="false"/>
    -->
    <script type="text/javaScript" language="javascript" defer="defer">
        <!--
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
           	document.detailForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.detailForm.submit();
        }
        
        /* 글 삭제 function */
        function fn_egov_delete() {
           	document.detailForm.action = "<c:url value='/deleteSample.do'/>";
           	document.detailForm.submit();
        }
        
        /* 글 등록 function */
        function fn_egov_save() {
        	frm = document.detailForm;
        	if(!validateSampleVO(frm)){
                return;
            }else{
            	frm.action = "<c:url value="/*${registerFlag == 'create' ? '/addSample.do' : '/updateSample.do'}"/>";*/
                frm.submit();
            }
        }
        
        -->
        <!--
        var empId = "";
        $.ajax({
	        url  : '/emp/updateEmpAjax.do',
	        type : 'post',
	        data : { empId : empId},
	        success:function(data) {
	        	alert("수정되었습니다.");
	        },
	        error : function(request, status, error ) {   // 오류가 발생했을 때 호출된다. 
	        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	      	}
	    });
        -->
    </script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

<form:form commandName="empVO" id="registerForm" name="registerForm" method="post">
    <div id="content_pop">
    	<!-- // 타이틀 -->
    	<div id="table">
    	<table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
    		<colgroup>
    			<col width="150"/>
    			<col width="?"/>
    		</colgroup>
        	<tr>
        		<td class="tbtd_caption"><label for="empNo">사번</label></td>
        		<td class="tbtd_content">
        			<form:input path="empNo" cssClass="txt" maxlength="30"/>
        		</td>
        	</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="empName">사원명</label></td>
    			<td class="tbtd_content">
    				<form:input path="empName" maxlength="30" cssClass="txt"/>
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="empEngName">영문이름</label></td>
    			<td class="tbtd_content">
    				<form:input path="empEngName" maxlength="30" cssClass="txt"/>
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="empEmail">이메일</label></td>
    			<td class="tbtd_content">
    				<form:input path="empEmail" maxlength="30" cssClass="txt"/>
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="empPhone">전화번호</label></td>
    			<td class="tbtd_content">
    				<form:input path="empPhone" maxlength="30" cssClass="txt"/>
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="empSex">성별</label></td>
    			<td class="tbtd_content">
    				<form:select path="empSex" cssClass="use">
    					<form:option value="1" label="남" />
    					<form:option value="0" label="여" />
    				</form:select>
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="empRank">직급</label></td>
    			<td class="tbtd_content">
    				<form:select path="empRank" cssClass="use">
    					<form:option value="1" label="사원" />
    					<form:option value="2" label="과장" />
    					<form:option value="3" label="부장" />
    					<form:option value="4" label="전무" />
    				</form:select>
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="empPosition">직책</label></td>
    			<td class="tbtd_content">
    				<form:select path="empPosition" cssClass="use">
    					<form:option value="1" label="SI" />
    					<form:option value="2" label="SM" />
    				</form:select>
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="empHiredate">입사날짜</label></td>
    			<td class="tbtd_content">
    				<form:input path="empHiredate" maxlength="30" cssClass="txt"/>
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="empRetiredate">퇴사날짜</label></td>
    			<td class="tbtd_content">
    				<form:input path="empRetiredate" maxlength="30" cssClass="txt"/>
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="empWork">재직구분</label></td>
    			<td class="tbtd_content">
    				<form:select path="empWork" cssClass="use">
    					<form:option value="1" label="재직" />
    					<form:option value="0" label="퇴사" />
    				</form:select>
    			</td>
    		</tr>
    	
    		<!--
    		<tr>
    			<td class="tbtd_caption"><label for="regUser"><spring:message code="title.sample.regUser" /></label></td>
    			<td class="tbtd_content">
                    <c:if test="${registerFlag == 'modify'}">
        				<form:input path="regUser" maxlength="10" cssClass="essentiality" readonly="true" />
        				&nbsp;<form:errors path="regUser" /></td>
                    </c:if>
                    <c:if test="${registerFlag != 'modify'}">
        				<form:input path="regUser" maxlength="10" cssClass="txt"  />
        				&nbsp;<form:errors path="regUser" /></td>
                    </c:if>
    		</tr>
    		-->
    	</table>
      </div>
    	<div id="sysbtn">
    		<ul>
    			<!-- 등록 버튼 -->
    			<li>
                    <span class="btn_blue_l">
                        <button type="submit"><spring:message code="button.create" /></button>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
    			<!-- 글 목록 -->
    			<li>
                    <span class="btn_blue_l">
                        <a href="empList.do"><spring:message code="button.list" /></a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
                <!--  수정 버튼 -->
                <li>
                    <span class="btn_blue_l">
                        <a href="updateEmp.do">
                            <spring:message code="button.modify" />
                        </a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
                <!--  삭제 버튼 -->
                <li>
                    <span class="btn_blue_l">
                        <a href=""><spring:message code="button.delete" /></a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
            </ul>
    	</div>
    </div>
</form:form>
</body>
</html>