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
    <div class="dropdown">
        <select id="detailSelect" class="form-control">
        <option value="general">전반</option>
        <option value="detailed">세부</option>
    </select>
    </div>
</div>

<span class="titletext" hidden="hidden">상품 검색 이력</span>
<div class="container-fluid p-5 text-center">
    <h1>상품 검색 이력</h1>
</div>

<div class="container mt-5">
    <div id="content-general" class="row content">
        <div class="col">
        	<div class="d-flex justify-content-between">
			    <div class="flex-fill">
			        <div class="form-check form-check-inline">
			            <input class="form-check-input" type="radio" name="sortTime" id="searchSort1" value="1" checked="checked">
			            <label class="form-check-label" for="searchSort1">24시간</label>
			        </div>
			        <div class="form-check form-check-inline">
			            <input class="form-check-input" type="radio" name="sortTime" id="searchSort2" value="7">
			            <label class="form-check-label" for="searchSort2">일주일</label>
			        </div>
			        <div class="form-check form-check-inline">
			            <input class="form-check-input" type="radio" name="sortTime" id="searchSort3" value="30">
			            <label class="form-check-label" for="searchSort3">한 달</label>
			        </div>
			        <div class="form-check form-check-inline">
			            <input class="form-check-input" type="radio" name="sortTime" id="searchSort4" value="36500">
			            <label class="form-check-label" for="searchSort4">전체 기간</label>
			        </div>
			        <div class="form-check form-check-inline">
			            <input class="form-check-input" type="radio" name="sort" id="sort2" value="male">
			            <label class="form-check-label" for="sort2">남성</label>
			        </div>
			        <div class="form-check form-check-inline">
			            <input class="form-check-input" type="radio" name="sort" id="sort3" value="female">
			            <label class="form-check-label" for="sort3">여성</label>
			        </div>
			    </div>
			    
			    <div class="flex-fill">
		            <label><input type="checkbox" name="filter" value="gender">성별 &nbsp;</label>
		            <label><input type="checkbox" name="filter" value="locale">지역 &nbsp;</label>
		            <label><input type="checkbox" name="filter" value="age">연령 &nbsp;</label>
			    </div>
			</div>

            <c:if test="${sList == null}">
                <script>
                    alert("잘못된 요청입니다");
                </script>
            </c:if>
            
			<div class="border">
	            <table class="table table-striped table-hover">
	                <thead>
	                    <tr class="gender common-class" hidden="hidden">
	                        <th>검색어</th>
	                        <th>검색 회수</th>
	                        <th>남성</th>
	                        <th>여성</th>
	                    </tr> 
	                </thead>
	                <tbody>
	                    <tr class="gender common-class" hidden="hidden">
	                        <td><a href="/market/search?keyword=${s.searchWord}&type=11st&type=ama&type=amaJp&type=ebay"
	                            target="_blank">${s.searchWord}</a></td>
	                        <td>${s.searchCount}</td>
	                        <td>${s.male}</td>
	                        <td>${s.female}</td>
	                    </tr>
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
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr class="locale common-class" hidden="hidden">
	                        <td> <a href="/market/search?keyword=${s.searchWord}&type=11st&type=ama&type=amaJp&type=ebay"
	                            target="_blank">${s.searchWord}</a></td>
	                        <td>${s.searchCount}</td>
	                        <td>${s.seoul}</td>
	                        <td>${s.incheon}</td>
	                        <td>${s.busan}</td>
	                        <td>${s.deagu}</td>
	                        <td>${s.gwangju}</td>
	                        <td>${s.deajeon}</td>
	                        <td>${s.ulsan}</td>
	                        <td>${s.gyeonggi}</td>
	                        <td>${s.gangwon}</td>
	                        <td>${s.chungbuk}</td>
	                        <td>${s.chungnam}</td>
	                        <td>${s.jeonbuk}</td>
	                        <td>${s.jeonnam}</td>
	                        <td>${s.kyeongbuk}</td>
	                        <td>${s.kyeongnam}</td>
	                    </tr>
	                </tbody>
	            </table>
	                
	            <table class="table table-striped table-hover">
	                <thead>
	                    <tr class="age common-class" hidden="hidden">
	                        <th>검색어</th>
	                        <th>검색 회수</th>
	                        <th>10대 이하</th>
	                        <th>10대</th>
	                        <th>20대</th>
	                        <th>30대</th>
	                        <th>40대</th>
	                        <th>50대</th>
	                        <th>60대 이상</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr class="age common-class" hidden="hidden">
	                        <td><a href="/market/search?keyword=${s.searchWord}&type=11st&type=ama&type=amaJp&type=ebay"
	                            target="_blank">${s.searchWord}</a></td>
	                        <td>${s.searchCount}</td>
	                        <td>${s.underteen}</td>
	                        <td>${s.teen}</td>
	                        <td>${s.twenty}</td>
	                        <td>${s.thirty}</td>
	                        <td>${s.forty}</td>
	                        <td>${s.fifty}</td>
	                        <td>${s.sixtyover}</td>
	                    </tr>
	                </tbody>
	            </table>
            </div>
            
        </div>
    </div>
    <div id="content-detailed" class="row content" style="display: none;">
   	</div>
</div>

</div>
</div>

<script>
    $(document).ready(function(){
      // 체크박스의 상태가 변경될 때마다 함수 실행
      $('input[type="checkbox"][name="filter"]').change(function() {
        // 모든 테이블 행을 일단 숨깁니다.
        $('.table tr').attr('hidden', true);

        // 체크된 체크박스에 해당하는 테이블 행만 표시합니다.
        $('input[type="checkbox"][name="filter"]:checked').each(function() {
          const value = $(this).val();
          $('.' + value).attr('hidden', false);
        });
      });
    });
    
    $(document).ready(function(){
        $('#detailSelect').change(function(){
            // 모든 콘텐츠를 숨깁니다.
            $('.content').hide();
            
            // 선택된 값에 해당하는 콘텐츠의 ID를 만듭니다.
            var contentId = "#content-" + $(this).val();
            
            // 해당 ID를 가진 콘텐츠만 표시합니다.
            $(contentId).show();
        });
    });
    
</script>

<%@include file="../footer.jsp"%>
</body>