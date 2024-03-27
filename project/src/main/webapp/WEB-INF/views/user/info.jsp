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
<div id="conteny-wrapper" class="d-flex flex-column page-size">
<%@ include file="../topbar.jsp"%>
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="card">
				<div class="card-header">회원 정보 수정</div>
				<div class="card-body">
					<form action="/user/modify" method="post">
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

						<div class="form-group row">
    <label for="inputAddr" class="col-sm-2 col-form-label">주소</label>
    <div class="col-sm-10">
        <input type="text" class="form-control mb-2" id="postcode" placeholder="우편번호" name="postcode" value="${loginVo.postcode}">
        <input type="button" class="btn btn-secondary mb-2" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
        <input type="text" class="form-control mb-2" id="address" placeholder="주소" name="address" value="${loginVo.address}">
		<input type="text" class="form-control mb-2" id="extraAddress" placeholder="참고항목" name="extraAddress" value="${loginVo.extraAddress}">
        <input type="text" class="form-control" id="addressDetail" placeholder="상세주소" name="addressDetail" value="${loginVo.addressDetail}">
    </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addressDetail").focus();
            }
        }).open();
    }
    function combineAddress() {
        var postcode = document.getElementById('sample6_postcode').value;
        var address = document.getElementById('sample6_address').value;
        var extraAddress = document.getElementById('sample6_extraAddress').value;
        var detailAddress = document.getElementById('sample6_detailAddress').value;

        // Combine the address parts with a separator, e.g., ', '
        var combinedAddress = postcode + ', ' + address + ', ' + extraAddress + ', ' + detailAddress;

        // Set the combined address to the hidden input
        document.getElementById('combinedAddress').value = combinedAddress;

        // Optionally, submit the form here if needed
        // document.getElementById('yourFormId').submit();
    }
</script>

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