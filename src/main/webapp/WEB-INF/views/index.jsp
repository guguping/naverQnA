<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-17
  Time: 오전 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>index</title>
    <link rel="stylesheet" href="/resources/css/component.css">
</head>
<style>
    p {
        display: inline;
    }
</style>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp" %>
<section>
    <div id="section-inner">
        <div id="section-inner-contents">
            <h3 class="blind">홈 영역</h3>
            <div id="section-inner-header" style="width: 700px;margin: 0 auto;">
                <div id="section-inner-header-wrap">
                    <h4 class="blind">베스트 질문/답변</h4>
                    <div class="section-wrap-expert" style="margin-left: 15px;margin-right: 10px;">
                        <a href="https://m.expert.naver.com/" target="_blank" class="expert-link">
                            <div class="expert-background">
                                <div class="expert-background-img"></div>
                                <img src="https://ssl.pstatic.net/static/kin/section/expert/pc/home_panel_expert2.png"
                                     alt="">
                            </div>
                            <div class="expert-title">
                                <div class="expert-title-subBox">
                                    <h2 class="subTitle">
                                        <span class="blind">NEW</span>
                                    </h2>
                                </div>
                                <p class="description">전문가 상담이<br>필요할 땐,<br>지식iN 엑스퍼트</p>
                            </div>
                        </a>
                    </div>
                    <div class="section-wrap-hall" style="margin-right: 10px;">
                        <a href="#" class="hall-link">
                            <div class="hall-title">
                                <h2 class="subtitle1">
                                    <span class="blind">지식iN 성지</span>
                                </h2>
                                <!-- 댓글 "성지순례" 갯수 당 자동 등록-->
                                <p class="description">김보성 기부 많이 하나요?</p>
                            </div>
                        </a>
                    </div>
                    <div class="section-wrap-today" style="margin-right: 10px;">
                        <a href="#" class="today-link">
                            <div class="today-title">
                                <h2 class="subtitle2">
                                    <span class="blind">오늘의 질문</span>
                                </h2>
                                <p class="description">내가 좋아하는 소스는?!</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="section-inner-section">
                <div class="inner-section-main1">
                    <div class="ranking-area">
                        <div class="ranking-area-header">
                            <h4 class="ranking-area-header-title">많이 본 Q&amp;A</h4>
                            <div class="ranking-area-header-time">21일 06시 기준</div>
                        </div>
                        <div class="ranking-area-section">
                            <div class="ranking-area-section-list" style="height: 308px;">

                                <ul class="ranking-list">
                                    <c:forEach items="${bestBoardDTOList}" var="bestBoardList">
                                        <li class="ranking-list-item">
                                            <span class="list-no">1</span>
                                            <a href="#" class="list-title"
                                               target="_blank">${bestBoardList.boardTitle}</a>
                                            <a href="#" class="list-txt">테스트입니다</a>
                                            <span class="list-views">조회수 ${bestBoardList.boardHits}</span>
                                            <span class="list-answer">답변수 0</span>
                                        </li>
                                    </c:forEach>
                                </ul>
                                <ul class="ranking-list">
                                    <c:forEach items="${bestBoardDTOList}" var="bestBoardList">
                                        <li class="ranking-list-item">
                                            <span class="list-no">4</span>
                                            <a href="#" class="list-title"
                                               target="_blank">${bestBoardList.boardTitle}</a>
                                            <a href="#" class="list-txt">${bestBoardList.boardContents}</a>
                                            <span class="list-views">조회수 ${bestBoardList.boardHits}</span>
                                            <span class="list-answer">답변수 0</span>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="ranking-list-page">
                                <a href="#" class="ranking-list-page-button-on">1</a>
                                <a href="#" class="ranking-list-page-button-off">2</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%@include file="component/footer.jsp" %>
</body>
</html>
