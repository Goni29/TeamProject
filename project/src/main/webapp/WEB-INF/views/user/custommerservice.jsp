<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../header.jsp"%>

<style>
    .page-size {
        width: 100vw;
    }
    /* 중앙 정렬과 상단 패딩 조정을 위한 스타일 추가 */
    .center-title {
        text-align: center;
    }
    .content-container {
        padding-top: 50px; /* 여기서는 예시로 50px을 사용했습니다. 필요에 따라 조정하세요. */
    }
</style>

<body>
    <!-- Page Wrapper -->
    <div id="wrapper">
        <%@ include file="../sidebar.jsp"%>
        <div id="conteny-wrapper" class="d-flex flex-column page-size">       
            <%@ include file="../topbar.jsp"%>
            <div id="content main-content" class="main-width">  
                <div class="container-fluid">
                    <div class="container content-container">
                        <h1 class="mt-5 center-title">고객센터</h1>
                        <div class="faq mt-5">
                            <h2>자주 묻는 질문</h2>
                            <div id="accordion">
							    <div class="card">
							        <div class="card-header" id="headingOne">
							            <h5 class="mb-0">
							                <button class="btn btn-link" data-toggle="collapse" data-target="#custommerservice-collapseOne" aria-expanded="true" aria-controls="collapseOne">
							                    질문 1: 환불 정책은 어떻게 되나요?
							                </button>
							            </h5>
							        </div>
							        <div id="custommerservice-collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
							            <div class="card-body">
							                답변: 구매하신 상품에 대한 환불은 구매 후 30일 이내에 가능합니다. 자세한 내용은 환불 정책을 참조해주세요.
							            </div>
							        </div>
							    </div>
							    <div class="card">
							        <div class="card-header" id="headingTwo">
							            <h5 class="mb-0">
							                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#custommerservice-collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
							                    질문 2: 배송 시간은 얼마나 걸리나요?
							                </button>
							            </h5>
							        </div>
							        <div id="custommerservice-collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
							            <div class="card-body">
							                답변: 일반적으로 주문하신 상품은 공동구매 기간 종료 후 3~5일 내에 배송됩니다. 지역에 따라 배송 시간이 달라질 수 있습니다.
							            </div>
							        </div>
							    </div>
							    <div class="card">
							        <div class="card-header" id="headingThree">
							            <h5 class="mb-0">
							                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#custommerservice-collapseThree" aria-expanded="false" aria-controls="collapseThree">
							                    질문 3: 제품 교환은 어떻게 하나요?
							                </button>
							            </h5>
							        </div>
							        <div id="custommerservice-collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
							            <div class="card-body">
							                답변: 제품 불량이나 오배송의 경우, 수령 후 7일 이내에 교환 요청이 가능합니다. 제품 상태를 확인한 후 교환 절차를 안내드립니다.
							            </div>
							        </div>
							    </div>
							    <div class="card">
							        <div class="card-header" id="headingFour">
							            <h5 class="mb-0">
							                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#custommerservice-collapseFour" aria-expanded="false" aria-controls="collapseFour">
							                    질문 4: 상품의 재고 상황을 어떻게 알 수 있나요?
							                </button>
							            </h5>
							        </div>
							        <div id="custommerservice-collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
							            <div class="card-body">
							                답변: 상품 페이지에서 현재 재고 상황을 확인할 수 있습니다. 재고가 없는 경우, '재입고 알림 신청'을 통해 입고 알림을 받으실 수 있습니다.
							            </div>
							        </div>
							    </div>
							    <div class="card">
							        <div class="card-header" id="headingFive">
							            <h5 class="mb-0">
							                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#custommerservice-collapseFive" aria-expanded="false" aria-controls="collapseFive">
							                    질문 5: 회원 가입은 어떻게 하나요?
							                </button>
							            </h5>
							        </div>
							        <div id="custommerservice-collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordion">
							            <div class="card-body">
							                답변: 홈페이지 상단의 '회원가입' 버튼을 클릭하여 가입 양식에 따라 정보를 입력하시면 회원 가입이 완료됩니다. 가입 시 다양한 혜택을 받으실 수 있습니다.
							            </div>
							        </div>
							    </div>
							    <div class="card">
							        <div class="card-header" id="headingSix">
							            <h5 class="mb-0">
							                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#custommerservice-collapseSix" aria-expanded="false" aria-controls="collapseSix">
							                    질문 6: 결제 방법에는 어떤 것들이 있나요?
							                </button>
							            </h5>
							        </div>
							        <div id="custommerservice-collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordion">
							            <div class="card-body">
							                답변: 신용카드, 실시간 계좌이체, 무통장 입금, 휴대폰 결제 등 다양한 결제 방법을 제공합니다. 결제 페이지에서 원하시는 방법을 선택하실 수 있습니다.
							            </div>
							        </div>
							    </div>
							    <div class="card">
							        <div class="card-header" id="headingSeven">
							            <h5 class="mb-0">
							                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#custommerservice-collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
							                    질문 7: 포인트 사용 방법은 무엇인가요?
							                </button>
							            </h5>
							        </div>
							        <div id="custommerservice-collapseSeven" class="collapse" aria-labelledby="headingSeven" data-parent="#accordion">
							            <div class="card-body">
							                답변: 포인트는 상품 구매 시 결제 페이지에서 현금처럼 사용할 수 있습니다. 사용 가능한 포인트는 마이페이지에서 확인하실 수 있습니다.
							            </div>
							        </div>
							    </div>
							    <div class="card">
							        <div class="card-header" id="headingEight">
							            <h5 class="mb-0">
							                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#custommerservice-collapseEight" aria-expanded="false" aria-controls="collapseEight">
							                    질문 8: 주문 취소는 어떻게 하나요?
							                </button>
							            </h5>
							        </div>
							        <div id="custommerservice-collapseEight" class="collapse" aria-labelledby="headingEight" data-parent="#accordion">
							            <div class="card-body">
							                답변: 주문 취소는 상품 발송 전까지 가능합니다. 마이페이지의 주문 내역에서 취소하고자 하는 주문을 선택하여 취소 요청을 하실 수 있습니다.
							            </div>
							        </div>
							    </div>
							    <div class="card">
							        <div class="card-header" id="headingNine">
							            <h5 class="mb-0">
							                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#custommerservice-collapseNine" aria-expanded="false" aria-controls="collapseNine">
							                    질문 9: 개인정보 변경은 어떻게 하나요?
							                </button>
							            </h5>
							        </div>
							        <div id="custommerservice-collapseNine" class="collapse" aria-labelledby="headingNine" data-parent="#accordion">
							            <div class="card-body">
							                답변: 개인정보 변경은 마이페이지에서 가능합니다. 로그인 후 마이페이지로 이동하여 '개인정보 변경' 메뉴에서 수정하실 수 있습니다.
							            </div>
							        </div>
							    </div>
							    <div class="card">
							        <div class="card-header" id="headingTen">
							            <h5 class="mb-0">
							                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#custommerservice-collapseTen" aria-expanded="false" aria-controls="collapseTen">
							                    질문 10: 고객센터의 운영 시간은 어떻게 되나요?
							                </button>
							            </h5>
							        </div>
							        <div id="custommerservice-collapseTen" class="collapse" aria-labelledby="headingTen" data-parent="#accordion">
							            <div class="card-body">
							                답변: 고객센터의 운영 시간은 평일 오전 9시부터 오후 6시까지입니다. 주말 및 공휴일은 운영하지 않습니다.
							            </div>
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
</html>