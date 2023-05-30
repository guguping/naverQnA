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
<html>
<head>
    <title>boardQna</title>
    <link rel="stylesheet" href="/resources/css/component.css">
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
                                            <div class="main2-contents-search">
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
                                                        <ul class="view_type_list">
                                                            <li class="_preview">
                                                                <a href="#" class="type_preview">미리보기형</a>
                                                            </li>
                                                            <li class="_onlyTitle">
                                                                <a href="#" class="type_title">제목형</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="main2-contents-block">
                                            </div>
                                            <div class="main2-contents-list-box">
                                                <c:forEach items="${qnaBoardDTOList}" var="qnaBoardDTOList">
                                                    <div class="main2-contents-list-inner">
                                                        <div class="main2-contents-list-item">
                                                            <a href="#" class="main2-contents-item">
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
                                                            <span class="item-info-time"><fmt:formatDate
                                                                    value="${qnaBoardList.boardCreatedDate}"
                                                                    pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></span>
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
    // const main2ListNBBtn = (main2PagingPage, main2Search) => {
    //     const qnaPage = main2PagingPage;
    //     const q = main2Search;
    //     const ListResult = document.getElementById('ajax-main2-contents-list-box');
    //     const numResult = document.getElementById('numResult');
    //     const backBtnResult = document.getElementById('backBtnResult');
    //     const nextBtnResult = document.getElementById('nextBtnResult');
    //     const target = document.getElementById('section-inner-section');
    //     $.ajax({
    //         type: "post",
    //         url: "/index/UDPage",
    //         data: {
    //             "qnaPage": qnaPage,
    //             "q": q
    //         },
    //         success: function (res) {
    //             let outPut = "";
    //             let numPut = "";
    //             let downPut = "";
    //             downPut += '<a class="QnA-back-bnt-on" style="cursor: pointer;" onclick="main2ListNBBtn(' + (res.qnaBoardPage.page - 1) + ',' + res.qnaBoardPage.q + ')">이전</a>';
    //             let upPut = "";
    //             upPut += '<a class="QnA-next-bnt-on" style="cursor: pointer;" onclick="main2ListNBBtn(' + (res.qnaBoardPage.page + 1) + ',' + res.qnaBoardPage.q + ')">다음</a>';
    //             for (let i in res.qnaBoardDTOList) {
    //                 outPut += '<div class="main2-contents-list-box">';
    //                 outPut += '<div class="main2-contents-list-inner">';
    //                 outPut += '<div class="main2-contents-list-item">';
    //                 outPut += '<a href="/board/detail?BoardId=' + res.qnaBoardDTOList[i].id + '" target="_blank" class="main2-contents-item">';
    //                 outPut += '<span class="power_grade" title="내공 전시장">';
    //                 outPut += '500';
    //                 outPut += '</span>';
    //                 outPut += '<span class="main2-item-title">' + res.qnaBoardDTOList[i].boardTitle + '</span>';
    //                 outPut += '<p class="main2-item-contents">' + res.qnaBoardDTOList[i].boardContents + '</p>';
    //                 outPut += '</a>';
    //                 outPut += '</div>';
    //                 outPut += '<div class="main2-item-info">';
    //                 outPut += '<span class="item-info-answer">답변 ' + res.qnaBoardDTOList[i].boardAnswer + '</span>';
    //                 outPut += '<span class="item-info-type">없음</span>';
    //                 outPut += '<span class="item-info-time">' + moment(res.qnaBoardDTOList[i].boardCreatedDate).format("YYYY-MM-DD HH:mm:ss") + '</span>';
    //                 outPut += '</div>';
    //                 outPut += '</div>';
    //                 outPut += '</div>';
    //             }
    //             for (let i = res.qnaBoardPage.startPage; i <= res.qnaBoardPage.endPage; i++) {
    //                 if (res.qnaBoardPage.page == i) {
    //                     numPut += '<a class="QnA-paging-bnt-off">' + i + '</a>';
    //                 } else {
    //                     numPut += '<a class="QnA-paging-bnt-on" style="cursor: pointer;" onclick="main2ListNBBtn(' + i + ',' + res.qnaBoardPage.q + ')">' + i + '</a>';
    //                 }
    //             }
    //             if (res.qnaBoardPage.page <= 1) {
    //                 backBtnResult.innerHTML = "";
    //             } else {
    //                 backBtnResult.innerHTML = downPut;
    //             }
    //             if (res.qnaBoardPage.page == res.qnaBoardPage.maxPage) {
    //                 nextBtnResult.innerHTML = "";
    //             } else if (res.qnaBoardPage.page != res.qnaBoardPage.maxPage) {
    //                 nextBtnResult.innerHTML = upPut;
    //             }
    //             numResult.innerHTML = numPut;
    //             ListResult.innerHTML = outPut;
    //         },
    //         error: function () {
    //             console.log("실패");
    //         }
    //     })
    //     target.scrollIntoView({ behavior: 'auto' });
    // }
</script>
</html>
