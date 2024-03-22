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
            <div id="content main-content" class="main-width"> 
                <div class="container-fluid"> 
                 <div class="col-xl-10 col-md-12 mb-10">
                <h2>제품 등록</h2>

                <form:form modelAttribute="product"
                    action="${pageContext.request.contextPath}/product/register"
                    method="POST">
                    <form:label path="productName">상품명 : </form:label><br />
                    <form:input path="productName" />
                    <br />

                    <form:label path="marketName">마켓 이름 : </form:label><br />
                    <form:input path="marketName" />
                    <br />

                    <form:label path="url">상품 URL : </form:label><br />
                    <form:input path="url" />
                    <br />

                    <form:label path="imgUrl">이미지 URL : </form:label><br />
                    <form:input path="imgUrl" />
                    <br />

                    <form:label path="won">가격 : </form:label><br />
                    <form:input path="won" />
                    <br />

                    <form:label path="keyword">제품 키워드 : </form:label><br />
                    <form:input path="keyword" />
                    <br />

                    <form:label path="description">제품 설명 : </form:label><br />
                    <form:textarea path="description" rows="5" cols="30"></form:textarea>
                    <br />
                    
                    <form:label path="large">대분류 : </form:label><br />
                    <form:input path="large" />
                    <br />
                    
                    <form:label path="medium">중분류 : </form:label><br />
                    <form:input path="medium" />
                    <br />
                    
                    <form:label path="small">소분류 : </form:label><br />
                    <form:input path="small" />
                    <br />
                    
                    <form:label path="sub_category">세부 분류 : </form:label><br />
                    <form:input path="sub_category" />
                    <br />

                    <input type="submit" value="Register" />
                </form:form>
                </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>