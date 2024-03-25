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
    .products-container {
        display: flex;
        flex-wrap: wrap;
        gap: 20px; /* 제품 간 간격을 조정합니다. */
    }
    .product {
        border: 1px solid #ddd; /* 제품을 구분하기 위한 테두리 스타일 */
        padding: 10px; /* 패딩 추가 */
        width: calc(25% - 20px); /* 네 개의 제품을 한 줄에 표시하기 위한 계산 */
        box-sizing: border-box; /* 패딩과 테두리를 너비에 포함 */
    }
</style>

<body>
    <div id="wrapper">
        <%@ include file="../sidebar.jsp"%>
        <div id="conteny-wrapper" class="d-flex flex-column page-size">       
            <%@ include file="../topbar.jsp"%>
            
            <div class="cate_wrap">
				<span>대분류</span>
				<select class="cate1">
					<option selected value="none">선택</option>
				</select>
			</div>
			<div class="cate_wrap">
				<span>중분류</span>
				<select class="cate2">
					<option selected value="none">선택</option>
				</select>
			</div>
			<div class="cate_wrap">
				<span>소분류</span>
				<select class="cate3">
					<option selected value="none">선택</option>
				</select>
			</div> 
			<div class="cate_wrap">
				<span>세부분류</span>
				<select class="cate4" name="cateCode">
					<option selected value="none">선택</option>
				</select>
			</div>            
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">추천상품</h1>
            </div>
            
            <div class="row">
                        <c:forEach var="product" items="${products}">
                            <div class="col-xl-3 col-md-6 mb-4 border">
                                <p>${product.marketName}</p>
                                
                                <a href="/pr?large=${product.large}&medium=${product.medium}&small=${product.small}&sub_category=${product.sub_category}&num=${product.num}">
                                    <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="${product.imgUrl}" alt="Product Image" > <br>
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
                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${product.personnum}%</div>
                                    </div>
                                    <div class="col">
                                        <div class="progress progress-sm mr-2">
                                            <div class="progress-bar bg-info" role="progressbar" style="width: ${product.personnum}%" aria-valuenow="${product.personnum}" aria-valuemin="0" aria-valuemax="${product.goaltarget}"></div>
                                        </div>
                                    </div>
                                </div>
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
                                        <button class="btn btn-primary" hidden="hidden">공동구매 참여하기</button>
                                    </form>
                                    
                                    <a href="/pr?large=${product.large}&medium=${product.medium}&small=${product.small}&sub_category=${product.sub_category}&num=${product.num}">
                                        <button class="btn btn-success" hidden="hidden">상세 페이지</button>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="products-container">
                <!-- 동적으로 로드된 제품들이 여기에 표시됩니다. -->
            </div>
            
            <%--
            필요시 추가하여 쓰세연
             <div class="row">
                <c:forEach var="product" items="${products}" begin="0" end="7">
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Product</h6>
                        </div>
                        <div class="">
                            <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" src="${product.imgUrl}" alt="Product Image"> <br>
                        </div>
                        <a href="/pr?large=${product.large}&medium=${product.medium}&small=${product.small}&sub_category=${product.sub_category}&num=${product.num}">
                            <c:choose>
                                <c:when test="${fn:length(product.productName) > 20}">
                                    ${fn:substring(product.productName, 0, 20)}...
                                </c:when>
                                <c:otherwise>
                                    ${product.productName}
                                </c:otherwise>
                            </c:choose>
                        </a><br>
                        <div class="row no-gutters align-items-center">
                            <div class="col-auto">
                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                            </div>
                            <div class="col">
                                <div class="progress progress-sm mr-2">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div> --%>
        </div>
        <script>
$(document).ready(function(){
   console.log('${cateList}');
});
let cateList = JSON.parse('${cateList}');

let cate1Array = new Array();
let cate2Array = new Array();
let cate3Array = new Array();
let cate4Array = new Array();
let cate1Obj = new Object();
let cate2Obj = new Object();
let cate3Obj = new Object();
let cate4Obj = new Object();

let cateSelect1 = $(".cate1");      
let cateSelect2 = $(".cate2");
let cateSelect3 = $(".cate3");
let cateSelect4 = $(".cate4");

for(let i = 0; i < cateList.length; i++){
   if(cateList[i].tier === 1){
      cate1Obj = new Object();
      
      cate1Obj.cateName = cateList[i].cateName;
      cate1Obj.cateCode = cateList[i].cateCode;
      cate1Obj.cateParent = cateList[i].cateParent;
      
      cate1Array.push(cate1Obj);            
      
   }
}   

$(document).ready(function(){
   console.log(cate1Array);
});

