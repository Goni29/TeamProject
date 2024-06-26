<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ include file="./header.jsp"%>

<style>
    .page-size {
        width: 100vw;
    }
    
    .img-container {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
	}

.img-size {
    max-width: 300px; /* 이미지 최대 너비를 150px로 조정 */
    height: auto; /* 이미지 높이를 자동으로 조정 */
}
</style>

<body id="page-top">
    
    <!-- Page Wrapper -->
    <div id="wrapper">
    
        <%@ include file="./sidebar.jsp"%>
        <div id="conteny-wrapper" class="d-flex flex-column page-size">       
            <%@ include file="./topbar.jsp"%>
            <div id="content main-content" class="main-width">  

                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">인기상품</h1>
                    </div>

                    <div class="row">
                        <c:forEach var="product" items="${products}" begin="0" end="3">
                            <div class="col-xl-3 col-md-6 mb-4 border">
                                <p>${product.marketName}</p>
                                
                                <a href="/pr?large=${product.large}&medium=${product.medium}&small=${product.small}&sub_category=${product.sub_category}&num=${product.num}">
                                    <img class="img-size img-fluid px-3 px-sm-4 mt-3 mb-4" src="${product.imgUrl}" alt="Product Image" > <br>
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
                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${product.achievementrate}%</div>
                                    </div>
                                    <div class="col">
                                        <div class="progress progress-sm mr-2">
                                            <div class="progress-bar bg-info" role="progressbar" style="width: ${product.achievementrate}%" aria-valuenow="${product.achievementrate}" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-group" role="group" aria-label="Button group">
                                   <form class="actionForm" action="/market/register">
	                                    <input name="num" value="${product.num}" hidden="hidden" /> 
	                                    <input name="productName" value="${product.productName}" hidden="hidden" /> 
	                                    <input name="marketName" value="${product.marketName}" hidden="hidden" /> 
	                                    <input name="url" value="${product.url}" hidden="hidden" /> 
	                                    <input name="imgUrl" value="${product.imgUrl}" hidden="hidden" /> 
	                                    <input name="won" value="${product.won}" hidden="hidden" /> 
	                                    <input name="delivery" value="${product.delivery}" hidden="hidden" />
	                                    <input name="deliveryFee" value="${product.deliveryFee}" hidden="hidden" /> 
	                                    <input name="keyword" value="${searchWord}" hidden="hidden" />
	                                    <button hidden="hidden" class="participateButton btn-primary btn-needlogin" data-num="${product.num}">공동구매 참여하기</button><br /><br />
	                               	 </form>
                                   
                                   <form class="actionForm" action="/user/save">
                                       <input name="num" value="${product.num}" hidden="hidden" />
                                       <input name="productName" value="${product.productName}" hidden="hidden" />
                                       <input name="marketName" value="${product.marketName}" hidden="hidden" />
                                       <input name="url" value="${product.url}" hidden="hidden" />
                                       <input name="imgUrl" value="${product.imgUrl}" hidden="hidden" />
                                       <input name="won" value="${product.won}" hidden="hidden" />
                                      
                                       <input name="delivery" value="${product.delivery}" hidden="hidden" />
                                       <input name="deliveryFee" value="${product.deliveryFee}" hidden="hidden" />
                                   
                                       <input name="keyword" value="${searchWord}" hidden="hidden" />
                                       <button hidden="hidden" class="btn btn-primary btn-needlogin">찜하기</button>
                                  	</form>
                                   
                                   <a href="/pr?large=${product.large}&medium=${product.medium}&small=${product.small}&sub_category=${product.sub_category}&num=${product.num}">
                                       <button class="btn btn-success">상세 페이지</button>
                                   </a>
                               </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Additional Content Row -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">추천상품!</h1>
                    </div>
                    <div class="row">
                        <c:forEach var="rankView" items="${rankView}" begin="0" end="7">
                            <div class="col-xl-3 col-md-6 mb-4 border">
                                <p>${rankView.marketName}</p>

                                <a href="/pr?large=${rankView.CATEGORY_LARGE}&medium=${rankView.CATEGORY_MEDIUM}&small=${rankView.CATEGORY_SMALL}&sub_category=${rankView.CATEGORY_SUB_CATEGORY}&num=${rankView.MARKET_NUM}">
                                    <img class="img-size img-fluid px-3 px-sm-4 mt-3 mb-4" src="${rankView.imgUrl}" alt="Product Image"> <br>
                                    <h6 class="m-0 font-weight-bold text-primary">
                                    <c:choose>
                                        <c:when test="${fn:length(rankView.productName) > 20}">
                                            ${fn:substring(rankView.productName, 0, 20)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${rankView.productName}
                                        </c:otherwise>
                                    </c:choose>
                                    </h6>
                                </a><br>
                                       
                                <div>
                                    <p>가격 : ${rankView.won}원</p>
                                    <p>현재 참여 인원 : ${rankView.personnum}</p>
                                </div>
                                <div class="row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${rankView.achievementrate}%</div>
                                    </div>
                                    <div class="col">
                                        <div class="progress progress-sm mr-2">
                                            <div class="progress-bar bg-info" role="progressbar" style="width: ${rankView.achievementrate}%" aria-valuenow="${rankView.achievementrate}" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-group" role="group" aria-label="Button group">
                                    <form class="actionForm" action="/board/register">
                                        <input name="num" value="${rankView.num}" hidden="hidden" />
                                        <input name="productName" value="${rankView.productName}" hidden="hidden" />
                                        <input name="marketName" value="${rankView.marketName}" hidden="hidden" />
                                        <input name="url" value="${rankView.url}" hidden="hidden" />
                                        <input name="imgUrl" value="${rankView.imgUrl}" hidden="hidden" />
                                        <input name="won" value="${rankView.won}" hidden="hidden" />
                                   
                                        <input name="delivery" value="${rankView.delivery}" hidden="hidden" />
                                        <input name="deliveryFee" value="${rankView.deliveryFee}" hidden="hidden" />
                                       
                                        <input name="keyword" value="${searchWord}" hidden="hidden" />
                                        <button class="btn btn-primary btn-needlogin" hidden="hidden">공동구매 참여하기</button>
                                    </form>
                                    
                                	<form class="actionForm" action="/user/save">
                                        <input name="num" value="${rankView.num}" hidden="hidden" />
                                        <input name="productName" value="${rankView.productName}" hidden="hidden" />
                                        <input name="marketName" value="${rankView.marketName}" hidden="hidden" />
                                        <input name="url" value="${rankView.url}" hidden="hidden" />
                                        <input name="imgUrl" value="${rankView.imgUrl}" hidden="hidden" />
                                        <input name="won" value="${rankView.won}" hidden="hidden" />
                                   
                                        <input name="delivery" value="${rankView.delivery}" hidden="hidden" />
                                        <input name="deliveryFee" value="${rankView.deliveryFee}" hidden="hidden" />
                                       
                                        <input name="keyword" value="${searchWord}" hidden="hidden" />
                                        <button class="btn btn-primary btn-needlogin" hidden="hidden">찜하기</button>
                                    </form>
                                    
                                    <a href="/pr?large=${rankView.large}&medium=${rankView.medium}&small=${rankView.small}&sub_category=${rankView.sub_category}&num=${rankView.num}">
                                        <button class="btn btn-success" >상세 페이지</button>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                        <a href="/prlist/rankedUser" class="btn btn-success float-rightㄴ">추천상품 더보기</a>
                    </div>
                    
                    <div class="container mt-5 md-5">
                        <div class="row justify-content-center">
		                    <div class="col">
							    <h3 class="text-center">최근본 상품 목록</h3>
							    <hr>
							
							    <div class="container">
							        <div class="img-container" style="display: flex; overflow-x: auto;">
							            <c:forEach var="product2" items="${recentlyViewedProducts}" begin="0" end="4">
							                <div class="mb-3 " style="flex: 0 0 auto;">
							                    <a href="/pr?large=${product2.large}&medium=${product2.medium}&small=${product2.small}&sub_category=${product2.sub_category}&num=${product2.num}">
							                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="${product2.imgUrl}" alt="Product Image" style="width: 180px; height: 150px;">
							                    </a>
							                </div>
							            </c:forEach>
							        </div>
							    </div>
							</div>
						</div>
					</div>
            </div>
        </div>
		<div id="footerarea">
		    <footer class="">
			    <div class="footer-container text-center" style="color: rgba(0, 0, 0, 0.2);">
			        <p>(주)고니고니 사업자 등록번호 : 507-19-98999</p>
			        <p>주소 : 경기도 화성시 병점동 황제로 84 | 대표자 : 김태곤</p>
			        <p>호스팅 제공자 : (주)아이티는현태 | 문의전화 : 128-38</p>
			        <p>COPYRIGHTⓒ(주)고니고니 ALL RIGHT RESERVED</p>
			    </div>
			</footer>
		</div>
    </div>
    </div>
<%@include file="./footer.jsp"%>
</body>

<script>

document.querySelectorAll('.btn-needlogin').forEach(button => {
    button.addEventListener('click', function(e) {
    	 var isLoggedIn = ${loginVo.id != null};

         if (!isLoggedIn) {
            e.preventDefault();
            alert('로그인 후 이용해주세요');
        }
    });
});

</script>

</html>