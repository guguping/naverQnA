<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <div class="header-box">
        <div style="width: 600px;;margin-left: 15px;">
            <span><a href="/" class="header-logo">NAVER</a></span>
            <h2 style="display: inline"><a href="#" id="header-logo2">지식iN</a></h2>
            <div id="header-search-div">
                <form action="#" method="post">
                    <input type="text" name="headerSearch" id="header-search">
                    <span id="search-Query">
                    <input type="submit" id="search-icon">
                        </span>
                </form>
            </div>
            <c:choose>
                <c:when test="${sessionScope.memberId != null}">
                    <div style="position: relative;display: inline;" class="gnb_common_area">
                        <div id="header-myPage-box">
                            <a href="#" style="position: relative;text-decoration: none;color: black;"
                               id="layout-controller">
                                <img id="header-myPage-img"
                                     src="https://ssl.pstatic.net/static/common/myarea/myInfo.gif"
                                     alt="내 프로필 이미지" style="display: inline-block;">
                                <span class="filter_mask" style="display: inline-block;"></span>
                                <span id="header-myPage-name"
                                      style="display: inline-block;">${memberDTO.memberEmail}</span>
                                <em class="blind">내정보 보기</em>
                            </a>
                        </div>
                        <!-- 레이아웃 박스 -->
                        <div class="header-layout-box" id="layout-box">
                            <span class="header-layout-pointer"></span>
                            <div class="header-layout-content">
                                <div class="layout-img-area">
                                    <span class="layout-img-mask"></span>
                                    <img src="https://ssl.pstatic.net/static/common/myarea/myInfo.gif"
                                         width="80" height="80" alt="프로필 이미지">
                                    <a href="#"
                                       class="layout-img-change">
                                        <span class="blind">프로필 사진 변경</span>
                                    </a>
                                </div>
                                <div class="layout-txt-area">
                                    <p class="layout-user-account">
                            <span class="layout-user-name">
                                <a class="layout-user-nick" href="#">${memberDTO.memberEmail}</a>님
                            </span>
                                        <a class="layout-logout" href="/member/logout">
                                            <span class="layout-logout-bg"></span>
                                            <span class="layout-logout-bdr"></span>
                                            <span class="layout-logout-txt">로그아웃</span>
                                        </a>
                                    </p>
                                    <a href="#" class="layout-user-domain">${memberDTO.memberDomain}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div style="display:inline;">
                        <a href="/member/login" id="header-login-link">
                            <samp class="header-login-bdr"></samp>
                            <samp class="header-login-txt">로그인</samp>
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</header>
<script>
    window.onload = function () {
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
</script>