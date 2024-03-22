<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Category Selection</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#largeCategory').change(function () {
                var largeId = $(this).val();
                $("#mediumCategory").empty();
                $("#smallCategory").empty();
                $("#subCategory").empty();
                if (largeId) {
                    $.getJSON('/category/medium', {parentId: largeId}, function (mediumCategories) {
                        $.each(mediumCategories, function (index, item) {
                            $("#mediumCategory").append(new Option(item.displayName, item.num));
                        });
                    });
                }
            });

            $('#mediumCategory').change(function () {
                var mediumId = $(this).val();
                $("#smallCategory").empty();
                $("#subCategory").empty();
                if (mediumId) {
                    $.getJSON('/category/small', {parentId: mediumId}, function (smallCategories) {
                       
                        $.each(smallCategories, function (index, item) {
                            $("#smallCategory").append(new Option(item.displayName, item.num));
                        });
                    });
                }
            });

            $('#smallCategory').change(function () {
                var smallId = $(this).val();
                $("#subCategory").empty();
                if (smallId) {
                    $.getJSON('/category/sub', {parentId: smallId}, function (subCategories) {
                        $.each(subCategories, function (index, item) {
                            $("#subCategory").append(new Option(item.displayName, item.num));
                        });
                    });
                }
            });
        });
    </script>
</head>
<body>
    <h2>Select Category</h2>
    <form>
        <label for="largeCategory">대분류:</label>
        <select id="largeCategory">
            <option value="">Select one...</option>
            <c:forEach items="${largeCategories}" var="category">
                <option value="${category.num}">${category.large}</option>
            </c:forEach>
        </select>

        <label for="mediumCategory">중분류:</label>
        <select id="mediumCategory">
            <option value="">Select one...</option>
        </select>

        <label for="smallCategory">소분류:</label>
        <select id="smallCategory">
            <option value="">Select one...</option>
        </select>

        <label for="subCategory">세부분류:</label>
        <select id="subCategory">
            <option value="">Select one...</option>
        </select>
    </form>
</body>
</html>
                       