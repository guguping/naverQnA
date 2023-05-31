<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-30
  Time: 오후 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<html>
<head>
    <title>boardQna</title>
    <link rel="stylesheet" href="/resources/css/component.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>
<section>
    <div class="qnaContainer" style="min-height: 70%">
        <div class="container-fluid-content-inner">
            <h3 class="blind">답변하기 영역</h3>
            <div class="section_answer">
                <div class="section_answer-container">
                    <div class="section_answer-main-container" style="min-height: 70%">
                        <div class="title_area">
                            <ul>
                                <li class="title_area-item">
                                    <span class="main2-tab-title">
                                        <span class="line-hold">답변을 기다리는 질문</span>
                                    </span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div>
                                <h4 class="blind">답변을 기다리는 질문</h4>
                                <div class="main2-contents-box">
                                    <div class="main2-contents-inner">
                                        <div class="main2-contents-header">
                                            <h5 class="main2-contents-title">
                                                <a href="#">
                                                    <strong>전체</strong>
                                                    <span class="blind">QnA바로가기 링크 넣는곳</span>
                                                </a>
                                            </h5>
                                            <div class="main2-contents-search" style="z-index: 1000">
                                                <form action="/board/Qna" method="get" title="QnA검색을 위한 공간">
                                                    <span class="blind">QnA검색을 위한 공간</span>
                                                    <input type="text" class="main2-search-input" name="q">
                                                    <input type="submit" class="main2-search-input-btn"
                                                           name="main2Search" style="cursor: pointer;">
                                                </form>
                                            </div>
                                            <div class="sort-list-box">
                                                <div class="sort-list-box-left">
                                                    <div class="views-type-area">
                                                        <p class="blind">보기옵션 선택</p>
                                                        <div class="menu-type-box">
                                                            <ul class="view_type_list">
                                                                <li class="_preview">
                                                                    <a href="#" class="type_preview" id="type_preview"
                                                                       onclick="previewTypeQna()">미리보기형</a>
                                                                </li>
                                                                <li class="_onlyTitle">
                                                                    <a href="#" class="type_title" id="type_title"
                                                                       onclick="titleTypeQna()">제목형</a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="main2-contents-list-box" id="previewTypeQna">
                                            <c:forEach items="${qnaBoardDTOList}" var="qnaBoardDTOList">
                                                <div class="main2-contents-list-inner">
                                                    <div class="main2-contents-list-item">
                                                        <a href="/board/detail?BoardId=${qnaBoardDTOList.id}"
                                                           class="main2-contents-item">
                                                            <span class="power_grade" title="내공 전시장">
                                                                    500
                                                            </span>
                                                            <span class="main2-item-title">
                                                                    ${qnaBoardDTOList.boardTitle}
                                                            </span>
                                                            <p class="main2-item-contents">
                                                                    ${qnaBoardDTOList.boardContents}
                                                            </p>
                                                        </a>
                                                    </div>
                                                    <div class="main2-item-info">
                                                        <span class="item-info-answer">답변 ${qnaBoardDTOList.boardAnswer}</span>
                                                        <span class="item-info-type">조회수 ${qnaBoardDTOList.boardHits}</span>
                                                        <span class="item-info-time">
                                                            <fmt:parseNumber value="${now.time / (1000*60)}" var="nowfmtTime"/><!-- .time 필수 -->
                                                            <fmt:parseNumber value="${qnaBoardDTOList.boardCreatedDate.time / (1000*60)}" var="commentDatefmtTime"/><!-- .time 필수 -->
                                                            <fmt:parseNumber value="${nowfmtTime - commentDatefmtTime}"
                                                                             var="timeDefference"/>
                                                            <c:choose>
                                                                <c:when test="${timeDefference <= 10}"><!-- 10분 이하 -->
                                                                    방금 전
                                                                </c:when>
                                                                <c:when test="${timeDefference > 10 && timeDefference <= 60}"><!-- 1시간 이하 -->
                                                                    <fmt:parseNumber value="${timeDefference}"
                                                                                     integerOnly="true"
                                                                                     var="timeDefference"/>
                                                                    ${timeDefference }분 전
                                                                </c:when>
                                                                <c:when test="${timeDefference > 60 && timeDefference <= 60*24}"><!-- 24시간 이하 -->
                                                                    <fmt:parseNumber value="${timeDefference / 60}"
                                                                                     integerOnly="true"
                                                                                     var="timeDefference"/>
                                                                    ${timeDefference }시간 전
                                                                </c:when>
                                                                <c:when test="${timeDefference > 60*24 && timeDefference <= 60*24*30}"><!-- 30일 이하 -->
                                                                    <fmt:parseNumber value="${timeDefference / (60*24)}"
                                                                                     integerOnly="true"
                                                                                     var="timeDefference"/>
                                                                    ${timeDefference }일 전
                                                                </c:when>
                                                                <c:when test="${timeDefference > 60*24*30 && timeDefference <= 60*24*365}"><!-- 1년 이하 -->
                                                                    <fmt:parseNumber
                                                                            value="${timeDefference / (60*24*30)}"
                                                                            integerOnly="true" var="timeDefference"/>
                                                                    ${timeDefference }월 전
                                                                </c:when>
                                                                <c:when test="${timeDefference > 60*24*365}">
                                                                    <fmt:parseNumber
                                                                            value="${timeDefference / (60*24*365)}"
                                                                            integerOnly="true" var="timeDefference"/>
                                                                    ${timeDefference }년 전
                                                                </c:when>
                                                            </c:choose>
                                                        </span>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>

                                        <div class="main2-contents-list-box" id="titleTypeQna"
                                             style="position: relative;">
                                            <c:forEach items="${qnaBoardDTOList}" var="qnaBoardDTOList">
                                                <div class="answer_box"
                                                     style="border-top: 1px solid #cacccc;position: relative;">
                                                    <div class="tit_wrap">
                                                        <a href="/board/detail?BoardId=${qnaBoardDTOList.id}"
                                                           target="_blank" class="tit_wrap_link_a">
                                                            <span class="tit_txt">${qnaBoardDTOList.boardTitle}</span>
                                                        </a>
                                                    </div>
                                                    <div class="update_info">
                                                        <span class="num_answer">답변 <em>${qnaBoardDTOList.boardAnswer}</em></span>
                                                        <span class="info">
                                                            <fmt:parseNumber value="${now.time / (1000*60)}" var="nowfmtTime"/><!-- .time 필수 -->
                                                            <fmt:parseNumber value="${qnaBoardDTOList.boardCreatedDate.time / (1000*60)}" var="commentDatefmtTime"/><!-- .time 필수 -->
                                                            <fmt:parseNumber value="${nowfmtTime - commentDatefmtTime}"
                                                                             var="timeDefference"/>
                                                            <c:choose>
                                                                <c:when test="${timeDefference <= 10}"><!-- 10분 이하 -->
                                                                    방금 전
                                                                </c:when>
                                                                <c:when test="${timeDefference > 10 && timeDefference <= 60}"><!-- 1시간 이하 -->
                                                                    <fmt:parseNumber value="${timeDefference}"
                                                                                     integerOnly="true"
                                                                                     var="timeDefference"/>
                                                                    ${timeDefference }분 전
                                                                </c:when>
                                                                <c:when test="${timeDefference > 60 && timeDefference <= 60*24}"><!-- 24시간 이하 -->
                                                                    <fmt:parseNumber value="${timeDefference / 60}"
                                                                                     integerOnly="true"
                                                                                     var="timeDefference"/>
                                                                    ${timeDefference }시간 전
                                                                </c:when>
                                                                <c:when test="${timeDefference > 60*24 && timeDefference <= 60*24*30}"><!-- 30일 이하 -->
                                                                    <fmt:parseNumber value="${timeDefference / (60*24)}"
                                                                                     integerOnly="true"
                                                                                     var="timeDefference"/>
                                                                    ${timeDefference }일 전
                                                                </c:when>
                                                                <c:when test="${timeDefference > 60*24*30 && timeDefference <= 60*24*365}"><!-- 1년 이하 -->
                                                                    <fmt:parseNumber
                                                                            value="${timeDefference / (60*24*30)}"
                                                                            integerOnly="true" var="timeDefference"/>
                                                                    ${timeDefference }월 전
                                                                </c:when>
                                                                <c:when test="${timeDefference > 60*24*365}">
                                                                    <fmt:parseNumber
                                                                            value="${timeDefference / (60*24*365)}"
                                                                            integerOnly="true" var="timeDefference"/>
                                                                    ${timeDefference }년 전
                                                                </c:when>
                                                            </c:choose>
                                                        </span>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>

                                        <div class="main2-contents-paging-box">
                                                <span id="backBtnResult">
                                                <c:if test="${qnaPaging.page > 1}">
                                                    <a href="/board/Qna?qnaPage=${qnaPaging.page-1}&q=${qnaPaging.q}"
                                                       class="QnA-back-bnt-on" style="cursor: pointer;">이전</a>
                                                </c:if>
                                                </span>
                                            <div style="display: inline-block;" id="numResult">
                                                <c:forEach begin="${qnaPaging.startPage}"
                                                           end="${qnaPaging.endPage}" var="i" step="1">
                                                    <c:choose>
                                                        <c:when test="${i eq qnaPaging.page}">
                                                            <a class="QnA-paging-bnt-off">${i}</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="/board/Qna?qnaPage=${i}&q=${qnaPaging.q}"
                                                               class="QnA-paging-bnt-on"
                                                               style="cursor: pointer;">${i}</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                            <span id="nextBtnResult">
                                                <c:if test="${qnaPaging.page != qnaPaging.maxPage}">
                                                    <a href="/board/Qna?qnaPage=${qnaPaging.page+1}&q=${qnaPaging.q}"
                                                       class="QnA-next-bnt-on" style="cursor: pointer;">다음</a>
                                                </c:if>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<footer style="text-align: center;padding:15px 0 15px;">
    <div style="margin-top: 9px;letter-spacing: -.5px;">
        <ul class="footer_link" id="footer_link" style="list-style: none;">
            <li><a target="_blank" class="footer_item" href="http://www.naver.com/rules/service.html"
                   id="fot.agreement"><span class="text">이용약관</span></a></li>

            <li><a target="_blank" class="footer_item" href="http://www.naver.com/rules/privacy.html"
                   id="fot.privacy"><span class="text"><strong>개인정보처리방침</strong></span></a></li>

            <li><a target="_blank" class="footer_item" href="http://www.naver.com/rules/disclaimer.html"
                   id="fot.disclaimer"><span class="text">책임의 한계와 법적고지</span></a></li>

            <li><a target="_blank" class="footer_item"
                   href="https://help.naver.com/support/service/main.nhn?serviceNo=532" id="fot.help"><span
                    class="text">회원정보 고객센터</span></a></li>
        </ul>
        <a href="https://www.navercorp.com/" style="text-decoration: none;color: black;"><samp
                id="footer-logo"><samp style="position: absolute;clip:rect( 0 0 0 0);">NAVE</samp></samp></a>
        <span class="text" style="font-size: 12px;line-height: 16px;color: #888;">Copyright</span>
        <span class="corp" style="font-size: 12px;line-height: 16px;">© NAVER Corp.</span>
        <span class="text" style="font-size: 12px;line-height: 16px;color: #888;">All Rights Reserved.</span>
    </div>
</footer>
</body>
<script>
    const previewTypeQna = () => {
        const previewTypeQna = document.getElementById('previewTypeQna');
        const titleTypeQna = document.getElementById('titleTypeQna');
        $('#type_title').removeClass('type_title1');
        $('#type_preview').removeClass('type_preview1');
        $('#type_title').addClass('type_title');
        $('#type_preview').addClass('type_preview');
        previewTypeQna.style.display = "block";
        titleTypeQna.style.display = "none";
    }
    const titleTypeQna = () => {
        const titleTypeQna = document.getElementById('titleTypeQna');
        const previewTypeQna = document.getElementById('previewTypeQna');
        $('#type_title').removeClass('type_title');
        $('#type_preview').removeClass('type_preview');
        $('#type_title').addClass('type_title1');
        $('#type_preview').addClass('type_preview1');
        previewTypeQna.style.display = "none";
        titleTypeQna.style.display = "block";

    }
</script>
</html>
