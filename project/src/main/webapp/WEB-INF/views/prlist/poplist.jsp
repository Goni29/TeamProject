<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../header.jsp"%>

<style>
    .page-size {
        width: 100vw;
    }
    .cate_wrap{
    	margin-left: 1rem; margin-right: 1rem; margin-top: auto; margin-bottom: auto;
    }
    
    .category{
    	display: flex;
    }

    .form_section_content select {
        width: 92%;
        height: 35px;
        font-size: 20px;
        text-align-last: center;
        margin-left: 5px;
    }

    .cate_wrap span {
        font-weight: 600;
    }

    .cate_wrap:not(:first-child) {
        margin-top: 20px;
    }
</style>

<body>
    <div id="wrapper">
        <%@ include file="../sidebar.jsp"%>
        <div id="conteny-wrapper" class="d-flex flex-column page-size">
            <%@ include file="../topbar.jsp"%>
            <div id="content main-content" class="main-width">

                <div class="container-fluid">

                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">인기상품</h1>
                    </div>
                    
                    <div class="mb-4 category">
                        <div class="cate_wrap">
                            <span>대분류</span> <select class="large">
                                <option selected value="none">선택</option>
                            </select>
                        </div>
                        <div class="cate_wrap">
                            <span>중분류</span> <select class="medium">
                                <option selected value="none">선택</option>
                            </select>
                        </div>
                        <div class="cate_wrap">
                            <span>소분류</span> <select class="small">
                                <option selected value="none">선택</option>
                            </select>
                        </div>
                        <div class="cate_wrap">
                            <span>세부분류</span> <select class="sub_category" name="cateCode">
                                <option selected value="none">선택</option>
                            </select>
                       	</div>
                     </div>
                    
                    <div class="row">

                        <c:forEach var="product" items="${productDetails}">
                            <div class="col-xl-3 col-md-6 mb-4 border">
                                <p>${product.marketName}</p>

                                <a
                                    href="/pr?large=${product.large}&medium=${product.medium}&small=${product.small}&sub_category=${product.sub_category}&num=${product.num}">
                                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
                                        src="${product.imgUrl}" alt="Product Image"> <br>
                                    <h6 class="m-0 font-weight-bold text-primary">
                                        <c:choose>
                                            <c:when test="${fn:length(product.productName) > 20}">
                                                ${fn:substring(product.productName, 0, 20)}...
                                            </c:when>
                                            <c:otherwise>
                                                ${product.productName}
                                            </c:otherwise>
                                        </c:choose>
                                    </h6>
                                </a><br>

                                <div>
                                    <p>가격 : ${product.won}원</p>
                                    <p>현재 참여 인원 : ${product.personnum}</p>
                                </div>
                                <div class="row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <div
                                            class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${product.personnum}%</div>
                                    </div>
                                    <div class="col">
                                        <div class="progress progress-sm mr-2">
                                            <div class="progress-bar bg-info" role="progressbar"
                                                style="width: ${product.personnum}%" aria-valuenow="${product.personnum}"
                                                aria-valuemin="0" aria-valuemax="${product.goaltarget}"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-group" role="group" aria-label="Button group">
                                    <form class="actionForm" action="/board/register">
                                        <input name="num" value="${product.num}" hidden="hidden" /> <input
                                            name="productName" value="${product.productName}" hidden="hidden" /> <input
                                            name="marketName" value="${product.marketName}" hidden="hidden" /> <input
                                            name="url" value="${product.url}" hidden="hidden" /> <input
                                            name="imgUrl" value="${product.imgUrl}" hidden="hidden" /> <input
                                            name="won" value="${product.won}" hidden="hidden" /> <input
                                            name="delivery" value="${product.delivery}" hidden="hidden" /> <input
                                            name="deliveryFee" value="${product.deliveryFee}" hidden="hidden" /> <input
                                            name="keyword" value="${searchWord}" hidden="hidden" />
                                        <button class="btn btn-primary" hidden="hidden">공동구매
                                            참여하기</button>
                                    </form>

                                    <a
                                        href="/pr?large=${product.large}&medium=${product.medium}&small=${product.small}&sub_category=${product.sub_category}&num=${product.num}">
                                        <button class="btn btn-success" hidden="hidden">상세 페이지</button>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
						</div>
                    </div>
                </div>
            </div>
        </div>
	
<script>
    $(document).ready(function(){
        console.log('${cateList}');
    });

    let cateList = JSON.parse('${cateList}');

    let largeArray = new Array();
    let mediumArray = new Array();
    let smallArray = new Array();
    let sub_category = new Array();
    let largeObj = new Object();
    let mediumObj = new Object();
    let smallObj = new Object();
    let sub_categoryObj = new Object();

    let cateSelect1 = $(".large");
    let cateSelect2 = $(".medium");
    let cateSelect3 = $(".small");
    let cateSelect4 = $(".sub_category");

    function makeCateArray(obj, array, cateList, large){
        for(let i = 0; i < cateList.length; i++){
            if(cateList[i].large === large){
                obj = new Object();

                obj.cateName = cateList[i].cateName;
                obj.cateCode = cateList[i].cateCode;
                obj.cateParent = cateList[i].cateParent;

                array.push(obj);
            }
        }
    }

    makeCateArray(largeObj, largeArray, cateList, 1);
    makeCateArray(mediumObj, mediumArray, cateList, 2);
    makeCateArray(smallObj, smallArray, cateList, 3);

    $(document).ready(function(){
        console.log(largeArray);
        console.log(mediumArray);
        console.log(smallArray);
    });
</script>
</body>
</html>