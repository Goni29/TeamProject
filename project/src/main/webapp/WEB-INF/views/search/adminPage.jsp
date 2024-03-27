<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../header.jsp"%>

<style>
	.border {
        border: 1px solid #dee2e6;
    }
    .border table {
        margin-bottom: 0;
    }
    .border th, .border td {
        border: 1px solid #dee2e6;
    }
    .border thead th {
        border-bottom-width: 2px;
    }
    .page-size {
        width: 100vw;
    }
</style>

<body>
<div id="wrapper">
    
<%@ include file="../sidebar.jsp"%>
<div id="content-wrapper" class="d-flex flex-column page-size">       
<%@ include file="../topbar.jsp"%>

<div class="container mt-3">
	<select id="detailSelect" class="form-control">
		<option value="general" selected>전반</option>
		<option value="detailed">세부</option>
	</select>
</div>

<span class="titletext" hidden="hidden">상품 검색 이력</span>
<div class="container-fluid p-5 text-center">
    <h1>상품 검색 이력</h1>
</div>

<div class="container mt-5">

<<<<<<< HEAD
=======
            <c:if test="${sList == null}">
                <script>
                    alert("잘못된 요청입니다");
                </script>
            </c:if>
            
			<div class="border">
	            <table class="table table-striped table-hover">
	                <thead>
	                    <tr class="gender common-class" hidden="hidden">
	                        <th>카테고리</th>
	                        <th>조회수</th>
	                        <th>남성</th>
	                        <th>여성</th>
	                    </tr> 
	                </thead>
	                <tbody>
	                <c:forEach var="s" items="${sList}">
	                    <tr class="gender common-class" hidden="hidden">
	                        <td>${s.PCATEGORY}</td>
	                        <td>${s.PCATEGORY_COUNT}</td>
	                        <td>${s.male}</td>
	                        <td>${s.female}</td>
	                    </tr>
	                    </c:forEach>
	                </tbody>
	            </table>
	                
	            <table class="table table-striped table-hover">
	                <thead>
	                    <tr class="locale common-class" hidden="hidden">
	                        <th>검색어</th>
	                        <th>검색 회수</th>
	                        <th>서울</th>
	                        <th>인천</th>
	                        <th>부산</th>
	                        <th>대구</th>
	                        <th>광주</th>
	                        <th>대전</th>
	                        <th>울산</th>
	                        <th>경기</th>
	                        <th>강원</th>
	                        <th>충북</th>
	                        <th>충남</th>
	                        <th>전북</th>
	                        <th>전남</th>
	                        <th>경북</th>
	                        <th>경남</th>
	                        <th>제주</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:forEach var="s" items="${sList}">
	                    <tr class="locale common-class" hidden="hidden">
	                        <td>${s.PCATEGORY}</td>
	                        <td>${s.PCATEGORY_COUNT}</td>
	                        <td>${s.seoul}</td>
	                        <td>${s.incheon}</td>
	                        <td>${s.busan}</td>
	                        <td>${s.daegu}</td>
	                        <td>${s.gwangju}</td>
	                        <td>${s.daejeon}</td>
	                        <td>${s.ulsan}</td>
	                        <td>${s.gyeonggi}</td>
	                        <td>${s.gangwon}</td>
	                        <td>${s.chungbuk}</td>
	                        <td>${s.chungnam}</td>
	                        <td>${s.jeonbuk}</td>
	                        <td>${s.jeonnam}</td>
	                        <td>${s.gyeongbuk}</td>
	                        <td>${s.gyeongnam}</td>
	                        <td>${s.JEJU}</td>
	                    </tr>
	                    </c:forEach>
	                </tbody>
	            </table>
	                
	            <table class="table table-striped table-hover">
	                <thead>
	                    <tr class="age common-class" hidden="hidden">
	                        <th>검색어</th>
	                        <th>검색 회수</th>
	                        <th>10대 이하</th>
	                        <th>20대</th>
	                        <th>30대</th>
	                        <th>40대</th>
	                        <th>50대</th>
	                        <th>60대 이상</th>
	                    </tr>
	                </thead>
	                <tbody>
	                <c:forEach var="s" items="${sList}">
	                    <tr class="age common-class" hidden="hidden">
	                        <td>${s.PCATEGORY}</a></td>
	                        <td>${s.PCATEGORY_COUNT}</td>
	                        <td>${s.teens}</td>
	                        <td>${s.twenties}</td>
	                        <td>${s.thirties}</td>
	                        <td>${s.forties}</td>
	                        <td>${s.fifties}</td>
	                        <td>${s.above}</td>
	                    </tr>
	                    </c:forEach>
	                </tbody>
	            </table>
            </div>
            
        </div>
    </div>
    
>>>>>>> branch 'master' of https://github.com/Goni29/TeamProject.git
	<%@ include file="./general_page.jsp"%>
	
	<%@ include file="./detail_page.jsp"%>
    
</div>

</div>
</div>

<script>
    $(document).ready(function(){
      $('input[type="checkbox"][name="filter"]').change(function() {
        $('.table tr').attr('hidden', true);

        $('input[type="checkbox"][name="filter"]:checked').each(function() {
          const value = $(this).val();
          $('.' + value).attr('hidden', false);
        });
      });
    });
    
    function toggleContent() {
        var selection = document.getElementById("detailSelect").value;
        var generalContent = document.getElementById("content-general");
        var detailedContent = document.getElementById("content-detailed");

        if (selection === "general") {
            generalContent.style.display = "block";
            detailedContent.style.display = "none";
        } else if (selection === "detailed") {
            generalContent.style.display = "none";
            detailedContent.style.display = "block";
        }
    }

    document.addEventListener("DOMContentLoaded", function() {
        toggleContent();
    });

    document.getElementById("detailSelect").addEventListener("change", toggleContent);
    
</script>

<%@include file="../footer.jsp"%>
</body>