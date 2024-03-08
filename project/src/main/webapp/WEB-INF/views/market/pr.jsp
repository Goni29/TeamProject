<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../topbar.jsp"%>
<span class="titletext" hidden="hidden">해외 상품 가격 비교</span>
<body>
	<div class="container-fluid p-2 bg-dark text-white text-center">
		<p>
			<b>국내외 상품 목록</b>
		</p>
	</div>
	<div class="container">
		<div class="row">
			<c:forEach var="product" items="${products}">
				<div class="col-md-3 border">
					<p>${product.num}</p>
					<img src="${product.imgUrl}" alt="Image"> <br>
					<p>${product.marketName}</p>
					<a href="${product.url}">${product.productName}</a><br>
					<p>가격 : ${product.won}원</p>
					<p>예상 기간 : ${product.delivery}</p>
					<p>조회수 : ${product.marketViewCount}</p>
					<br>

					<div class="btn-group" role="group" aria-label="Button group">
					    <form class="actionForm" action="/board/register">
					        <input name="num" value="${product.num}" hidden="hidden" />
					        <input name="productName" value="${product.productName}" hidden="hidden" />
					        <input name="marketName" value="${product.marketName}" hidden="hidden" />
					        <input name="url" value="${product.url}" hidden="hidden" />
					        <input name="imgUrl" value="${product.imgUrl}" hidden="hidden" />
					        <input name="won" value="${product.won}" hidden="hidden" />
					        <input name="delivery" value="${product.delivery}" hidden="hidden" />
					        <input name="deliveryFee" value="${product.deliveryFee}" hidden="hidden" />
					        <input name="keyword" value="${searchWord}" hidden="hidden" />
					        <button class="btn btn-primary">공동구매 참여하기</button>
					    </form>
					    
					    <form class="actionForm" action="/market/detail" hidden="hidden">
					        <input name="num" value="${product.num}" hidden="hidden" />
					        <input name="id" value="${loginVo.id}" hidden="hidden" />
					        <button class="btn btn-success">상세 페이지</button>
					    </form>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>


<!-- 모달창. 숨겨져 있음 -->
<div class="modal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">로그인</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<p>Modal body text goes here.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>

</html>

<%@ include file="../footer.jsp"%>