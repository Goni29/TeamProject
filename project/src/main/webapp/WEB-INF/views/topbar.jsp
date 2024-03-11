<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow ">
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
            <div class="dropdown-login dropdown-menu-right p-3 shadow animated--grow-in"
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
                    <form id="loginForm" class="form-inline ml-auto" action="/user/login" method="post">
                        <input type="hidden" name="redirectUrl" class="redirectUrl">
                        <input type="text" class="form-control" id="idInput" name="id" placeholder="아이디">
                        &nbsp;<input type="password" class="form-control" id="pwInput" name="password" placeholder="비밀번호">
                        &nbsp;<button id="loginButton" class="btn btn-primary" type="submit">로그인</button>
                        &nbsp;<a href='/user/add' class="btn btn-primary">회원 가입</a>
                    </form>
                </c:if>

                <c:if test="${loginVo != null}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            회원 정보
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="/search/userPage?id=${loginVo.id}">상품 검색 이력</a>
                            <a class="dropdown-item" href="/market/userPage?id=${loginVo.id}">상품 조회 목록</a>
                            <a class="dropdown-item" href="/favorite/userPage?id=${loginVo.id}">스크랩한 게시글</a>
                            <a class="dropdown-item" data-toggle="modal" data-target="#passwordModal">회원 정보 수정</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <form id="logoutForm" action="/user/logout" method="get">
                            <input type="hidden" name="redirectUrl" class="redirectUrl">
                            <button id="logoutButton" type="submit" class="btn btn-warning">로그아웃</button>
                        </form>
                    </li>
                </c:if>
            </ul>
        </div>
    </ul>
</nav>

<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="passwordModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="passwordModalLabel">패스워드 확인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <h2>상세 정보 페이지로 이동하기 위해 비밀번호를 입력해 주세요.</h2>
        <form action="/user/info" method="post">
          <input type="password" name="password" />
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary">상세 정보 페이지로</button>
        </form>
      </div>
      </div>
    </div>
  </div>

<script>
    $(document).ready(function() {
        $('#loginButton, #logoutButton').on('click', function(e) {
            e.preventDefault();
            $('.redirectUrl').val(window.location.href);
            $(this).closest("form").submit();
        });
    });
</script>