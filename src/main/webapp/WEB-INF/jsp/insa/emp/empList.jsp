<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fn"     uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><spring:message code="title.sample" /></title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script type="text/javascript" src="/static/common/js/jquery/jquery-3.4.1.min.js"></script>
  	<script type="text/javascript" src="/static/common/js/jquery/swiper.min.js"></script>
  	<script type="text/javascript" src="/static/common/js/jquery/ui-front.js"></script>
  	<script type="text/javascript" src="/static/common/js/jquery/common.js"></script>
    <script type="text/javaScript" language="javascript" defer="defer">
        <!--
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }

      //-->
        function fn_emp_detail(empNo){
        	dovument.listForm.addParam("empNo", val.parent().find("empNo").val());
        	document.listForm.setUrl("<c:url value='/emp/selectEmp.do'/>");
        	document.listForm.submit();
        }
    </script>
</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <form:form commandName="empVO" id="listForm" name="listForm" method="post">
        <input type="hidden" name="selectedId" />
        <div id="content_pop">
        	<!-- 타이틀 -->
        	<div id="title">
        		<ul>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><spring:message code="list.sample" /></li>
        		</ul>
        	</div>
        	<!-- // 타이틀 -->
        	<div id="search">
        		<ul>
        			<li>
        			    <label for="searchCondition" style="visibility:hidden;"><spring:message code="search.choose" /></label>
        				<form:select path="searchCondition" cssClass="use">
        					<form:option value="1" label="이름" />
        					<form:option value="2" label="사원명" />
        					<form:option value="3" label="이메일" />
        					<form:option value="4" label="직책" />
        					<form:option value="5" label="직급" />
        				</form:select>
        			</li>
        			<li><label for="searchKeyword" style="visibility:hidden;display:none;"><spring:message code="search.keyword" /></label>
                        <form:input path="searchKeyword" cssClass="txt"/>
                    </li>
        			<li>
        	            <span class="btn_blue_l">
        	                <a href="javascript:fn_egov_selectList();"><spring:message code="button.search" /></a>
        	                <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
        	            </span>
        	        </li>
                </ul>
        	</div>
        	<!-- List -->
        	<div id="table">
        		<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="사원번호, 사원명, 영문이름, 이메일, 전화번호, 성별, 직급, 직책, 입사연도, 퇴사연도, 재직구분">
        			<caption style="visibility:hidden">사원번호, 사원명, 영문이름, 이메일, 전화번호, 성별, 직급, 직책, 입사연도, 퇴사연도, 재직구분</caption>
        			<colgroup>
        				<col width="60"/>
        				<col width="100"/>
        				<col width="100"/>
        				<col width="100"/>
        				<col width="100"/>
        				<col width="60"/>
        				<col width="80"/>
        				<col width="80"/>
        				<col width="100"/>
        				<col width="100"/>
        				<col width="80"/>
        			</colgroup>
        			<tr>
        				<th align="center">사번</th>
        				<th align="center">사원명</th>
        				<th align="center">영문이름</th>
        				<th align="center">이메일</th>
        				<th align="center">전화번호</th>
        				<th align="center">성별</th>
        				<th align="center">직급</th>
        				<th align="center">직책</th>
        				<th align="center">입사연도</th>
        				<th align="center">퇴사연도</th>
        				<th align="center">재직구분</th>
        			</tr>
        			<c:forEach var="item" items="${resultList}" varStatus="status">
            			<tr>
            				<td align="left" class="listtd"><input type="hidden" id="empNo" value="${item.empNo}"/><a href="javascript:fn_emp_detail(empNo);" /><c:out value="${item.empNo}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${item.empName}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${item.empEngName}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${item.empEmail}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${item.empPhone}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${item.empSex}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${item.empRank}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${item.empPosition}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${item.empHireDate}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${item.empRetireDate}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${item.empWork}"/>&nbsp;</td>
            			</tr>
        			</c:forEach>
        		</table>
        	</div>
        	<!-- /List -->
        	<div id="paging">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
        		<form:hidden path="pageIndex" />
        	</div>
        	<div id="sysbtn">
        	  <ul>
        	      <li><!-- 등록 버튼 -->
        	          <span class="btn_blue_l">
        	              <a href="insertEmp.do"><spring:message code="button.create" /></a>
                          <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                      </span>
                  </li>
              </ul>
        	</div>
        </div>
    </form:form>
</body>
</html>
