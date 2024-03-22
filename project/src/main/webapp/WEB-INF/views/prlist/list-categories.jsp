<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Categories</title>
<style>
select {
	width: 200px;
	margin: 10px;
}
</style>
<script>
	function loadNextCategory(currentLevel, nextLevel) {
		var selectedCategory = document.getElementById(currentLevel).value;
		if (selectedCategory) {
			// Clear the next categories
			var nextLevels = [ 'medium', 'small', 'sub' ];
			var currentIndex = nextLevels.indexOf(currentLevel);
			for (var i = currentIndex + 1; i < nextLevels.length; i++) {
				document.getElementById(nextLevels[i]).innerHTML = '';
			}

			// AJAX request to get the next category options
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					document.getElementById(nextLevel).innerHTML = this.responseText;
				}
			};
			xhr.open('GET', '/prlist/' + nextLevel + '?category='
					+ selectedCategory, true);
			xhr.send();
		}
	}
</script>
</head>
<body>

	<h1>Select a Category</h1>

	<!-- Drop-down for Large Category -->
	<select id="large" onchange="loadNextCategory('large', 'medium')">
		<option value="">Select Large Category</option>
		<option value="1">Large 1</option>
		<option value="2">Large 2</option>
		<option value="3">Large 3</option>
	</select>

	<!-- Drop-down for Medium Category, initially empty and to be populated on Large Category selection -->
	<select id="medium" onchange="loadNextCategory('medium', 'small')"
		>
	</select>

	<!-- Drop-down for Small Category, initially empty and to be populated on Medium Category selection -->
	<select id="small" onchange="loadNextCategory('small', 'sub')"
		>
	</select>

	<!-- Drop-down for Sub Category, initially empty and to be populated on Small Category selection -->
	<select id="sub">
	</select>

</body>
</html>