function makeCateArray(obj,array,cateList, tier){
   for(let i = 0; i < cateList.length; i++){
      if(cateList[i].tier === tier){
         obj = new Object();
         
         obj.cateName = cateList[i].cateName;
         obj.cateCode = cateList[i].cateCode;
         obj.cateParent = cateList[i].cateParent;
         
         array.push(obj);            
         
      }
   }
}

makeCateArray(cate1Obj,cate1Array,cateList,1);
makeCateArray(cate2Obj,cate2Array,cateList,2);
makeCateArray(cate3Obj,cate3Array,cateList,3);
makeCateArray(cate4Obj,cate4Array,cateList,4);

$(document).ready(function(){
   console.log(cate1Array);
   console.log(cate2Array);
   console.log(cate3Array);
   console.log(cate4Array);
});

for(let i = 0; i < cate1Array.length; i++){
   cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
}

$(cateSelect1).on("change",function(){
   
});

$(cateSelect1).on("change",function(){
   
   let selectVal1 = $(this).find("option:selected").val();   
   
});

$(cateSelect1).on("change",function(){
   
   let selectVal1 = $(this).find("option:selected").val();   
   
   cateSelect2.children().remove();
   
   cateSelect2.append("<option value='none'>선택</option>")
   
});

$(cateSelect1).on("change",function(){
   
   let selectVal1 = $(this).find("option:selected").val();   
   
   cateSelect2.children().remove();
   
   cateSelect2.append("<option value='none'>선택</option>");
   
   for(let i = 0; i < cate2Array.length; i++){
      if(selectVal1 === cate2Array[i].cateParent){
         cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");   
      }
   }// for
   
});

$(cateSelect2).on("change",function(){
   
   
});

$(cateSelect2).on("change",function(){
   
   let selectVal2 = $(this).find("option:selected").val();
   
});

$(cateSelect2).on("change",function(){
   
   let selectVal2 = $(this).find("option:selected").val();
   
   cateSelect3.children().remove();
   
   cateSelect3.append("<option value='none'>선택</option>");      
   
});

$(cateSelect2).on("change",function(){
   
   let selectVal2 = $(this).find("option:selected").val();
   
   cateSelect3.children().remove();
   
   cateSelect3.append("<option value='none'>선택</option>");      
   
   for(let i = 0; i < cate3Array.length; i++){
      if(selectVal2 === cate3Array[i].cateParent){
         cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");   
      }
   }// for      
   
});

$(cateSelect3).on("change",function(){
   
   
});

$(cateSelect3).on("change",function(){
   
   let selectVal3 = $(this).find("option:selected").val();
   
});

$(cateSelect3).on("change",function(){
   
   let selectVal3 = $(this).find("option:selected").val();
   
   cateSelect4.children().remove();
   
   cateSelect4.append("<option value='none'>선택</option>");      
   
});

$(cateSelect3).on("change",function(){
   
   let selectVal3 = $(this).find("option:selected").val();
   
   cateSelect4.children().remove();
   
   cateSelect4.append("<option value='none'>선택</option>");      
   
   for(let i = 0; i < cate3Array.length; i++){
      if(selectVal3 === cate4Array[i].cateParent){
         cateSelect4.append("<option value='"+cate4Array[i].cateCode+"'>" + cate4Array[i].cateName + "</option>");   
      }
   }// for      
   
});

cateSelect4.children().remove();
cateSelect4.append("<option value='none'>선택</option>");

$(document).ready(function() {
    $('.cate1, .cate2, .cate3, .cate4').on('change', function() {
        let cateCode = $(this).val(); // 선택된 카테고리 코드
        if(cateCode !== 'none') {
            $.ajax({
                url: 'productsByCategory',
                type: 'GET',
                data: {cateCode: cateCode},
                success: function(data) {
                	console.log(data);
                    // 제품 목록을 페이지에 동적으로 표시하는 로직
                    displayProducts(data);
                },
                error: function(error) {
                    console.log('Error:', error);
                }
            });
        }
    });
});

function displayProducts(xml) {
    var productsHtml = '';
    $(xml).find('item').each(function() {
        var product = $(this);
        var productName = product.find('productName').text(); // XML 내에서 'marketName' 태그의 텍스트를 찾습니다.
        
        // 해당 데이터를 HTML로 변환합니다.
        productsHtml += '<div class="product">' + productName + '</div>'; // 'marketName'을 사용하여 HTML을 생성합니다.
    });

    $('.products-container').html(productsHtml); // 생성된 HTML을 '.products-container' 요소에 삽입합니다.
}

$.ajax({
    url: 'productsByCategory',
    type: 'GET',
    dataType: 'xml', // 반환 데이터 타입을 'xml'로 지정합니다.
    data: {cateCode: cateCode},
    success: function(xmlData) {
        displayProducts(xmlData);
    },
    error: function(error) {
        console.log('Error:', error);
    }
});

</script>
    </div>
</body>
</html>