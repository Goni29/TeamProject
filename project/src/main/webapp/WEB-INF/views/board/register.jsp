<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../header.jsp"%>
<%@ include file="../topbar.jsp"%>
<span class="titletext" hidden="hidden">게시글 작성</span>
<body>
	<div class="container-fluid p-2 bg-dark text-white text-center">
		<p>게시글 작성</p>
	</div>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div id="contentarea" class="card">
					<div class="card-header">게시글 작성</div>
					<div class="card-body">
						<form action="/board/register" method="post">
							<div class="mb-3">
								<label for="title" class="form-label">제목</label> <input
									type="text" class="form-control" id="title" name="title">
							</div>
							<div class="mb-3">
								<label for="writer" class="form-label">작성자(닉네임)</label> <input
									type="text" class="form-control" id="writer" name="writer"
									value="${loginVo.nickname}" readonly="readonly">
							</div>
							<c:if test="${vo.num != null}">
								<div class="mb-3">
									<label for="summary" class="form-label">상품 키워드</label> <input
										type="text" class="form-control" id="summary" name="summary"
										value="${vo.keyword}">
								</div>
								
							<input id="category" name="category" value="1" hidden="hidden" />
							</c:if>
							<c:if test="${vo.num == null}">
								<input id="summary" name="summary" hidden="hidden" />
								
							</c:if>
							<div class="mb-3">
								<label for="content" class="form-label">내용</label>
								<textarea class="form-control" id="content" rows="5"
									name="content"></textarea>
							</div>
							<input id="num" name="num" value="${vo.num}" hidden="hidden" />
							<input id="id" name="id" value="${loginVo.id}" hidden="hidden" />

							<button type="submit" class="btn btn-primary">전송 버튼</button>
							<button type="reset" class="btn btn-secondary">리셋 버튼</button>
						</form>
					</div>
				</div>
			</div>
			<c:if test="${vo.num != null}">
				<!-- vo.num이 0인 경우는 상품 검색을 통해 접근하지 않았을 때 -->
				<div class="col-md-6">
					<div id="contentarea" class="card">
						<div class="card-header">상품 정보</div>
						<div class="card-body">
							<form action="/board/register" method="post">
								<img src="${vo.imgUrl}" alt="Image"
									class="img-fluid rounded border">
								<div class="mb-3 row">
									<label for="marketName" class="col-sm-2 col-form-label">쇼핑몰</label>
									<div class="col-sm-10">
										<input type="text" readonly class="form-control-plaintext"
											id="marketName" value="${vo.marketName}">
									</div>
								</div>
								<div class="mb-3 row">
									<label for="productName" class="col-sm-2 col-form-label">상품명</label>
									<div class="col-sm-10">
										<input type="text" readonly class="form-control-plaintext"
											id="productName" value="${vo.productName}"
											style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
									</div>
								</div>
								<div class="mb-3 row">
									<label for="won" class="col-sm-2 col-form-label">가격</label>
									<div class="col-sm-10">
										<input type="text" readonly class="form-control-plaintext"
											id="won" value="${vo.won}원">
									</div>
								</div>
								<div class="mb-3 row">
									<label for="deliveryFee" class="col-sm-2 col-form-label">배송비</label>
									<div class="col-sm-10">
										<input type="text" readonly class="form-control-plaintext"
											id="deliveryFee" value="${vo.deliveryFee}">
									</div>
								</div>
								<div class="mb-3 row">
									<label for="delivery" class="col-sm-2 col-form-label">배송
										일정</label>
									<div class="col-sm-10">
										<input type="text" readonly class="form-control-plaintext"
											id="delivery" value="${vo.delivery}">
									</div>
								</div>

							</form>
						</div>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</body>

<%@ include file="../footer.jsp"%>