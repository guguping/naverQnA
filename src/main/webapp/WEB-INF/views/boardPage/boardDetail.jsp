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
                                    <span class="contents-user-info-name">비공개</span>
                                </div>
                                <span class="contents-user-info-time">
                                    2023.02.02
                                </span>
                                <span class="contents-user-info-time">
                                    조회수 ${bestBoardDTO.boardHits}${qnaBoardDTO.boardHits}
                                </span>
                            </div>
                            <div class="contents-user-info-right">
                                <button type="button" class="detail-contents-comment-btn">
                                    <i class="bi bi-chat-square-dots"></i>
                                </button>
                                <em class="detail-contents-comment-count">11</em>
                            </div>
                        </div>
                        <div class="detail-contents-comment-area">
                            <h2 class="blind">댓글 입력공간</h2>
                            <div class="detail-contents-comment-box">
                                <form action="#" method="get">
                                    <fieldset style="border: 0;">
                                        <div class="detail-contents-comment-inner">
                                            <textarea class="detail-contents-comment-textarea" maxlength="1000"
                                                      placeholder="개인정보를 공유 및 요청하거나, 명예 훼손, 무단 광고, 불법 정보 유포시 모니터링 후 삭제될 수 있으며, 이에 대한 민형사상 책임은 게시자에게 있습니다."></textarea>
                                        </div>
                                        <div class="detail-contents-comment-textarea-bottom">
                                            <button type="submit" class="detail-contents-comment-textarea-btn">등록
                                            </button>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                            <div class="detail-contents-comment-list-box">
                                <div class="detail-contents-comment-list">
                                    <p class="detail-contents-comment-title"><strong>질문 작성자</strong></p>
                                    <div class="detail-contents-comment-text">
                                        <p>남자입니다!!<br><br>성별을 안 적어놨었네요,,<br><br>아마 남자 기준으로 답변 해주신 것 같아요</p>
                                    </div>
                                    <p class="detail-contents-comment-time">2023.05.24. 13:05:12</p>
                                </div>
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
</html>
