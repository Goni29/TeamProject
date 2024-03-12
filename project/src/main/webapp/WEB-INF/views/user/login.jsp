<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../header.jsp"%>
<%@ include file="../topbar.jsp"%>

<span class="titletext" hidden="hidden">로그인</span>

<body class="text-center">
    <div class="container mt-5">
        <main class="form-signin">
            <form action="login" method="post">
                <h1 class="h3 mb-3 fw-normal">로그인 페이지</h1>

                <div class="form-floating">
                    <input type="text" class="form-control" id="id" name="id" placeholder="아이디 입력...">
                    <label for="id">아이디</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                    <label for="password">비밀번호</label>
                </div>

                <div class="checkbox mb-3">
                    <label>
                        <input type="checkbox" value="remember-me">
                        아이디 저장
                    </label>
                </div>
                <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
                <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
            </form>
        </main>
    </div>
</body>


<%@ include file="../footer.jsp"%>