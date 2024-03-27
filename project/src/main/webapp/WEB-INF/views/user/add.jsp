<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../header.jsp"%>

<style>
.page-size{
	width: 100vw;
}
</style>
<body>

<div id="wrapper">
    
<%@ include file="../sidebar.jsp"%>
<div id="conteny-wrapper" class="d-flex flex-column page-size">
	<%@ include file="../topbar.jsp"%>
    <div class="container">       
	
        <div class="card o-hidden border-0 shadow-lg my-5 ">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                            </div>
                            <form action="/user/add" method="post">
                                <div class="container-fluid">
                                    <div class="form-group row mb-3">
                                        <div class="col-sm-12">
                                            <label for="inputId" class="form-label">아이디</label>
                                            <input type="text" class="form-control" id="inputId" aria-describedby="idHelp" name="id" placeholder="아이디를 입력해주세요...">
                                            <span id="idHelp" class="form-text"></span>
                                        </div>
                                        <div class="col-sm-12">
                                            <label for="inputPw" class="form-label">비밀번호</label>
                                            <input type="password" class="form-control" id="inputPw" aria-describedby="pwHelp" name="password" placeholder="비밀번호를 입력해주세요...">
                                            <span id="pwHelp" class="form-text"></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="container-fluid">
                                    <div class="form-group row mb-3">
                                        <div class="col-sm-6">
                                            <label for="inputName" class="form-label">이름</label>
                                            <input type="text" class="form-control" id="inputName" aria-describedby="nameHelp" name="name" placeholder="성함을 기입해주세요...">
                                            <span id="nameHelp" class="form-text"></span>
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="inputNickname" class="form-label">닉네임</label>
                                            <input type="text" class="form-control" id="inputNickname" name="nickname" placeholder="닉네임을 작성해주세요...">
                                        </div>
                                    </div>
                                </div>
                                <hr>

                                <div class="mb-3 row align-items-center">
                                    <label for="inputAge" class="col-sm-2 col-form-label">나이</label>
                                    <div class="col-sm-2">
                                        <input type="number" class="form-control" id="inputAge" aria-describedby="ageHelp" name="age" min="1" max="120" value="20">
                                        <span id="ageHelp" class="form-text"></span>
                                    </div>

                                    <div class="col-sm-2"></div>

                                    <label class="col-sm-2 col-form-label">성별</label>
                                    <div class="col-sm-4">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="1" checked="checked">
                                            <label class="form-check-label" for="inlineRadio1">남성</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="0">
                                            <label class="form-check-label" for="inlineRadio2">여성</label>
                                        </div>
                                    </div>
                                </div>

                                <%@ include file="../address.jsp"%>

                                <div class="form-group row">
                                    <label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="inputEmail" aria-describedby="emailHelp" name="email" placeholder="abc@example.com">
                                        <span id="emailHelp" class="form-text"></span>
                                    </div>
                                </div>

                                <button type="submit" id="submit" class="btn btn-primary mb-3">회원 가입</button>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</div>
</body>