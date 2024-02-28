<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="./include.jsp"%>



<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow ">
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
        </button>

        <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
                <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                    aria-label="Search" aria-describedby="basic-addon2">
                <div class="input-group-append">
                    <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                    </button>
                </div>
            </div>
        </form>

        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown no-arrow d-sm-none">
                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-search fa-fw"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                    aria-labelledby="searchDropdown">
                    <form class="form-inline mr-auto w-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small"
                                placeholder="Search for..." aria-label="Search"
                                aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="bi bi-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </li>

            <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <!-- 관리자 페이지 -->
                    <c:if test="${loginVo.grade >= 3}">
                        <div class="collapse navbar-collapse" id="navbarNavDarkDropdownAdmin">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLinkAdmin" role="button"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 관리자 페이지 </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDarkDropdownMenuLinkAdmin">
                                        <a class="dropdown-item" href="/search/adminPage">상품 검색 통계</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </c:if>
                    <!-- 로그인 -->
                    <c:if test="${loginVo == null}">
                        <div class="collapse navbar-collapse position-static" id="navbarNavDarkDropdownLogin">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLinkLogin" role="button"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 로그인 </a>
                                    <form id="loginForm" class="dropdown-menu p-4" action="/user/login" method="post"
                                        style="background-color: #4e73df; width: 300px;">
                                        <div class="mb-3">
                                            <label for="idInput" class="form-label" style="color: white;">아이디</label>
                                            <input type="text" class="form-control" id="idInput" name="id">
                                        </div>
                                        <div class="mb-3">
                                            <label for="pwInput" class="form-label" style="color: white;">비밀번호</label>
                                            <input type="password" class="form-control" id="pwInput" name="password">
                                        </div>
                                        <input type="text" class="link" name="link" hidden="hidden"> 
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
					        <input type="text" class="link" name="link" hidden="hidden">
					        <button id="logoutButton" type="submit" class="nav-link btn btn-link" style="background: none; border: none; cursor: pointer;">로그아웃</button>
					    </form>
					</li>
				</c:if>
                </ul>
            </div>
        </ul>
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