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
                        <a class="collapse-item" href="/">전체상품</a>
                        <a class="collapse-item" href="/">인기상품</a>
                        <a class="collapse-item" href="/">추천상품</a>
                    </div>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/">
                	<i class="fa-solid fa-clipboard icon"></i>
                    <span>게시판</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/">
                	<i class="fa-solid fa-heart icon"></i>
                    <span>찜목록</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/">
                <i class="fas fa-fw fa-cog icon"></i>
                    <span>고객센터</span></a>
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