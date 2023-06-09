<%--
  Created by IntelliJ IDEA.
  User: 이호섭
  Date: 2023-05-17
  Time: 오후 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>memberLogin</title>
    <link rel="stylesheet" href="/resources/css/loginform.css">
</head>
<body>
<div id="login-wap">
    <header>
        <div id="login-form-logo">
            <a href="/" id="login-form-logo-link">
                <h1 id="login-form-logo-txt">NAVER</h1>
            </a>
        </div>
    </header>
    <section>
        <div id="login-form-box">
            <ul id="login-form-box-inner">
                <li id="login-form-item">
                    <div id="login-form-inner">
                        <form action="/member/login" method="post" id="login-form-main">
                            <div id="id_line">
                                <div id="id-icon-div">
                                    <samp id="id-icon"></samp>
                                </div>
                                <input type="text" id="id_input" name="memberEmail" placeholder="아이디">
                            </div>
                            <div id="pass_line">
                                <div id="pass-icon-div">
                                    <samp id="pass-icon"></samp>
                                </div>
                                <input type="password" id="pw_input" name="memberPassword" placeholder="비밀번호">
                            </div>
                            <span id="err-box">${loginFalse}</span>
                            <a href="/member/save" id="Go-Save">
                                회원가입
                            </a>
                            <div id="btn-form-inner">
                                <button type="button" id="btn-login" onclick="sub_check()">
                                    <samp id="btn-login-txt"
                                          style="font-size: 20px;font-weight: 700;line-height: 24px;color: white">로그인</samp>
                                </button>
                            </div>
                        </form>
                    </div>
                </li>
            </ul>
            <div style="text-align: center;margin-top: 25px">
                <a href="https://channeltech.naver.com/tech/issue08_3/?pcode=naver_pclogin_AIbusiness_01"
                   target="_blank">
                    <img src="https://ssl.pstatic.net/melona/libs/1378/1378592/a7fdae0576b6db501e84_20230517141955309.jpg"
                         alt="[광고]바로 채널 테크에서 확인하세요 초거대 AI시대, 기업 생존전략"
                         style="vertical-align:top;width:100%;height:auto;border:none;">
                </a>
            </div>
        </div>
    </section>
    <footer style="text-align: center;padding:53px 0 32px;">
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
</div>
</body>
<script>
    const memberEmail = document.getElementById('id_input');
    const memberPass = document.getElementById('pw_input');
    const subResult = document.getElementById('err-box');
    const loginForm = document.getElementById('login-form-main');
    const sub_check = () => {
        if(memberEmail.value.length == 0){
            subResult.innerHTML = "아이디를 입력해 주세요."
        } else if(memberPass.value.length == 0) {
            subResult.innerHTML = "비밀번호를 입력해 주세요."
        } else {
            subResult.innerHTML = "${loginFalse}";
            loginForm.submit();
        }
    }
</script>
</html>
