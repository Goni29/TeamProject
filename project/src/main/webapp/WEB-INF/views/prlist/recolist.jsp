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

.img-size {
    max-width: 200px; /* 이미지 최대 너비를 150px로 조정 */
    height: auto; /* 이미지 높이를 자동으로 조정 */
}
</style>

<body>
    <div id="wrapper">
        <%@ include file="../sidebar.jsp"%>
        <div id="conteny-wrapper" class="d-flex flex-column page-size">       
            <%@ include file="../topbar.jsp"%>
            <div class="container">
            	<div class="d-flex align-items-center justify-content-center mb-4">
				    <h1 class="h3 mb-0 text-gray-800">검색 상품</h1>
				</div>
	            <div class="row border">
				    <div class="col">
				        <div class="cate_wrap form-group">
				            <span>대분류</span>
				            <select class="cate1 form-control">
				                <option selected value="none">선택</option>
				            </select>
				        </div>
				    </div> 
				    <div class="col">
				        <div class="cate_wrap form-group">
				            <span>중분류</span>
				            <select class="cate2 form-control">
				                <option selected value="none">선택</option>
				            </select>
				        </div>
				    </div>
				    <div class="col">
				        <div class="cate_wrap form-group">
				            <span>소분류</span>
				            <select class="cate3 form-control">
				                <option selected value="none">선택</option>
				            </select>
				        </div>
				    </div>
				    <div class="col">
				        <div class="cate_wrap form-group">
				            <span>세부분류</span>
				            <select class="cate4 form-control" name="cateCode">
				                <option selected value="none">선택</option>
				            </select>
				        </div>
				    </div> 
				</div>
	            <div class="products-container">
	            
	            </div>
	         </div>
		</div>
	</div>
<%@include file="../footer.jsp"%>
	
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
    let cateList = JSON.parse('${cateList}');

    function populateSelect($select, array, parentCode) {
        $select.empty().append("<option value='none'>선택</option>");
        array.forEach(function(item) {
            if (!parentCode || item.cateParent === parentCode) {
                $select.append("<option value='" + item.cateCode + "'>" + item.cateName + "</option>");
            }
        });
    }

    function getCategoryArray(tier) {
        return cateList.filter(function(item) {
            return item.tier === tier;
        });
    }

    function displayProducts(data) {
        var productsHtml = '';
        $(data).find('item').each(function() {
            var product = {
                productName: $(this).find('productName').text(),
                marketName: $(this).find('marketName').text(),
                large: $(this).find('category_LARGE').text(),
                medium: $(this).find('category_MEDIUM').text(),
                small: $(this).find('category_SMALL').text(),
                sub_category: $(this).find('category_SUB_CATEGORY').text(),
                num: $(this).find('market_NUM').text(),
                imgUrl: $(this).find('imgUrl').text(),
                won: $(this).find('won').text(),
                personnum: $(this).find('personnum').text(),
                goaltarget: $(this).find('goaltarget').text(),
                achievementrate: $(this).find('achievementrate').text()
            };

            var productNameDisplay = product.productName.length > 20 ? product.productName.substring(0, 20) + '...' : product.productName;
            
            productsHtml += '<div class="product">' +
                '<p>' + product.marketName + '</p>' +
                '<a href="/pr?large=' + product.large + '&medium=' + product.medium + '&small=' + product.small + '&sub_category=' + product.sub_category + '&num=' + product.num + '">' +
                '<img class="img-size img-fluid px-3 px-sm-4 mt-3 mb-4" src="' + product.imgUrl + '" alt="Product Image"><br>' +
                '<h6 class="m-0 font-weight-bold text-primary">' + productNameDisplay + '</h6>' +
                '</a><br>' +
                '<div>' +
                '<p>가격 : ' + product.won + '원</p>' +
                '<p>목표 인원 : ' + product.goaltarget + '</p>' +
                '<p>현재 참여 인원 : ' + product.personnum + '</p>' +
                '</div>' +
                '<div class="row no-gutters align-items-center">'+
                '<div class="col-auto">'+
                '<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">'+product.achievementrate+'%</div>'+
                '</div>'+'<div class="col">'+'<div class="progress progress-sm mr-2">'+
                '<div class="progress-bar bg-info" role="progressbar" style="width: '+ product.achievementrate + '%" aria-valuenow="'+product.achievementrate+'" aria-valuemin="0" aria-valuemax="100"></div>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '<div class="btn-group" role="group" aria-label="Button group">'+
                '<a href="/pr?large=' + product.large + '&medium=' + product.medium + '&small=' + product.small + '&sub_category=' + product.sub_category + '&num=' + product.num + '">' +
                '<button class="btn btn-success">상세 페이지</button>'+
                '</a>'+
                '</div>'+
                '</div>';
        });
        $('.products-container').html(productsHtml);
    }

    // Initialize category selects
    populateSelect($(".cate1"), getCategoryArray(1));

    // Set up change event handlers
    $(".cate1").change(function() {
        let selectedValue = $(this).val();
        populateSelect($(".cate2"), getCategoryArray(2), selectedValue);
    });

    $(".cate2").change(function() {
        let selectedValue = $(this).val();
        populateSelect($(".cate3"), getCategoryArray(3), selectedValue);
    });

    $(".cate3").change(function() {
        let selectedValue = $(this).val();
        populateSelect($(".cate4"), getCategoryArray(4), selectedValue);
    });

    $(".cate4").change(function() {
        let selectedValue = $(this).val();
        if(selectedValue !== 'none') {
            $.ajax({
                url: 'productsByCategory',
                type: 'GET',
                data: { cateCode: selectedValue },
                dataType: 'xml',
                success: function(data) {
                	console.log(data);
                    displayProducts(data);
                },
                error: function(error) {
                    console.error('Error:', error);
                }
            });
        }
    });
});


</script>
</body>
</html>