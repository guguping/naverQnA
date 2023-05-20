<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <div class="header-box">
        <span><a href="/" id="header-logo">NAVER</a></span>
        <h2 style="display: inline"><a href="#" id="header-logo2">지식iN</a></h2>
        <div id="header-search-div">
            <input type="text" id="header-search">
            <a href="#" id="search-Query" onclick="fun1()">
                <span id="search-icon">지식iN 검색</span>
            </a>
        </div>
        <c:choose>
            <c:when test="${sessionScope.memberId != null}">
                <div style="position: relative;display: inline;" class="gnb_common_area">
                    <div id="header-myPage-box">
                        <a href="#" style="position: relative;text-decoration: none;color: black;" id="test1">
                            <img id="header-myPage-img" src="https://ssl.pstatic.net/static/common/myarea/myInfo.gif"
                                 alt="내 프로필 이미지" style="display: inline-block;">
                            <span class="filter_mask" style="display: inline-block;"></span>
                            <span id="header-myPage-name" style="display: inline;">${memberDTO.memberEmail}</span>
                            <em class="blind">내정보 보기</em>
                        </a>
                        <!--레이아웃-->
                        <div class="additional-layout" id="test2"
                             style="position: absolute; top: 100%; left: 0; background-color: #f1f1f1; padding: 10px;display: none">
                            <div class="gnb_my_content">
                                <div class="gnb_img_area"><span class="gnb_mask"></span><img
                                        src="https://ssl.pstatic.net/static/common/myarea/myInfo.gif"
                                        width="80" height="80" alt="프로필 이미지"><a
                                        href="https://nid.naver.com/user2/api/naverProfile?m=checkIdType"
                                        class="gnb_change"><span
                                        class="blind">프로필 사진 변경</span></a></div>
                                <div class="gnb_txt_area"><p class="gnb_account"><span class="gnb_name"
                                                                                       id="gnb_name2"><a
                                        class="gnb_nick"
                                        href="https://nid.naver.com/user2/api/naverProfile?m=checkIdType">qkf</a>님</span><a
                                        class="gnb_btn_login"
                                        href="https://nid.naver.com/nidlogin.logout?returl=https%3A%2F%2Fnid.naver.com%2Fnidlogin.logout"
                                        id="gnb_logout_button"><span class="gnb_bg"></span><span class="gnb_bdr"></span><span
                                        class="gnb_txt">로그아웃</span></a>
                                </p><a href="https://mail.naver.com" class="gnb_mail_address">qkfhandur@naver.com</a>
                                </div>
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
</header>
<script>
    window.onload = function () {
        const test1 = document.getElementById('test1');
        const test2 = document.getElementById('test2');
        test1.addEventListener("click", function () {
            if (test2.style.display === "block") {
                test2.style.display = "none";
            } else {
                test2.style.display = "block";
            }
        })
    }
</script>