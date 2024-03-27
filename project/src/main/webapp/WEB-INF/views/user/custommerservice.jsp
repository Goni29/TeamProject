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
                        <div class="faq mt-3">
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
                                    <div id="custommerservice-collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>