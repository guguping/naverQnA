<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-24
  Time: 오후 3:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>BoardDetail</title>
    <link rel="stylesheet" href="/resources/css/component.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="//cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>
<section style="position: relative;margin: 0 auto;">
    <div style="box-sizing: unset;">
        <div>
            <div class="detail-contents-box">
                <h3 class="blind">나는야 디테일</h3>
                <div class="detail-contents-box-inner">
                    <div class="detail-contents-item-box">
                        <div class="detail-contents-item-inner">
                            <div class="detail-item-icon">
                                <i class="icon">Q</i>
                            </div>
                            <div class="detail-item-title">
                                <div class="detail-item-title-inner">
                                    <div class="detail-title">
                                        ${BoardDTO.boardTitle}
                                    </div>
                                </div>
                            </div>
                            <div class="detail-item-contents">
                                ${BoardDTO.boardContents}
                            </div>
                        </div>
                        <div class="detail-contents-user-info">
                            <div class="contents-user-info-left">
                                <div class="contents-user-info-item">
                                    <div class="contents-user-info-default">
                                        <div class="contents-user-info-default-inner">
                                            <span class="contents-user-info-default-item"></span>
                                        </div>
                                    </div>
                                    <span class="contents-user-info-name">${BoardDTO.boardWriter}</span>
                                </div>
                                <span class="contents-user-info-time">
                                    <fmt:formatDate
                                            value="${BoardDTO.boardCreatedDate}"
                                            pattern="yyyy-MM-dd"></fmt:formatDate>
                                </span>
                                <span class="contents-user-info-time">
                                    조회수 ${BoardDTO.boardHits}
                                </span>
                            </div>
                            <div class="contents-user-info-right">
                                <button type="button" class="detail-contents-comment-btn">
                                    <i class="bi bi-chat-square-dots" id="openComment"></i>
                                </button>
                                <em class="detail-contents-comment-count"
                                    id="detail-contents-comment-count">${CommentCount}</em>
                            </div>
                        </div>
                        <div id="detail-contents-comment-area" class="detail-contents-comment-area"
                             style="display:none;">
                            <h2 class="blind">댓글 입력공간</h2>
                            <div class="detail-contents-comment-box">
                                <fieldset style="border: 0;">
                                    <div class="detail-contents-comment-inner">
                                        <c:choose>
                                            <c:when test="${memberDTO != null}">
                                                <textarea class="detail-contents-comment-textarea" maxlength="1000"
                                                          id="detail-contents-comment-textarea"
                                                          placeholder="개인정보를 공유 및 요청하거나, 명예 훼손, 무단 광고, 불법 정보 유포시 모니터링 후 삭제될 수 있으며, 이에 대한 민형사상 책임은 게시자에게 있습니다."></textarea>
                                            </c:when>
                                            <c:otherwise>
                                                <textarea class="detail-contents-comment-textarea" maxlength="1000"
                                                          id="detail-contents-comment-textarea"
                                                          placeholder="개인정보를 공유 및 요청하거나, 명예 훼손, 무단 광고, 불법 정보 유포시 모니터링 후 삭제될 수 있으며, 이에 대한 민형사상 책임은 게시자에게 있습니다."
                                                          onclick="plzLogin()"></textarea>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="detail-contents-comment-textarea-bottom">
                                        <c:choose>
                                            <c:when test="${sessionScope.memberId != null}">
                                                <button type="button" class="detail-contents-comment-textarea-btn"
                                                        id="bestbtn" style="cursor: pointer;"
                                                        onclick="commentSave(${BoardDTO.id},${BoardDTO.memberId})">
                                                    등록
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="button" class="detail-contents-comment-textarea-btn"
                                                        id="notlogin" style="cursor: pointer;"
                                                        onclick="plzLogin()">등록
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </fieldset>
                            </div>
                            <span class="detail-contents-comment-list-box" id="detail-contents-comment-list-box">
                                <c:forEach items="${CommentList}" var="CommentList">
                                    <div class="detail-contents-comment-list">
                                        <p class="detail-contents-comment-title">
                                            <c:choose>
                                                <c:when test="${CommentList.memberId == BoardDTO.memberId}">
                                                    <strong>질문 작성자</strong>
                                                </c:when>
                                                <c:otherwise>
                                                    <strong>${CommentList.commentWriter}</strong>
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                        <div class="detail-contents-comment-text">
                                                ${CommentList.commentContents}
                                        </div>
                                        <p class="detail-contents-comment-time">
                                            <fmt:formatDate
                                                    value="${CommentList.commentCreatedDate}"
                                                    pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                        </p>
                                    </div>
                                </c:forEach>
                            </span>
                            <div class="detail-contents-comment-paging">
                                    <span id="detail-contents-comment-paging-bbtn-on">
                                    </span>
                                <div style="display: inline-block;" id="numResult">
                                    <c:forEach begin="${CommentPaging.startPage}" end="${CommentPaging.endPage}" var="i"
                                               step="1">
                                        <c:choose>
                                            <c:when test="${i eq CommentPaging.page}">
                                                <a class="detail-contents-comment-paging-btn-off">${i}</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a onclick="commentNBBtn(${BoardDTO.id},${BoardDTO.memberId},${i})"
                                                   class="detail-contents-comment-paging-btn-on"
                                                   style="cursor: pointer">${i}</a>
                                            </c:otherwise>
                                        </c:choose>
                                        <%--href="/board/detail?BoardId=${BoardDTO.id}&DetailPage=${i}"--%>
                                    </c:forEach>
                                </div>
                                <span id="detail-contents-comment-paging-nbtn-on">
                                <c:choose>
                                    <c:when test="${CommentPaging.maxPage <= 1}">

                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${CommentPaging.page != CommentPaging.maxPage}">

                                        <a class="detail-contents-comment-paging-nbtn-on"
                                           onclick="commentNBBtn(${BoardDTO.id},${BoardDTO.memberId},${CommentPaging.page+1})"
                                           style="cursor: pointer;">
                                            <span>다음</span>
                                            <i class="comment-next-icon"></i>
                                        </a>

                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                                    </span>
                            </div>
                        </div>
                    </div>
                </div>
                <h2 class="blind">여기서 부터 답글 시작합니다</h2>

                <div id="answerArea" class="answer-content">
                    <div id="answerAreaZero" class="answer-content-inner">
                        <c:choose>
                            <c:when test="${sessionScope.memberId == null}">
                                <div class="answer-content-noLogin-box">
                                    <div id="answerAreaNoLogin" class="answer-content-noLogin-inner">
                                        <div class="answer-content-noLogin-inner-txt-box">
                                            <div class="answer-content-noLogin-inner-txt-item1">
                                                <div class="c-userinfo">
                                                    <span class="c-userinfo__item">답변하시면 내공 10점을 답변이 채택되면 내공 25점을 드립니다.</span>
                                                </div>
                                            </div>
                                            <div class="answer-content-noLogin-inner-txt-item2">
                                                <a href="/member/login" class="c-userinfo__item2"><span
                                                        class="c-button-default__title">답변하기</span></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <h3 class="blind">로그인 답변 시작입니다</h3>
                                <div class="qna_answer_editor">
                                    <div class="ckEditorHeaderArea">
                                        <div class="c-heading-answer--editor-inner">
                                            <div class="c-heading-answer__profile">
                                                <div class="profile-default">
                                                    <a href="#" class="profile-default--inner">
                                                <span class="profile-default__thumbnail">
                                                    <span class="blind">내 프로필 이미지</span>
                                                </span>
                                                    </a>
                                                </div>
                                                <div class="c-heading-answer__body">
                                                    <div class="c-heading-answer__title">
                                                        <p class="user-info-title">qkfh****님, 답변해주세요!</p>
                                                        <div class="c-userinfo">
                                                            <span class="c-userinfo__item">답변하시면 내공 10점을 답변이 채택되면 내공 25점을 드립니다.</span>
                                                        </div>
                                                    </div>
                                                    <div class="answerButtonArea">
                                                        <div class="button-answer__subdivide">
                                                            <a href="#" class="answerRegisterButton">
                                                                <span class="c-button-default__title">답변등록</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="ckEditor-body">
                                        <div class="ckEditor-body-inner">
                                            <div class="ckEditor-size">
                                                <input type="text" id="editor1"
                                                       placeholder="이미지나 링크를 첨부하시고, 상세 모집 내용을 적어주세요.">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

            </div>

            <h3 class="blind">여기서 부터 광고 시작입니다</h3>

            <div class="qna-list-on-footer">
                <div class="personal-data">
                    <div class="personal-data__inner">
                        <div class="detailQnaListTabTitleArea">
                            <div class="c-tab__list">
                                <a href="#" class="reactRankQnaListTabPanel">많이 본 Q&A </a>
                            </div>
                        </div>
                        <div class="detailQnaListTabContentsArea" style="margin-top: 34px;">
                            <div class="detailArticleReactRankListArea">
                                <div class="carousel-slide-inner" style="overflow: hidden;">
                                    <div class="_detailQnaListArea c-qna c-qna-lot">
                                        <h2 class="blind">많이 본 Q&amp;A</h2>
                                        <div class="detailQnaListArea-item-box">
                                            <h3 class="blind">리스트 for문은 a태그로</h3>
                                            <a href="#" target="_blank" class="detailQnaListArea-item">
                                                <div class="c-heading">
                                                    <div class="c-heading__title">
                                                        <div class="c-heading__title-inner">
                                                            <div class="c-heading__number">1</div>
                                                            <div class="c-title">내성발톱 자가치료할수있나요ㅣ</div>
                                                        </div>
                                                    </div>
                                                    <div class="c-heading__content">저도 정말 내성발톱 때문에 정말 오랫동안 고생 무지 했고 안해
                                                        본게 없는데 제일 간단 하면서도 쉬운 방법이 있습니다. 수술도 해보고 일본에서 들어왔다던 테이프도 붙여 봤지만
                                                        얼마지...
                                                    </div>
                                                    <div class="c-qna__userinfo">
                                                        <span class="c-qna__userinfo--item1">조회수 <em
                                                                style="font-style: normal;">1023</em></span>
                                                        <span class="c-qna__userinfo--item2">답변수 <em
                                                                style="font-style: normal;">19</em></span>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" target="_blank" class="detailQnaListArea-item">
                                                <div class="c-heading">
                                                    <div class="c-heading__title">
                                                        <div class="c-heading__title-inner">
                                                            <div class="c-heading__number">1</div>
                                                            <div class="c-title">내성발톱 자가치료할수있나요ㅣ</div>
                                                        </div>
                                                    </div>
                                                    <div class="c-heading__content">저도 정말 내성발톱 때문에 정말 오랫동안 고생 무지 했고 안해
                                                        본게 없는데 제일 간단 하면서도 쉬운 방법이 있습니다. 수술도 해보고 일본에서 들어왔다던 테이프도 붙여 봤지만
                                                        얼마지...
                                                    </div>
                                                    <div class="c-qna__userinfo">
                                                        <span class="c-qna__userinfo--item1">조회수 <em
                                                                style="font-style: normal;">1023</em></span>
                                                        <span class="c-qna__userinfo--item2">답변수 <em
                                                                style="font-style: normal;">19</em></span>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" target="_blank" class="detailQnaListArea-item">
                                                <div class="c-heading">
                                                    <div class="c-heading__title">
                                                        <div class="c-heading__title-inner">
                                                            <div class="c-heading__number">1</div>
                                                            <div class="c-title">내성발톱 자가치료할수있나요ㅣ</div>
                                                        </div>
                                                    </div>
                                                    <div class="c-heading__content">저도 정말 내성발톱 때문에 정말 오랫동안 고생 무지 했고 안해
                                                        본게 없는데 제일 간단 하면서도 쉬운 방법이 있습니다. 수술도 해보고 일본에서 들어왔다던 테이프도 붙여 봤지만
                                                        얼마지...
                                                    </div>
                                                    <div class="c-qna__userinfo">
                                                        <span class="c-qna__userinfo--item1">조회수 <em
                                                                style="font-style: normal;">1023</em></span>
                                                        <span class="c-qna__userinfo--item2">답변수 <em
                                                                style="font-style: normal;">19</em></span>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" target="_blank" class="detailQnaListArea-item">
                                                <div class="c-heading">
                                                    <div class="c-heading__title">
                                                        <div class="c-heading__title-inner">
                                                            <div class="c-heading__number">1</div>
                                                            <div class="c-title">내성발톱 자가치료할수있나요ㅣ</div>
                                                        </div>
                                                    </div>
                                                    <div class="c-heading__content">저도 정말 내성발톱 때문에 정말 오랫동안 고생 무지 했고 안해
                                                        본게 없는데 제일 간단 하면서도 쉬운 방법이 있습니다. 수술도 해보고 일본에서 들어왔다던 테이프도 붙여 봤지만
                                                        얼마지...
                                                    </div>
                                                    <div class="c-qna__userinfo">
                                                        <span class="c-qna__userinfo--item1">조회수 <em
                                                                style="font-style: normal;">1023</em></span>
                                                        <span class="c-qna__userinfo--item2">답변수 <em
                                                                style="font-style: normal;">19</em></span>
                                                    </div>
                                                </div>
                                            </a>
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
<footer style="text-align: center;">
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
    window.onload = function () {
        const openComment = document.getElementById('openComment');
        const commentBox = document.getElementById('detail-contents-comment-area');
        openComment.addEventListener("click", function () {
            if (commentBox.style.display === "block") {
                commentBox.style.display = "none";
            } else {
                commentBox.style.display = "block";
            }
        })
        const layoutController = document.getElementById('layout-controller');
        const layoutBox = document.getElementById('layout-box');
        layoutController.addEventListener("click", function () {
            if (layoutBox.style.display === "block") {
                layoutBox.style.display = "none";
            } else {
                layoutBox.style.display = "block";
            }
        })
    }
    CKEDITOR.replace('editor1', {
        height: '400px',
        language: 'ko',
        editorplaceholder: 'Type your comment…',
        enterMode: CKEDITOR.ENTER_BR
    });

    const commentSave = (boardid, boardMemberid) => {
        const commentWriter = '${memberDTO.memberEmail}';
        const commentContents = document.getElementById('detail-contents-comment-textarea').value;
        const boardId = boardid;
        const memberId = '${sessionScope.memberId}';
        const commentResult = document.getElementById('detail-contents-comment-list-box');
        const boardMemberId = boardMemberid;
        const countResult = document.getElementById('detail-contents-comment-count');
        const commentPageDResult = document.getElementById('detail-contents-comment-paging-bbtn-on');
        const commentPageUResult = document.getElementById('detail-contents-comment-paging-nbtn-on');
        const commentNumPageOn = document.getElementById('numResult');
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                "commentWriter": commentWriter,
                "commentContents": commentContents,
                "boardId": boardId,
                "memberId": memberId
            },
            success: function (res) {
                let output = "";
                let commentCount = res.count;
                let downPut = "";
                downPut += '<a class="detail-contents-comment-paging-bbtn-on" onclick="commentNBBtn(' + res.boardDTO.id + ',' + res.boardDTO.memberId + ',' + (res.DetailCommentPage.page - 1) + ')" style="cursor: pointer;">' +
                    '<i class="comment-back-icon"></i>' + '<span> 이전</span>' + '</a>';
                let upPut = "";
                upPut += '<a class="detail-contents-comment-paging-nbtn-on" onclick="commentNBBtn(' + res.boardDTO.id + ',' + res.boardDTO.memberId + ',' + (res.DetailCommentPage.page + 1) + ')" style="cursor: pointer;">' + '<span>다음 </span>' + '<i class="comment-next-icon"></i>' + '</a>';
                let numPut = "";
                for (let i in res.comments) {
                    output += '<div class="detail-contents-comment-list">';
                    output += '<p class="detail-contents-comment-title">';
                    if (res.comments[i].memberId == boardMemberId) {
                        output += '<strong>질문 작성자</strong>';
                    } else {
                        output += '<strong>' + res.comments[i].commentWriter + '</strong>';
                    }
                    output += '</p>';
                    output += '<div class="detail-contents-comment-text">';
                    output += '<p>' + res.comments[i].commentContents + '</p>';
                    output += '</div>';
                    output += '<p class="detail-contents-comment-time">'
                    output += moment(res.comments[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss");
                    output += '</p>';
                    output += '</div>';
                }
                for (let i = res.DetailCommentPage.startPage; i <= res.DetailCommentPage.endPage; i++) {
                    if (res.DetailCommentPage.page == i) {
                        numPut += '<a class="detail-contents-comment-paging-btn-off">' + i + '</a>';
                    } else {
                        numPut += '<a onclick="commentNBBtn(' + res.boardDTO.id + ',' + res.boardDTO.memberId + ',' + i + ')" class="detail-contents-comment-paging-btn-on" style="cursor: pointer">' + i + '</a>';
                    }
                }
                if (res.DetailCommentPage.page <= 1) {
                    commentPageDResult.innerHTML = "";
                } else if (res.DetailCommentPage.page > res.DetailCommentPage.startPage) {
                    commentPageDResult.innerHTML = downPut;
                }

                if (res.DetailCommentPage.page == res.DetailCommentPage.maxPage) {
                    commentPageUResult.innerHTML = "";
                } else {
                    commentPageUResult.innerHTML = upPut;
                }
                commentNumPageOn.innerHTML = numPut;
                countResult.innerHTML = commentCount;
                commentResult.innerHTML = output;
                document.getElementById('detail-contents-comment-textarea').value = "";
            },
            error: function () {
                console.log("실패");
            }
        })
    }
    const plzLogin = () => {
        if (confirm("로그인 후 이용하실 수 있습니다.")) {
            location.href = "/member/login";
        }
    }
    const commentNBBtn = (boardid, boardMemberid, CommentPagingPage) => {
        const DetailPage = CommentPagingPage;
        const boardId = boardid;
        const boardMemberId = boardMemberid;
        const commentResult = document.getElementById('detail-contents-comment-list-box');
        const commentPageDResult = document.getElementById('detail-contents-comment-paging-bbtn-on');
        const commentPageUResult = document.getElementById('detail-contents-comment-paging-nbtn-on');
        const commentNumPageOn = document.getElementById('numResult');
        $.ajax({
                type: "post",
                url: "/comment/UDPage",
                data: {
                    "boardId": boardId,
                    "DetailPage": DetailPage,
                },
                success: function (res) {
                    let output = "";
                    let downPut = "";
                    downPut += '<a class="detail-contents-comment-paging-bbtn-on" onclick="commentNBBtn(' + res.boardDTO.id + ',' + res.boardDTO.memberId + ',' + (res.DetailCommentPage.page - 1) + ')" style="cursor: pointer;">' +
                        '<i class="comment-back-icon"></i>' + '<span> 이전</span>' + '</a>';
                    let upPut = "";
                    upPut += '<a class="detail-contents-comment-paging-nbtn-on" onclick="commentNBBtn(' + res.boardDTO.id + ',' + res.boardDTO.memberId + ',' + (res.DetailCommentPage.page + 1) + ')" style="cursor: pointer;">' + '<span>다음 </span>' + '<i class="comment-next-icon"></i>' + '</a>';
                    let numPut = "";
                    for (let i in res.commentDTOList) {
                        output += '<div class="detail-contents-comment-list">';
                        output += '<p class="detail-contents-comment-title">';
                        if (res.commentDTOList[i].memberId == boardMemberId) {
                            output += '<strong>질문 작성자</strong>';
                        } else {
                            output += '<strong>' + res.commentDTOList[i].commentWriter + '</strong>';
                        }
                        output += '</p>';
                        output += '<div class="detail-contents-comment-text">';
                        output += '<p>' + res.commentDTOList[i].commentContents + '</p>';
                        output += '</div>';
                        output += '<p class="detail-contents-comment-time">'
                        output += moment(res.commentDTOList[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss");
                        output += '</p>';
                        output += '</div>';
                    }
                    for (let i = res.DetailCommentPage.startPage; i <= res.DetailCommentPage.endPage; i++) {
                        if (res.DetailCommentPage.page == i) {
                            numPut += '<a class="detail-contents-comment-paging-btn-off">' + i + '</a>';
                        } else {
                            numPut += '<a onclick="commentNBBtn(' + res.boardDTO.id + ',' + res.boardDTO.memberId + ',' + i + ')" class="detail-contents-comment-paging-btn-on" style="cursor: pointer">' + i + '</a>';
                        }
                    }
                    if (res.DetailCommentPage.page <= 1) {
                        commentPageDResult.innerHTML = "";
                    } else if (res.DetailCommentPage.page > res.DetailCommentPage.startPage) {
                        commentPageDResult.innerHTML = downPut;
                    }


                    if (res.DetailCommentPage.page == res.DetailCommentPage.maxPage) {
                        commentPageUResult.innerHTML = "";
                    } else {
                        commentPageUResult.innerHTML = upPut;
                    }
                    commentNumPageOn.innerHTML = numPut;
                    commentResult.innerHTML = output;
                },
                error: function () {
                    console.log("실패");
                }
            }
        )
    }
</script>
</html>
