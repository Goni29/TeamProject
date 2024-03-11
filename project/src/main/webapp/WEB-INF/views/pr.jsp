<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="./header.jsp"%>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<style>
    .page-size {
        width: 100vw;
    }
</style>

<body id="page-top">
    
    <!-- Page Wrapper -->
    <div id="wrapper">
    
        <%@ include file="./sidebar.jsp"%>
        <div id="content-wrapper" class="d-flex flex-column page-size">       
            <%@ include file="./topbar.jsp"%>
            <div class="container-fluid">
                <div class="row">
                    <c:forEach var="product" items="${products}">
                        <div class="col-md-3 border">
                            <p>${product.num}</p>
                            <img src="${product.imgUrl}" class="img-fluid" alt="Image"> <br>
                            <p>${product.marketName}</p>
                            <a href="${product.url}" class="text-decoration-none">${product.productName}</a><br>
                            <p>가격 : ${product.won}원</p>
                            <p>예상 기간 : ${product.delivery}</p>
                            <p>조회수 : ${product.marketViewCount}</p>
                            <br>

                            <div class="btn-group" role="group" aria-label="Button group">
                                <form class="actionForm" action="/board/register">
                                    <input type="hidden" name="num" value="${product.num}" />
                                    <input type="hidden" name="productName" value="${product.productName}" />
                                    <input type="hidden" name="marketName" value="${product.marketName}" />
                                    <input type="hidden" name="url" value="${product.url}" />
                                    <input type="hidden" name="imgUrl" value="${product.imgUrl}" />
                                    <input type="hidden" name="won" value="${product.won}" />
                                    <input type="hidden" name="delivery" value="${product.delivery}" />
                                    <input type="hidden" name="deliveryFee" value="${product.deliveryFee}" />
                                    <input type="hidden" name="keyword" value="${searchWord}" />
                                    <button type="submit" class="btn btn-primary participateButton">공동구매 참여하기</button>
                                </form>
                                
                                <!-- 상세 페이지 버튼은 필요에 따라 주석 해제하여 사용 -->
                                <!-- <form class="actionForm" action="/market/detail">
                                    <input type="hidden" name="num" value="${product.num}" />
                                    <input type="hidden" name="id" value="${loginVo.id}" />
                                    <button type="submit" class="btn btn-success">상세 페이지</button>
                                </form> -->
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>

<div class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">로그인</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>Modal body text goes here.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary">변경 사항 저장</button>
			</div>
		</div>
	</div>
</div>

					    <script>
document.addEventListener("DOMContentLoaded", function() {
    const participateButtons = document.querySelectorAll('.participateButton');
    
    participateButtons.forEach(button => {
        button.addEventListener('click', function(event) {
            const productNum = this.getAttribute('data-num'); // 제품 고유 번호
            const requestData = { num: productNum };
            
            fetch('/groupBuying/participate', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(requestData),
            })
            .then(response => response.json())
            .then(data => {
                if(data.status === 'success') {
                    // 페이지의 목표일자와 목표인원 내용 업데이트
                    document.querySelector('#goalDate'+productNum).textContent = '목표 일자: ' + data.goalDate;
                    document.querySelector('#goalTarget'+productNum).textContent = '남은 목표 인원: ' + data.goalTarget;
                    document.querySelector('#personNum'+productNum).textContent = '현재 참여 인원: ' + data.personNum;
                } else {
                    alert('공동 구매 참여에 실패했습니다.');
                }
            })
            .catch(error => console.error('Error:', error));
        });
    });
});
</script>

</html>
<%@ include file="./footer.jsp"%>