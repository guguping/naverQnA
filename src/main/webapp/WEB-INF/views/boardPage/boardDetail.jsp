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
                                        ${bestBoardDTO.boardTitle}${qnaBoardDTO.boardTitle}
                                    </div>
                                </div>
                            </div>
                            <div class="detail-item-contents">
                                ${bestBoardDTO.boardContents}${qnaBoardDTO.boardContents}
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
                                    <span class="contents-user-info-name">${bestBoardDTO.boardWriter}${qnaBoardDTO.boardWriter}</span>
                                </div>
                                <span class="contents-user-info-time">
                                    <fmt:formatDate
                                            value="${qnaBoardDTO.boardCreatedDate}"
                                            pattern="yyyy-MM-dd"></fmt:formatDate>
                                    <fmt:formatDate
                                            value="${bestBoardDTO.boardCreatedDate}"
                                            pattern="yyyy-MM-dd"></fmt:formatDate>
                                </span>
                                <span class="contents-user-info-time">
                                    조회수 ${bestBoardDTO.boardHits}${qnaBoardDTO.boardHits}
                                </span>
                            </div>
                            <div class="contents-user-info-right">
                                <button type="button" class="detail-contents-comment-btn">
                                    <i class="bi bi-chat-square-dots" id="openComment"></i>
                                </button>
                                <em class="detail-contents-comment-count"
                                    id="detail-contents-comment-count">${bestCommentCount}${qnaCommentCount}</em>
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
                                                <c:if test="${bestBoardDTO.id != null}">
                                                    <button type="button" class="detail-contents-comment-textarea-btn"
                                                            id="bestbtn" style="cursor: pointer;"
                                                            onclick="commentSave(${bestBoardDTO.id},${bestBoardDTO.memberId},${bestCommentCount})">
                                                        등록
                                                    </button>
                                                </c:if>
                                                <c:if test="${qnaBoardDTO.id != null}">
                                                    <button type="button" class="detail-contents-comment-textarea-btn"
                                                            id="qnabtn" style="cursor: pointer;"
                                                            onclick="commentSave(${qnaBoardDTO.id},${qnaBoardDTO.memberId},${qnaCommentCount})">
                                                        등록
                                                    </button>
                                                </c:if>
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
                            <div class="detail-contents-comment-list-box" id="detail-contents-comment-list-box">
                                <c:choose>
                                    <c:when test="${bestCommentList != null}">
                                        <c:forEach items="${bestCommentList}" var="bestCommentList">
                                            <div class="detail-contents-comment-list">
                                                <p class="detail-contents-comment-title">
                                                    <c:choose>
                                                        <c:when test="${bestCommentList.memberId == bestBoardDTO.memberId}">
                                                            <strong>질문 작성자</strong>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <strong>${bestCommentList.commentWriter}</strong>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                                <div class="detail-contents-comment-text">
                                                        ${bestCommentList.commentContents}
                                                </div>
                                                <p class="detail-contents-comment-time">
                                                    <fmt:formatDate
                                                            value="${bestCommentList.commentCreatedDate}"
                                                            pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                                </p>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${qnaCommentList}" var="qnaCommentList">
                                            <div class="detail-contents-comment-list">
                                                <p class="detail-contents-comment-title">
                                                    <c:choose>
                                                        <c:when test="${qnaCommentList.memberId == qnaBoardDTO.memberId}">
                                                            <strong>질문 작성자</strong>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <strong>${qnaCommentList.commentWriter}</strong>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                                <div class="detail-contents-comment-text">
                                                        ${qnaCommentList.commentContents}
                                                </div>
                                                <p class="detail-contents-comment-time">
                                                    <fmt:formatDate
                                                            value="${qnaCommentList.commentCreatedDate}"
                                                            pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                                </p>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="detail-contents-comment-paging">
                                <a href="#" class="detail-contents-comment-paging-btn-off">1</a>
                                <a href="#" class="detail-contents-comment-paging-btn-on">2</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <h2 class="blind">여기서 부터 답글 시작합니다</h2>
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
    }
    const commentSave = (boardid, boardMemberid, CommentCount) => {
        const commentWriter = '${memberDTO.memberEmail}';
        const commentContents = document.getElementById('detail-contents-comment-textarea').value;
        const boardId = boardid;
        const memberId = '${sessionScope.memberId}';
        const commentResult = document.getElementById('detail-contents-comment-list-box');
        const boardMemberId = boardMemberid;
        const commentCount = CommentCount;
        console.log("CommentCount =" + CommentCount);
        const countResult = document.getElementById('detail-contents-comment-count');
        console.log("boardMemberId =" + boardMemberId);

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
                let upCount = commentCount+1;
                for (let i in res) {
                    output += '<div class="detail-contents-comment-list">';
                    output += '<p class="detail-contents-comment-title">';
                    if (res[i].memberId == boardMemberId) {
                        output += '<strong>질문 작성자</strong>';
                    } else {
                        output += '<strong>' + res[i].commentWriter + '</strong>';
                    }
                    output += '</p>';
                    output += '<div class="detail-contents-comment-text">';
                    output += '<p>' + res[i].commentContents + '</p>';
                    output += '</div>';
                    output += '<p class="detail-contents-comment-time">'
                    output += moment(res[i].commentCreatedDate).format("YYYY-MM-DD HH:mm:ss");
                    output += '</p>';
                    output += '</div>';
                }
                countResult.innerHTML = upCount;
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
</script>
</html>
