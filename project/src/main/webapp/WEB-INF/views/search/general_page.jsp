<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <div id="content-general" class="row content">
        <div class="col">
        	<div class="d-flex justify-content-between">
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
	                        <th>조회항목</th>
	                        <th>조회수</th>
	                        <th>남성</th>
	                        <th>여성</th>
	                    </tr> 
	                </thead>
	                <tbody>
	                <c:forEach var="s" items="${sList}">
	                    <tr class="gender common-class" hidden="hidden">
	                        <td id="productCategory">${s.PCATEGORY}</td>
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
	                        <th>조회항목</th>
	                        <th>조회수</th>
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
	                        <td id="productCategory">${s.PCATEGORY}</td>
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
	                        <th>조회항목</th>
	                        <th>조회수</th>
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
	                        <td id="productCategory">${s.PCATEGORY}</td>
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
</html>