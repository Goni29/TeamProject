<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.icon {
  width: 30px;
  height: 30px;
}
    
    .img-container {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
	}

.img-size {
    max-width: 100px;
    height: auto;
	}
</style>

<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion toggled sidebar-width" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                <div class="sidebar-brand-icon rotate-n-15">
                    OMG!
                </div>
                <div class="sidebar-brand-text mx-3">Oh My Goni</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fa-solid fa-money-bill icon"></i>
                    <span>공동구매</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">공동구매!</h6>
                        <a class="collapse-item" href="/prlist/allProduct">전체상품</a>
                        <a class="collapse-item" href="/prlist/poplist">인기상품</a>
                        <a class="collapse-item" href="/prlist/recolist">목록검색</a>
                    </div>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/board/list">
                	<i class="fa-solid fa-clipboard icon"></i>
                    <span>게시판</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/user/custommerservice">
                <i class="fas fa-fw fa-cog icon"></i>
                    <span>고객센터</span></a>
            </li>
            
            <hr class="sidebar-divider">
            
			<li class="nav-item">
			    <div class="row justify-content-center">
			        <!-- Left Column -->
			        <div class="nav-link">
			            <span>최근본 상품 목록</span>
			            <hr>
			            <div class="container">
			                <div class="img-container">
			                    <c:forEach var="product2" items="${recentlyViewedProducts}" begin="0" end="3">
			                        <div class="mb-3">
			                            <a href="/pr?large=${product2.large}&medium=${product2.medium}&small=${product2.small}&sub_category=${product2.sub_category}&num=${product2.num}">
			                                <img class="img-fluid px-3 px-sm-4 mt-3 mb-4 img-size" src="${product2.imgUrl}" alt="Product Image">
			                            </a>
			                        </div>
			                    </c:forEach>
			                </div>
			            </div>
			        </div>
			    </div>
			</li>
        </ul>

<script>
$(document).ready(function () {
    $(document).click(function (event) {
        var clickover = $(event.target);
        var _opened = $(".collapse").hasClass("show");
        if (_opened === true && !clickover.hasClass("nav-link")) {
            $(".collapse").collapse('hide');
        }
    });
});
</script>