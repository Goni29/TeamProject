<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>처리결과 응답 페이지</title>
<style>
/* 모달창 기본 스타일 */
.modal {
  display: none; 
  position: fixed; 
  z-index: 1; 
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto; 
  background-color: rgb(0,0,0);
  background-color: rgba(0,0,0,0.4); 
}

/* 모달창 내용 */
.modal-content {
  background-color: #fefefe;
  margin: 15% auto; 
  padding: 20px;
  border: 1px solid #888;
  width: 60%; /* 너비 조정 */
}

/* 닫기 버튼 */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

/* 홈 버튼 스타일 */
.home-btn {
  display: inline-block;
  margin-top: 20px;
  padding: 10px 20px;
  background-color: #007bff;
  color: white;
  text-decoration: none;
  font-size: 16px;
  border-radius: 5px;
}

.home-btn:hover {
  background-color: #0056b3;
}
</style>
</head>
<body>

<!-- 모달창 -->
<div id="myModal" class="modal">

  <!-- 모달창 내용 -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <div>${message}</div>
    <!-- 홈으로 바로 가는 버튼 추가 -->
    <a href="/" class="home-btn">홈으로</a>
  </div>

</div>

<script>
// 모달창 가져오기
var modal = document.getElementById("myModal");

// 닫기 버튼 가져오기
var span = document.getElementsByClassName("close")[0];

// 페이지 로드 시 모달창 열기
window.onload = function() {
  modal.style.display = "block";
}

// 사용자가 (x) 버튼을 클릭하면 모달창 닫기
span.onclick = function() {
  modal.style.display = "none";
}

// 사용자가 모달창 밖의 어디든 클릭하면 모달창 닫기
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

setTimeout(function() {
    window.location.href = "/"; // 메인 페이지 URL로 변경해주세요.
}, 5000);
</script>

</body>
</html>
<%@ include file="../footer.jsp"%>