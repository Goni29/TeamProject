<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <body>
        <div id="content-detailed" style="display: none;" class="container">
            <div class="row">
                <div class="col-md-4 overflow-auto border" style="max-height: 100px;">
                    <div><strong>성별</strong></div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="male" id="male">
                        <label class="form-check-label" for="male">
                            남성
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="female" id="female">
                        <label class="form-check-label" for="female">
                            여성
                        </label>
                    </div>
                </div>
                <div class="col-md-4 overflow-auto border" style="max-height: 100px;">
                    <div><strong>연령대</strong></div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="under-teen" id="under-teen">
                        <label class="form-check-label" for="under-teen">
                            10대 이하
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="20s" id="20s">
                        <label class="form-check-label" for="20s">
                            20대
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="30s" id="30s">
                        <label class="form-check-label" for="30s">
                            30대
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="40s" id="40s">
                        <label class="form-check-label" for="40s">
                            40대
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="50s" id="50s">
                        <label class="form-check-label" for="50s">
                            50대
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="60s" id="60s">
                        <label class="form-check-label" for="60s">
                            60대 이상
                        </label>
                    </div>
                </div>
                <div class="col-md-4 overflow-auto border" style="max-height: 100px;">
                    <div><strong>지역</strong></div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="seoul" id="seoul">
                        <label class="form-check-label" for="seoul">
                            서울
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="incheon" id="incheon">
                        <label class="form-check-label" for="incheon">
                            인천
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="busan" id="busan">
                        <label class="form-check-label" for="busan">
                            부산
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="daegu" id="daegu">
                        <label class="form-check-label" for="daegu">
                            대구
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="gwangju" id="gwangju">
                        <label class="form-check-label" for="gwangju">
                            광주
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="daejeon" id="daejeon">
                        <label class="form-check-label" for="daejeon">
                            대전
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="ulsan" id="ulsan">
                        <label class="form-check-label" for="ulsan">
                            울산
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="gyeonggi" id="gyeonggi">
                        <label class="form-check-label" for="gyeonggi">
                            경기
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="gangwon" id="gangwon">
                        <label class="form-check-label" for="gangwon">
                            강원
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="chungbuk" id="chungbuk">
                        <label class="form-check-label" for="chungbuk">
                            충북
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="chungnam" id="chungnam">
                        <label class="form-check-label" for="chungnam">
                            충남
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="jeonbuk" id="jeonbuk">
                        <label class="form-check-label" for="jeonbuk">
                            전북
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="jeonnam" id="jeonnam">
                        <label class="form-check-label" for="jeonnam">
                            전남
                        </label>
                    </div>
					<div class="form-check">
					    <input class="form-check-input" type="checkbox" value="gyeongbuk" id="kyeongbuk">
					    <label class="form-check-label" for="gyeongbuk">
					        경북
					    </label>
					</div>
					<div class="form-check">
					    <input class="form-check-input" type="checkbox" value="gyeongnam" id="kyeongnam">
					    <label class="form-check-label" for="gyeongnam">
					        경남
					    </label>
					</div>
            </div>
        </div>
    </div>
</body>
</html>