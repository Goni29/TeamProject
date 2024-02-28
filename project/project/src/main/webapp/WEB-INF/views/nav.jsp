<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="./include.jsp"%>


<nav class="navbar navbar-expand-sm bg-dark navbar-dark"
	style="position: fixed; width: 100%; top: 0; z-index: 100;">
	<div class="container-fluid">
		<a class="navbar-brand" href="/">Goni</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNavDarkDropdown1">
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDarkDropdownMenuLink" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> 게시판 </a>
					<ul class="dropdown-menu dropdown-menu-dark"
						aria-labelledby="navbarDarkDropdownMenuLink">
						<li><a class="dropdown-item" href="/board/list?category=0">자유 게시판</a></li>
						<li><a class="dropdown-item" href="/board/list?category=1">핫딜 게시판</a></li>
					</ul></li>
			</ul>
		</div>

		<div class="collapse navbar-collapse justify-content-end"
			id="collapsibleNavbar">
			<ul class="navbar-nav">

				<c:if test="${loginVo.grade >= 3}">
					<div class="collapse navbar-collapse" id="navbarNavDarkDropdown2">
						<ul class="navbar-nav">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDarkDropdownMenuLink" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> 관리자 페이지 </a>
								<ul class="dropdown-menu dropdown-menu-dark"
									aria-labelledby="navbarDarkDropdownMenuLink">
									<li><a class="dropdown-item"
										href="/search/adminPage">상품 검색 통계</a></li>
								</ul></li>
						</ul>
					</div>
				</c:if>



				<c:if test="${loginVo == null}">
				    <div class="collapse navbar-collapse dropstart" id="navbarNavDarkDropdown3">
				        <ul class="navbar-nav">
				            <li class="nav-item dropdown">
				                <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button"
				                   data-bs-toggle="dropdown" aria-expanded="false"> 로그인 </a>
				                <form id="loginForm" class="dropdown-menu p-4" action="/user/login" method="post"
				                      style="background-color: #343a40; width: 300px;">
				                    <div class="mb-3">
				                        <label for="idInput" class="form-label" style="color: white;">아이디</label>
				                        <input type="text" class="form-control" id="idInput" name="id">
				                    </div>
				                    <div class="mb-3">
				                        <label for="pwInput" class="form-label" style="color: white;">비밀번호</label>
				                        <input type="password" class="form-control" id="pwInput" name="password">
				                    </div>
				                    
				                    <input type="text" class="link" name="link" hidden="hidden"> <!-- 링크 정보 -->
				                    
				                    <button id="loginButton" type="submit" class="btn btn-primary">로그인</button>
				                    <a href='/user/add' class="btn btn-success">회원 가입</a>
				                </form>
				            </li>
				        </ul>
				    </div>
				</c:if>


				<c:if test="${loginVo != null}">
					<div class="collapse navbar-collapse" id="navbarNavDarkDropdown4">
						<ul class="navbar-nav">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDarkDropdownMenuLink" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> 회원 정보 </a>
								<ul class="dropdown-menu dropdown-menu-dark"
									aria-labelledby="navbarDarkDropdownMenuLink">
									<li><a class="dropdown-item"
										href="/search/userPage?id=${loginVo.id}">상품 검색 이력</a></li>
									<li><a class="dropdown-item"
										href="/market/userPage?id=${loginVo.id}">상품 조회 목록</a></li>
									<li><a class="dropdown-item"
										href="/favorite/userPage?id=${loginVo.id}">스크랩한 게시글</a></li>
									<li><a class="dropdown-item" href="/user/info">회원 정보
											수정</a></li>
								</ul></li>
						</ul>
					</div>
					<li class="nav-item">
					    <form id="logoutForm" action="/user/logout" method="get">
					        <input type="text" class="link" name="link" hidden="hidden"> <!-- 링크 정보 -->
					        <button id="logoutButton" type="submit" class="nav-link btn btn-link" style="background: none; border: none; cursor: pointer;">로그아웃</button>
					    </form>
					</li>
				</c:if>



			</ul>
		</div>
	</div>
</nav>

<script>
$(document).ready(function() {
	// 로그인/아웃 버튼 눌렸을 때 같은 링크로 되돌아 가도록
	$('#loginButton').on('click', function(e) {
		e.preventDefault();
		$('.link').val(document.location.href);
		$('#loginForm').submit();
	})

	$('#logoutButton').on('click', function(e) {
		e.preventDefault();
		$('.link').val(document.location.href);
		$('#logoutForm').submit();
	})
})
</script>


<div style="margin-top: 56px;">
	<!-- 높이를 네비게이션 바와 동일하게 조정 -->