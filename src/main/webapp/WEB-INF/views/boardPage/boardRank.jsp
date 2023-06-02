<%--
  Created by IntelliJ IDEA.
  User: 이호섭
  Date: 2023-06-01
  Time: 오전 3:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>boardRank</title>
    <link rel="stylesheet" href="/resources/css/component.css">
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>
<section style="min-height: 700px;">
    <div class="ranking-container">
        <div class="ranking-container-sef">
            <div class="ranking-container-sef-inner">
                <h3 class="blind">명예의전당 영역</h3>
                <div class="ranking-logo-container">
                    <div>
                        <div class="ranking-container-logo-menu">
                            <div class="logo-menu-list">
                                <span class="ranking-item">
                                    <a href="#" class="rankgin-link-title">
                                        <span class="ranking-link-title-tag">채택왕</span>
                                    </a>
                                </span>
                            </div>
                        </div>
                        <div class="ranking-info">
                            <h3 class="tit">
                                <span class="tit_adoption">채택왕</span>
                            </h3>
                            <p class="desc-ellipsis">지식iN 채택왕은 누구일까?</p>
                        </div>
                        <div class="ranking-cover" style="background-color: #9d9d9d;">
                        </div>
                        <span class="bg_transparent"></span>
                    </div>
                </div>
                <div>
                    <h5 class="blind">연도별 채택왕 프로필</h5>
                    <div class="article_list">


                        <ul class="article-top-list">
                            <c:forEach items="${memberDTOList}" var="memberDTO" end="0">
                                <c:if test="${memberDTO.memberPoint > 10}">
                                    <li class="article-top-list-member">
                                        <div class="article-top-list-member-item1">
                                            <a href="#" class="top-user-inner-info">
                                                <span class="user-info-rank"><em>1</em></span>
                                                <div class="thmb_profile">
                                                    <div class="thmb">
                                                        <img src="https://kin-phinf.pstatic.net/20221003_85/16647839766431JNV4_PNG/%BD%BA%C5%A9%B8%B0%BC%A6_2022-10-03_%BF%C0%C8%C4_4.59.01.png?type=w200"
                                                             class="thmb-user-img" alt="프로필이미지">
                                                        <span class="thmb-rank-mask1"></span>
                                                    </div>
                                                </div>
                                                <div class="ranking-user-list-body">
                                                    <div class="writer-sec">
                                                            <span class="writer-no-badge"><em
                                                                    class="tag-ellipsis">${memberDTO.memberEmail}</em></span>
                                                    </div>
                                                    <p class="user-desc-ellipsis">날먹의 신</p>
                                                    <div class="ranking-user-memorial">
                                                        <p class="ranking-user-memorial-item">
                                                            <strong class="ranking-user-category_title">분야</strong>
                                                            <span class="ranking-user-category-category_content">
                                                        <span class="ranking-user-category-ellipsis">개꿀</span>
                                                    </span>
                                                        </p>
                                                        <p class="ranking-user-memorial-item">
                                                            <strong class="ranking-user-category_title">내공</strong>
                                                            <span class="ranking-user-category-category_content">
                                                        <span class="ranking-user-category-ellipsis">${memberDTO.memberPoint}</span>
                                                    </span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${memberDTOList}" var="memberDTO" begin="1" end="1">
                                <c:if test="${memberDTO.memberPoint > 10}">
                                    <li class="article-top-list-member">
                                        <div class="article-top-list-member-item1">
                                            <a href="#" class="top-user-inner-info">
                                                <span class="user-info-rank"><em>2</em></span>
                                                <div class="thmb_profile">
                                                    <div class="thmb">
                                                        <img src="https://kin-phinf.pstatic.net/20221003_85/16647839766431JNV4_PNG/%BD%BA%C5%A9%B8%B0%BC%A6_2022-10-03_%BF%C0%C8%C4_4.59.01.png?type=w200"
                                                             class="thmb-user-img" alt="프로필이미지">
                                                        <span class="thmb-rank-mask2"></span>
                                                    </div>
                                                </div>
                                                <div class="ranking-user-list-body">
                                                    <div class="writer-sec">
                                                            <span class="writer-no-badge"><em
                                                                    class="tag-ellipsis">${memberDTO.memberEmail}</em></span>
                                                    </div>
                                                    <p class="user-desc-ellipsis">냠냠의 신</p>
                                                    <div class="ranking-user-memorial">
                                                        <p class="ranking-user-memorial-item">
                                                            <strong class="ranking-user-category_title">분야</strong>
                                                            <span class="ranking-user-category-category_content">
                                                        <span class="ranking-user-category-ellipsis">농락</span>
                                                    </span>
                                                        </p>
                                                        <p class="ranking-user-memorial-item">
                                                            <strong class="ranking-user-category_title">내공</strong>
                                                            <span class="ranking-user-category-category_content">
                                                        <span class="ranking-user-category-ellipsis">${memberDTO.memberPoint}</span>
                                                    </span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${memberDTOList}" var="memberDTO" begin="2" end="2">
                                <c:if test="${memberDTO.memberPoint > 10}">
                                    <li class="article-top-list-member">
                                        <div class="article-top-list-member-item1">
                                            <a href="#" class="top-user-inner-info">
                                                <span class="user-info-rank"><em>3</em></span>
                                                <div class="thmb_profile">
                                                    <div class="thmb">
                                                        <img src="https://kin-phinf.pstatic.net/20221003_85/16647839766431JNV4_PNG/%BD%BA%C5%A9%B8%B0%BC%A6_2022-10-03_%BF%C0%C8%C4_4.59.01.png?type=w200"
                                                             class="thmb-user-img" alt="프로필이미지">
                                                        <span class="thmb-rank-mask3"></span>
                                                    </div>
                                                </div>
                                                <div class="ranking-user-list-body">
                                                    <div class="writer-sec">
                                                <span class="writer-no-badge"><em
                                                        class="tag-ellipsis">${memberDTO.memberEmail}</em></span>
                                                    </div>
                                                    <p class="user-desc-ellipsis">낚시의 신</p>
                                                    <div class="ranking-user-memorial">
                                                        <p class="ranking-user-memorial-item">
                                                            <strong class="ranking-user-category_title">분야</strong>
                                                            <span class="ranking-user-category-category_content">
                                                        <span class="ranking-user-category-ellipsis">구라</span>
                                                    </span>
                                                        </p>
                                                        <p class="ranking-user-memorial-item">
                                                            <strong class="ranking-user-category_title">내공</strong>
                                                            <span class="ranking-user-category-category_content">
                                                        <span class="ranking-user-category-ellipsis">${memberDTO.memberPoint}</span>
                                                    </span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="article_list">
                        <ul class="lowListArea">
                            <c:forEach items="${memberDTOList}" var="memberDTO" begin="3">
                                <c:if test="${memberDTO.memberPoint > 10}">
                                    <li class="article-low-list-member">
                                        <div class="article-top-list-member-item1">
                                            <a href="#" class="top-user-inner-info">
                                                <span class="user-info-Lowrank"><em>4</em></span>
                                                <div class="thmb_profile" style="padding-top: 20px;">
                                                    <div class="low-thmb">
                                                        <img src="https://kin-phinf.pstatic.net/20221003_85/16647839766431JNV4_PNG/%BD%BA%C5%A9%B8%B0%BC%A6_2022-10-03_%BF%C0%C8%C4_4.59.01.png?type=w200"
                                                             class="thmb-Lowuser-img" alt="프로필이미지">
                                                        <span class="thmb-Lowrank-mask"></span>
                                                    </div>
                                                </div>
                                                <div class="ranking-user-list-body">
                                                    <div class="writer-sec">
                                                <span class="writer-no-badge"><em
                                                        class="tag-ellipsis">${memberDTO.memberEmail}</em></span>
                                                    </div>
                                                    <p class="user-desc-ellipsis">내공 냠냠</p>
                                                    <div class="ranking-user-memorial">
                                                        <p class="ranking-user-memorial-item">
                                                            <strong class="ranking-user-category_title">분야</strong>
                                                            <span class="ranking-user-category-category_content">
                                                        <span class="ranking-user-category-ellipsis">낚시</span>
                                                    </span>
                                                        </p>
                                                        <p class="ranking-user-memorial-item">
                                                            <strong class="ranking-user-category_title">내공</strong>
                                                            <span class="ranking-user-category-category_content">
                                                        <span class="ranking-user-category-ellipsis">${memberDTO.memberPoint}</span>
                                                    </span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
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
</html>
