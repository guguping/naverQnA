<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-17
  Time: 오전 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<html>
<head>
    <title>index</title>
    <link rel="stylesheet" href="/resources/css/component.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
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
                        <a href="/board/detail?BoardId=${holyLand.id}" target="_blank" class="hall-link">
                            <div class="hall-title">
                                <h2 class="subtitle1">
                                    <span class="blind">지식iN 성지</span>
                                </h2>
                                <!-- 댓글 "성지" 갯수 당 자동 등록-->
                                <p class="description">${holyLand.boardTitle}</p>
                            </div>
                        </a>
                    </div>
                    <div class="section-wrap-today" style="margin-right: 10px;">
                        <a href="/board/detail?BoardId=${firstBoard.id}" target="_blank" class="today-link">
                            <div class="today-title">
                                <h2 class="subtitle2">
                                    <span class="blind">오늘의 질문</span>
                                </h2>
                                <p class="description">${firstBoard.boardTitle}</p>
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
                            <div class="ranking-area-header-time">${bestBoardTime}</div>
                        </div>
                        <div class="ranking-area-section">
                            <div class="ranking-area-section-list" style="height: 308px;">
                                <ul class="ranking-list">
                                    <c:choose>
                                        <c:when test="${bestPaging.page eq 1}">
                                            <c:forEach items="${bestBoardDTOList}" var="bestBoardList" end="2"
                                                       varStatus="loop">
                                                <li class="ranking-list-item">
                                                    <span class="list-no">${loop.index + 1}</span>
                                                    <a href="/board/detail?BoardId=${bestBoardList.id}"
                                                       class="list-title"
                                                       target="_blank">${bestBoardList.boardTitle}</a>
                                                    <a href="/board/detail?BoardId=${bestBoardList.id}" class="list-txt"
                                                       style="height: 19px;"
                                                       target="_blank">${bestBoardList.boardContents}</a>
                                                    <span class="list-views">조회수 ${bestBoardList.boardHits}</span>
                                                    <span class="list-answer">답변수 ${bestBoardList.boardAnswer}</span>
                                                </li>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${bestBoardDTOList}" var="bestBoardList" varStatus="loop">
                                                <c:if test="${loop.index >= 0 && loop.index <= 2}">
                                                    <li class="ranking-list-item">
                                                        <span class="list-no">${bestBoardCount = bestBoardCount + 1}</span>
                                                        <a href="/board/detail?BoardId=${bestBoardList.id}"
                                                           class="list-title"
                                                           target="_blank">${bestBoardList.boardTitle}</a>
                                                        <a href="/board/detail?BoardId=${bestBoardList.id}"
                                                           class="list-txt"
                                                           style="height: 19px;"
                                                           target="_blank">${bestBoardList.boardContents}</a>
                                                        <span class="list-views">조회수 ${bestBoardList.boardHits}</span>
                                                        <span class="list-answer">답변수 ${bestBoardList.boardAnswer}</span>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                                <ul class="ranking-list">
                                    <c:choose>
                                        <c:when test="${bestPaging.page eq 1}">
                                            <c:forEach items="${bestBoardDTOList}" var="bestBoardList" begin="3"
                                                       varStatus="loop">
                                                <li class="ranking-list-item">
                                                    <span class="list-no">${loop.index + 1}</span>
                                                    <a href="/board/detail?BoardId=${bestBoardList.id}"
                                                       class="list-title"
                                                       target="_blank">${bestBoardList.boardTitle}</a>
                                                    <a href="/board/detail?BoardId=${bestBoardList.id}" class="list-txt"
                                                       style="height: 19px;"
                                                       target="_blank">${bestBoardList.boardContents}</a>
                                                    <span class="list-views">조회수 ${bestBoardList.boardHits}</span>
                                                    <span class="list-answer">답변수 ${bestBoardList.boardAnswer}</span>
                                                </li>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${bestBoardDTOList}" var="bestBoardList" varStatus="loop">
                                                <c:if test="${loop.index >= 3 && loop.index <= 3}">
                                                    <li class="ranking-list-item">
                                                        <span class="list-no">${bestBoardCount = bestBoardCount + 1}</span>
                                                        <a href="/board/detail?BoardId=${bestBoardList.id}"
                                                           class="list-title"
                                                           target="_blank"
                                                           style="padding-left: 5px;">${bestBoardList.boardTitle}</a>
                                                        <a href="/board/detail?BoardId=${bestBoardList.id}"
                                                           class="list-txt"
                                                           style="height: 19px;"
                                                           target="_blank">${bestBoardList.boardContents}</a>
                                                        <span class="list-views">조회수 ${bestBoardList.boardHits}</span>
                                                        <span class="list-answer">답변수 ${bestBoardList.boardAnswer}</span>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                            <div class="ranking-list-page">
                                <c:forEach begin="${bestPaging.startPage}" end="${bestPaging.endPage}" var="i" step="1">
                                    <c:choose>
                                        <c:when test="${i eq bestPaging.page}">
                                            <a class="ranking-list-page-button-on">${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="/?bestPage=${i}" class="ranking-list-page-button-off">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section-inner-section" id="section-inner-section">
                <div class="inner-section-main2">
                    <div class="main2-area-section">
                        <div class="main2-area-tab">
                            <ul>
                                <li>
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
                                            <h5 class="main2-contents-title" style="top: -3px;">
                                                <a href="#">
                                                    <strong>전체</strong>
                                                    <span class="blind">QnA바로가기 링크 넣는곳</span>
                                                </a>
                                            </h5>
                                            <div class="main2-contents-search">
                                                <form action="/" method="get" title="QnA검색을 위한 공간">
                                                    <span class="blind">QnA검색을 위한 공간</span>
                                                    <input type="text" name="q" class="main2-search-input">
                                                    <input type="submit" class="main2-search-input-btn"
                                                           name="main2Search" style="cursor: pointer;">
                                                </form>
                                            </div>
                                            <div class="main2-contents-block">
                                            </div>
                                            <div id="ajax-main2-contents-list-box">
                                                <c:forEach items="${qnaBoardDTOList}" var="qnaBoardList">
                                                    <div class="main2-contents-list-box">
                                                        <div class="main2-contents-list-inner">
                                                            <div class="main2-contents-list-item">
                                                                <a href="/board/detail?BoardId=${qnaBoardList.id}"
                                                                   target="_blank" class="main2-contents-item">
                                                                <span class="power_grade" title="내공 전시장">
                                                                    500
                                                                </span>
                                                                    <span class="main2-item-title">${qnaBoardList.boardTitle}</span>
                                                                    <p class="main2-item-contents">${qnaBoardList.boardContents}</p>
                                                                </a>
                                                            </div>
                                                            <div class="main2-item-info">
                                                                <span class="item-info-answer">답변 ${qnaBoardList.boardAnswer}</span>
                                                                <span class="item-info-type">조회수 ${qnaBoardList.boardHits}</span>
                                                                <span class="item-info-time">
                                                                    <fmt:parseNumber value="${now.time / (1000*60)}" var="nowfmtTime"/><!-- .time 필수 -->
                                                                    <fmt:parseNumber value="${qnaBoardList.boardCreatedDate.time / (1000*60)}" var="commentDatefmtTime"/><!-- .time 필수 -->
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
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <div class="main2-contents-paging-box">
                                                <span id="backBtnResult">
                                                <c:if test="${qnaPaging.page > 1}">
                                                    <a class="QnA-back-bnt-on" style="cursor: pointer;"
                                                       onclick="main2ListNBBtn(${qnaPaging.page-1},${qnaPaging.q})">이전</a>
                                                    <%-- href="/?qnaPage=${qnaPaging.page-1}&q=${qnaPaging.q}" --%>
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
                                                                <a class="QnA-paging-bnt-on" style="cursor: pointer;"
                                                                   onclick="main2ListNBBtn(${i},${qnaPaging.q})">${i}</a>
                                                                <%--href="/?qnaPage=${i}&q=${qnaPaging.q}"--%>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </div>
                                                <span id="nextBtnResult">
                                                <c:if test="${qnaPaging.page != qnaPaging.maxPage}">
                                                    <a class="QnA-next-bnt-on" style="cursor: pointer;"
                                                       onclick="main2ListNBBtn(${qnaPaging.page+1},${qnaPaging.q})">다음</a>
                                                    <%--href="/?qnaPage=${qnaPaging.page+1}&q=${qnaPaging.q}"--%>
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
    </div>
</section>
<%@include file="component/footer.jsp" %>
</body>
<script>
    const main2ListNBBtn = (main2PagingPage, main2Search) => {
        const qnaPage = main2PagingPage;
        const q = main2Search;
        const ListResult = document.getElementById('ajax-main2-contents-list-box');
        const numResult = document.getElementById('numResult');
        const backBtnResult = document.getElementById('backBtnResult');
        const nextBtnResult = document.getElementById('nextBtnResult');
        const target = document.getElementById('section-inner-section');
        $.ajax({
            type: "post",
            url: "/index/UDPage",
            data: {
                "qnaPage": qnaPage,
                "q": q
            },
            success: function (res) {
                let outPut = "";
                let numPut = "";
                let downPut = "";
                downPut += '<a class="QnA-back-bnt-on" style="cursor: pointer;" onclick="main2ListNBBtn(' + (res.qnaBoardPage.page - 1) + ',' + res.qnaBoardPage.q + ')">이전</a>';
                let upPut = "";
                upPut += '<a class="QnA-next-bnt-on" style="cursor: pointer;" onclick="main2ListNBBtn(' + (res.qnaBoardPage.page + 1) + ',' + res.qnaBoardPage.q + ')">다음</a>';
                for (let i in res.qnaBoardDTOList) {
                    outPut += '<div class="main2-contents-list-box">';
                    outPut += '<div class="main2-contents-list-inner">';
                    outPut += '<div class="main2-contents-list-item">';
                    outPut += '<a href="/board/detail?BoardId=' + res.qnaBoardDTOList[i].id + '" target="_blank" class="main2-contents-item">';
                    outPut += '<span class="power_grade" title="내공 전시장">';
                    outPut += '500';
                    outPut += '</span>';
                    outPut += '<span class="main2-item-title">' + res.qnaBoardDTOList[i].boardTitle + '</span>';
                    outPut += '<p class="main2-item-contents">' + res.qnaBoardDTOList[i].boardContents + '</p>';
                    outPut += '</a>';
                    outPut += '</div>';
                    outPut += '<div class="main2-item-info">';
                    outPut += '<span class="item-info-answer">답변 ' + res.qnaBoardDTOList[i].boardAnswer + '</span>';
                    outPut += '<span class="item-info-type">조회수 '+ res.qnaBoardDTOList[i].boardHits +'</span>';
                    outPut += '<span class="item-info-time">';
                    let nowTime = new Date().getTime(); // 현재 시간을 밀리초로 가져옴
                    let commentDate = new Date(res.qnaBoardDTOList[i].boardCreatedDate); // DTO의 boardCreatedDate를 JavaScript Date 객체로 변환
                    let timeDifference = (nowTime - commentDate) / (1000 * 60); // 분 단위로 시간 차이 계산
                    if (timeDifference <= 10){
                        outPut +=  '방금 전';
                    } else if (timeDifference > 10 && timeDifference <= 60){
                        outPut += moment(timeDifference)+'분 전';
                    } else if (timeDifference > 60 && timeDifference <= 60*24){
                        timeDifference = (timeDifference / 60);
                        outPut += moment(timeDifference)+'시간 전';
                    } else if (timeDifference > 60*24 && timeDifference <= 60*24*30){
                        timeDifference = (timeDifference / (60*24));
                        outPut += moment(timeDifference)+'일 전';
                    } else {
                        outPut += moment(res.qnaBoardDTOList[i].boardCreatedDate).format("YYYY-MM-DD HH:mm");
                    }
                    outPut += '</span>';
                    outPut += '</div>';
                    outPut += '</div>';
                    outPut += '</div>';
                }
                for (let i = res.qnaBoardPage.startPage; i <= res.qnaBoardPage.endPage; i++) {
                    if (res.qnaBoardPage.page == i) {
                        numPut += '<a class="QnA-paging-bnt-off">' + i + '</a>';
                    } else {
                        numPut += '<a class="QnA-paging-bnt-on" style="cursor: pointer;" onclick="main2ListNBBtn(' + i + ',' + res.qnaBoardPage.q + ')">' + i + '</a>';
                    }
                }
                if (res.qnaBoardPage.page <= 1) {
                    backBtnResult.innerHTML = "";
                } else {
                    backBtnResult.innerHTML = downPut;
                }
                if (res.qnaBoardPage.page == res.qnaBoardPage.maxPage) {
                    nextBtnResult.innerHTML = "";
                } else if (res.qnaBoardPage.page != res.qnaBoardPage.maxPage) {
                    nextBtnResult.innerHTML = upPut;
                }
                numResult.innerHTML = numPut;
                ListResult.innerHTML = outPut;
            },
            error: function () {
                console.log("실패");
            }
        })
        target.scrollIntoView({behavior: 'auto'});
    }
</script>
</html>
