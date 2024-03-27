<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../header.jsp"%>

<style>
	.border {
        border: 1px solid #dee2e6;
    }
    .border table {
        margin-bottom: 0;
    }
    .border th, .border td {
        border: 1px solid #dee2e6;
    }
    .border thead th {
        border-bottom-width: 2px;
    }
    .page-size {
        width: 100vw;
    }
</style>

<body>
<div id="wrapper">
    
	<%@ include file="../sidebar.jsp"%>
		<div id="content-wrapper" class="d-flex flex-column page-size">       
		<%@ include file="../topbar.jsp"%>
		
		<div class="container mt-3">
			<select id="detailSelect" class="form-control">
				<option value="general" selected>전반</option>
				<option value="detailed">세부</option>
			</select>
		</div>
		
		<span class="titletext" hidden="hidden">상품 검색 이력</span>
		<div class="container-fluid p-5 text-center">
		    <h1>상품 검색 이력</h1>
		</div>
		
		<div class="container mt-5">
			<%@ include file="./general_page.jsp"%>
			
			<%@ include file="./detail_page.jsp"%>
		    
		</div>
	
	</div>
</div>

<script>
    $(document).ready(function(){
      $('input[type="checkbox"][name="filter"]').change(function() {
        $('.table tr').attr('hidden', true);

        $('input[type="checkbox"][name="filter"]:checked').each(function() {
          const value = $(this).val();
          $('.' + value).attr('hidden', false);
        });
      });
    });
    
    function toggleContent() {
        var selection = document.getElementById("detailSelect").value;
        var generalContent = document.getElementById("content-general");
        var detailedContent = document.getElementById("content-detailed");

        if (selection === "general") {
            generalContent.style.display = "block";
            detailedContent.style.display = "none";
        } else if (selection === "detailed") {
            generalContent.style.display = "none";
            detailedContent.style.display = "block";
        }
    }

    document.addEventListener("DOMContentLoaded", function() {
        toggleContent();
    });

    document.getElementById("detailSelect").addEventListener("change", toggleContent);
    
</script>

<%@include file="../footer.jsp"%>
</body>