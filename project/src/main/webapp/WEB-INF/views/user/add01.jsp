<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<span class="titletext" hidden="hidden">회원 가입</span>

<%@ include file="../header.jsp"%>

<body>
<%@ include file="../sidebar.jsp"%>
	<div class="container-fluid p-2 bg-dark text-white text-center">
		<p>회원 가입</p>
	</div>

<div class="container mt-5">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="card">
				<div class="card-header">회원 가입 폼</div>
				<div class="card-body">
					<form action="/user/add" method="post">
						<div class="mb-3 row">
							<label for="inputId" class="col-sm-2 col-form-label">아이디</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="inputId"
									aria-describedby="idHelp" name="id"> <span id="idHelp"
									class="form-text"></span>
							</div>
						</div>

						<div class="mb-3 row">
							<label for="inputPw" class="col-sm-2 col-form-label">비밀번호</label>
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
									aria-describedby="nameHelp" name="name"> <span
									id="nameHelp" class="form-text"></span>
							</div>
						</div>

						<div class="mb-3 row">
							<label for="inputNickname" class="col-sm-2 col-form-label">닉네임</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="inputNickname"
									aria-describedby="nameHelp" name="nickname"> <span
									id="nicknameHelp" class="form-text">다른 사용자에게 보여질 이름입니다.</span>
							</div>
						</div>

						<div class="mb-3 row">
							<label for="inputAge" class="col-sm-2 col-form-label">나이</label>
							<div class="col-sm-2">
								<input type="number" class="form-control" id="inputAge"
									aria-describedby="ageHelp" name="age" min="1" max="120"
									value="20"> <span id="ageHelp" class="form-text"></span>
							</div>
						</div>

						<div class="col">
							<label class="col-sm-2 col-form-label">성별</label>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="inlineRadio1" value="1" checked="checked"> <label
									class="form-check-label" for="inlineRadio1">남성</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="inlineRadio2" value="0"> <label
									class="form-check-label" for="inlineRadio2">여성</label>
							</div>
						</div>

						<div class="mb-3 row">
							<label for="inputAddr" class="col-sm-2 col-form-label">주소</label>
							<div class="col-sm-4">
								<select id="inputAddr" class="form-select" aria-label=".form-select-lg example" name="address">
									<option value="서울특별시">서울특별시</option>
									<option value="부산광역시">부산광역시</option>
									<option value="대구광역시">대구광역시</option>
									<option value="인천광역시">인천광역시</option>
									<option value="광주광역시">광주광역시</option>
									<option value="대전광역시">대전광역시</option>
									<option value="울산광역시">울산광역시</option>
									<option value="세종특별자치시">세종특별자치시</option>
									<option value="경기도">경기도</option>
									<option value="강원도">강원도</option>
									<option value="충청북도">충청북도</option>
									<option value="충청남도">충청남도</option>
									<option value="전라북도">전라북도</option>
									<option value="전라남도">전라남도</option>
									<option value="경상북도">경상북도</option>
									<option value="경상남도">경상남도</option>
									<option value="제주도">제주도</option>
								</select>
								<span id="addrHelp" class="form-text"></span>
							</div>
						</div>
						
						<div class="mb-3 row">
							<label for="inputAddrD" class="col-sm-2 col-form-label">상세 주소</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="inputAddrD"
									aria-describedby="emailHelp" name="addressDetail"> <span
									id="addrDHelp" class="form-text"></span>
							</div>
						</div>

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
</body>