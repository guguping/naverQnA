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
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
                                                            <c:if test="${qnaBoardDTOList.boardPoint != 0}">
                                                            <span class="power_grade" title="내공 전시장">
                                                                    ${qnaBoardDTOList.boardPoint}
                                                            </span>
                                                            </c:if>
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
                                                            <c:if test="${qnaBoardDTOList.boardPoint != 0}">
                                                            <span class="power_grade" style="margin-right: 10px;"
                                                                  title="내공 전시장">${qnaBoardDTOList.boardPoint}</span>
                                                            </c:if>
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

                                        <div class="main2-contents-paging-box" id="numResult">
                                                <span>
                                                <c:if test="${qnaPaging.page > 1}">
                                                    <a class="QnA-back-bnt-on"
                                                       href="/board/Qna?qnaPage=${qnaPaging.page-1}&q=${qnaPaging.q}"
                                                       style="cursor: pointer;">이전</a>
                                                </c:if>
                                                </span>
                                            <div style="display: inline-block;">
                                                <c:forEach begin="${qnaPaging.startPage}"
                                                           end="${qnaPaging.endPage}" var="i" step="1">
                                                    <c:choose>
                                                        <c:when test="${i eq qnaPaging.page}">
                                                            <a class="QnA-paging-bnt-off">${i}</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a class="QnA-paging-bnt-on"
                                                               href="/board/Qna?qnaPage=${i}&q=${qnaPaging.q}"
                                                               style="cursor: pointer;">${i}</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                            <span>
                                                <c:if test="${qnaPaging.page != qnaPaging.maxPage}">
                                                    <a class="QnA-next-bnt-on"
                                                       href="/board/Qna?qnaPage=${qnaPaging.page+1}&q=${qnaPaging.q}"
                                                       style="cursor: pointer;">다음</a>
                                                </c:if>
                                            </span>
                                        </div>

                                        <div class="main2-contents-paging-box" id="ajax-numResult">
                                                <span id="backBtnResult">
                                                <c:if test="${qnaPaging.page > 1}">
                                                    <a class="QnA-back-bnt-on"
                                                       onclick="qnaListNBBtn(${qnaPaging.page-1},${qnaPaging.q})"
                                                       style="cursor: pointer;">이전</a>
                                                </c:if>
                                                </span>
                                            <div id="ajax-numResult-numBtn" style="display: inline-block;">
                                                <c:forEach begin="${qnaPaging.startPage}"
                                                           end="${qnaPaging.endPage}" var="i" step="1">
                                                    <c:choose>
                                                        <c:when test="${i eq qnaPaging.page}">
                                                            <a class="QnA-paging-bnt-off">${i}</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a class="QnA-paging-bnt-on"
                                                               onclick="qnaListNBBtn(${i},${qnaPaging.q})"
                                                               style="cursor: pointer;">${i}</a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                            <span id="nextBtnResult">
                                                <c:if test="${qnaPaging.page != qnaPaging.maxPage}">
                                                    <a class="QnA-next-bnt-on"
                                                       onclick="qnaListNBBtn(${qnaPaging.page+1},${qnaPaging.q})"
                                                       style="cursor: pointer;">다음</a>
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
    <div style="margin-top: 9px;letter-spacing: -.5px;padding-bottom: 20px;">
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
        const numResult = document.getElementById('numResult');
        const ajaxNumResult = document.getElementById('ajax-numResult');
        $('#type_title').removeClass('type_title1');
        $('#type_preview').removeClass('type_preview1');
        $('#type_title').addClass('type_title');
        $('#type_preview').addClass('type_preview');
        previewTypeQna.style.display = "block";
        numResult.style.display = "block";
        titleTypeQna.style.display = "none";
        ajaxNumResult.style.display = "none";
    }
    const titleTypeQna = () => {
        const titleTypeQna = document.getElementById('titleTypeQna');
        const previewTypeQna = document.getElementById('previewTypeQna');
        const numResult = document.getElementById('numResult');
        const ajaxNumResult = document.getElementById('ajax-numResult');
        $('#type_title').removeClass('type_title');
        $('#type_preview').removeClass('type_preview');
        $('#type_title').addClass('type_title1');
        $('#type_preview').addClass('type_preview1');
        previewTypeQna.style.display = "none";
        numResult.style.display = "none";
        titleTypeQna.style.display = "block";
        ajaxNumResult.style.display = "block";
    }
    const qnaListNBBtn = (qnaPagingPage, qnaSearch) => {
        const qnaPage = qnaPagingPage;
        const q = qnaSearch;
        const ListResult = document.getElementById('titleTypeQna');
        const numResult = document.getElementById('ajax-numResult-numBtn');
        const backBtnResult = document.getElementById('backBtnResult');
        const nextBtnResult = document.getElementById('nextBtnResult');
        const previewTypeQna = document.getElementById('previewTypeQna');
        $.ajax({
            type: "post",
            url: "/boardQna/UDPage",
            data: {
                "qnaPage": qnaPage,
                "q": q
            },
            success: function (res) {
                let outPut = "";
                let numPut = "";
                let downPut = "";
                downPut += '<a class="QnA-back-bnt-on" style="cursor: pointer;" onclick="qnaListNBBtn(' + (res.qnaBoardPage.page - 1) + ',' + res.qnaBoardPage.q + ')">이전</a>';
                let upPut = "";
                upPut += '<a class="QnA-next-bnt-on" style="cursor: pointer;" onclick="qnaListNBBtn(' + (res.qnaBoardPage.page + 1) + ',' + res.qnaBoardPage.q + ')">다음</a>';
                for (let i in res.qnaBoardDTOList) {
                    outPut += '<div class="answer_box" style="border-top: 1px solid #cacccc;position: relative;">';
                    outPut += '<div class="tit_wrap">'
                    outPut += '<a href="/board/detail?BoardId=' + res.qnaBoardDTOList[i].id + '" target="_blank" class="tit_wrap_link_a">';
                    if(res.qnaBoardDTOList[i].boardPoint != 0){
                        outPut += '<span class="power_grade" style="margin-right: 10px;" title="내공 전시장">'+ res.qnaBoardDTOList[i].boardPoint +'</span>';
                    }
                    outPut += '<span class=tit_txt">' + res.qnaBoardDTOList[i].boardTitle + '</span>';
                    outPut += '</a>';
                    outPut += '</div>';
                    outPut += '<div class="update_info">';
                    outPut += '<span class="num_answer">';
                    outPut += '답변 <em>' + res.qnaBoardDTOList[i].boardAnswer +'</em>';
                    outPut += '</span>';
                    outPut += '<span class="info">';
                    let nowTime = new Date().getTime(); // 현재 시간을 밀리초로 가져옴
                    let commentDate = new Date(res.qnaBoardDTOList[i].boardCreatedDate); // DTO의 boardCreatedDate를 JavaScript Date 객체로 변환
                    let timeDifference = (nowTime - commentDate) / (1000 * 60); // 분 단위로 시간 차이 계산
                    if (timeDifference <= 10) {
                        outPut += '방금 전';
                    } else if (timeDifference > 10 && timeDifference <= 60) {
                        outPut += moment(timeDifference) + '분 전';
                    } else if (timeDifference > 60 && timeDifference <= 60 * 24) {
                        timeDifference = (timeDifference / 60);
                        outPut += moment(timeDifference) + '시간 전';
                    } else if (timeDifference > 60 * 24 && timeDifference <= 60 * 24 * 30) {
                        timeDifference = (timeDifference / (60 * 24));
                        outPut += moment(timeDifference) + '일 전';
                    } else if (timeDifference > 60*24 && timeDifference <= 60*24*30){
                        outPut += moment(timeDifference) + '일 전';
                    } else {
                        outPut += moment(res.qnaBoardDTOList[i].boardCreatedDate).format("YYYY-MM-DD HH:mm");
                    }
                    outPut += '</span>';
                    outPut += '</div>';
                    outPut += '</div>';
                }
                for (let i = res.qnaBoardPage.startPage; i <= res.qnaBoardPage.endPage; i++) {
                    if (res.qnaBoardPage.page == i) {
                        numPut += '<a class="QnA-paging-bnt-off">' + i + '</a>';
                    } else {
                        numPut += '<a class="QnA-paging-bnt-on" style="cursor: pointer;" onclick="qnaListNBBtn(' + i + ',' + res.qnaBoardPage.q + ')">' + i + '</a>';
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
        previewTypeQna.scrollIntoView({behavior: 'auto'});
    }
</script>
</html>
