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
       /* 글 목록 화면 function */
        function fn_egov_selectList() {
           	document.detailForm.action = "<c:url value='/emp/empList.do'/>";
           	document.detailForm.submit();
        }
       
        /* 글 수정 화면 function */
        function fn_egov_update(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/updateSampleView.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 삭제 function */
        function fn_egov_delete() {
           	document.detailForm.action = "<c:url value='/deleteSample.do'/>";
           	document.detailForm.submit();
        }

    </script>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

<form:form commandName="empVO" id="selectForm" name="selectForm" method="post">
    <div id="content_pop">
    	<!-- // 타이틀 -->
    	<div id="table">
    	<table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
    		<colgroup>
    			<col width="150"/>
    			<col width="?"/>
    		</colgroup>
    		
    		<c:forEach var="item" items="${resultList}" varStatus="status"> 
	        	<tr>
	        		<td class="tbtd_caption"><label for="empNo">사번</label></td>
	        		<td class="tbtd_content">
	        			<c:out value="${item.empNo}"/>
	        		</td>
	        	</tr>
	    		<tr>
	    			<td class="tbtd_caption"><label for="empName">사원명</label></td>
	    			<td class="tbtd_content">
	    				<c:out value="${item.empName}"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="tbtd_caption"><label for="empEngName">영문이름</label></td>
	    			<td class="tbtd_content">
	    				<c:out value="${item.empEngName}"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="tbtd_caption"><label for="empEmail">이메일</label></td>
	    			<td class="tbtd_content">
	    				<c:out value="${item.empEmail}"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="tbtd_caption"><label for="empPhone">전화번호</label></td>
	    			<td class="tbtd_content">
	    				<c:out value="${item.empPhone}"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="tbtd_caption"><label for="empSex">성별</label></td>
	    			<td class="tbtd_content">
	    				<c:out value="${item.empSex}"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="tbtd_caption"><label for="empRank">직급</label></td>
	    			<td class="tbtd_content">
	    				<c:out value="${item.empRank}"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="tbtd_caption"><label for="empPosition">직책</label></td>
	    			<td class="tbtd_content">
	    				<c:out value="${item.empPosition}"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="tbtd_caption"><label for="empHireDate">입사날짜</label></td>
	    			<td class="tbtd_content">
	    				<c:out value="${item.empHireDate}"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="tbtd_caption"><label for="empRetireDate">퇴사날짜</label></td>
	    			<td class="tbtd_content">
	    				<c:out value="${item.empRetireDate}"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class="tbtd_caption"><label for="empWork">재직구분</label></td>
	    			<td class="tbtd_content">
	    				<c:out value="${item.empWork}"/>
	    			</td>
	    		</tr>
    		</c:forEach>
    	</table>
      </div>
    	<div id="sysbtn">
    		<ul>
    			<!-- 글 목록 -->
    			<li>
                    <span class="btn_blue_l">
                        <a href="empList.do"><spring:message code="button.list" /></a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
                <!-- 수정  버튼 -->
    			<li>
                    <span class="btn_blue_l">
                        <a href="javascript:fn_egov_update(id);"><spring:message code="button.update" /></a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
    			<!-- 삭제 버튼 -->
    			<li>
                    <span class="btn_blue_l">
                        <a href="javascript:fn_egov_delete();"><spring:message code="button.delete" /></a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
            </ul>
    	</div>
    </div>
</form:form>
</body>
</html>