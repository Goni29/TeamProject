<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ include file="../header.jsp"%>

<style>
    .page-size {
        width: 100vw;
    }
</style>
<body>
    <div id="wrapper">
        <%@ include file="../sidebar.jsp"%>
	        <div id="content-wrapper" class="d-flex flex-column page-size">       
		    <%@ include file="../topbar.jsp"%>
		    <div class="container mt-5">
		        <div class="row justify-content-center">
		            <div class="col-md-8">
		                <h2>제품 등록</h2>
		
		                <form:form modelAttribute="product" action="${pageContext.request.contextPath}/prlist/register" method="POST" class="mt-4">
		                    <div class="form-group">
		                        <form:label path="productName">상품명 :</form:label>
		                        <form:input path="productName" cssClass="form-control" />
		                    </div>
		
		                    <div class="form-group">
		                        <form:label path="marketName">마켓 이름 :</form:label>
		                        <form:input path="marketName" cssClass="form-control" />
		                    </div>
		
		                    <div class="form-group">
		                        <form:label path="url">상품 URL :</form:label>
		                        <form:input path="url" cssClass="form-control" />
		                    </div>
		
		                    <div class="form-group">
		                        <form:label path="imgUrl">이미지 URL :</form:label>
		                        <form:input path="imgUrl" cssClass="form-control" />
		                    </div>
		
		                    <div class="form-group">
		                        <form:label path="won">가격 :</form:label>
		                        <form:input path="won" cssClass="form-control" />
		                    </div>
		
		                    <div class="form-group">
		                        <form:label path="keyword">제품 키워드 :</form:label>
		                        <form:input path="keyword" cssClass="form-control" />
		                    </div>
		
		                    <div class="form-group">
		                        <form:label path="description">제품 설명 :</form:label>
		                        <form:textarea path="description" cssClass="form-control" rows="5"></form:textarea>
		                    </div>
		                    
		                    <div class="form-group">
		                        <form:label path="goaltarget">목표 인원 :</form:label>
		                        <form:input path="goaltarget" cssClass="form-control" />
		                    </div>
		                    
		                    <div class="form-group">
		                        <form:label path="large">대분류 :</form:label>
		                        <form:input path="large" cssClass="form-control" />
		                    </div>
		                    
		                    <div class="form-group">
		                        <form:label path="medium">중분류 :</form:label>
		                        <form:input path="medium" cssClass="form-control" />
		                    </div>
		                    
		                    <div class="form-group">
		                        <form:label path="small">소분류 :</form:label>
		                        <form:input path="small" cssClass="form-control" />
		                    </div>
		                    
		                    <div class="form-group">
		                        <form:label path="sub_category">세부 분류 :</form:label>
		                        <form:input path="sub_category" cssClass="form-control" />
		                    </div>
		
		                    <input type="submit" value="Register" class="btn btn-primary" />
		                </form:form>
		            </div>
	            </div>
	        </div>
	    </div>
	</div>
</html>