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

<span class="titletext" hidden="hidden">회원 가입</span>

<body>
<div id="wrapper">
<%@ include file="../sidebar.jsp"%>
<div class="container mt-5 page-size">
<%@ include file="../topbar.jsp"%>
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="card">
				<div class="card-header">회원 정보 수정</div>
				<div class="card-body">
					<form action="/user/add" method="post">
						<div class="mb-3 row">
							<label for="inputId" class="col-sm-2 col-form-label">아이디</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="inputId"
									aria-describedby="idHelp" name="id" value="${loginVo.id}" readonly="readonly"> <span id="idHelp"
									class="form-text"></span>
							</div>
						</div>

						<div class="mb-3 row">
							<label for="inputPw" class="col-sm-2 col-form-label">비밀번호 수정</label>
							<div class="col-sm-4">
								<input type="password" class="form-control" id="inputPw"
									aria-describedby="pwHelp" name="password"> <span
									id="pwHelp" class="form-text"></span>
							</div>
						</div>

						<div class="mb-3 row">
							<label for="inputName" class="col-sm-2 col-form-label">이름</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="inputName"
									aria-describedby="nameHelp" name="name" value="${loginVo.name}" readonly="readonly"> <span
									id="nameHelp" class="form-text"></span>
							</div>
						</div>

						<div class="mb-3 row">
							<label for="inputNickname" class="col-sm-2 col-form-label">닉네임</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="inputNickname"
									aria-describedby="nameHelp" name="nickname" value="${loginVo.nickname}"> <span
									id="nicknameHelp" class="form-text">다른 사용자에게 보여질 이름입니다.</span>
							</div>
						</div>

						<div class="mb-3 row">
							<label for="inputAge" class="col-sm-2 col-form-label">나이</label>
							<div class="col-sm-2">
								<input type="number" class="form-control" id="inputAge"
									aria-describedby="ageHelp" name="age" min="1" max="120"
									value="${loginVo.age}"> <span id="ageHelp" class="form-text"></span>
							</div>
						</div>

						<div class="mb-3 row">
							<label for="inputNickname" class="col-sm-2 col-form-label">성별</label>
							<div class="col-sm-4">
								<c:if test="${loginVo.gender == 1}">
								<span>남성</span>
								</c:if>
							</div>
						</div>

						<%@ include file="../address.jsp"%>

						<div class="mb-3 row">
							<label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
							<div class="col-sm-4">
								<input type="email" class="form-control" id="inputEmail"
									aria-describedby="emailHelp" name="email"> <span
									id="inputEmail" class="form-text"></span>
							</div>
						</div>

						<button type="submit" id="submit" class="btn btn-primary mb-3">회원
							가입</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</body>


<%@ include file="../footer.jsp"%>