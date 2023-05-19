<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-18
  Time: 오후 4:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>memberSave</title>
    <link rel="stylesheet" href="/resources/css/save.css">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
<header>
    <div style="padding: 60px 0 20px;">
        <h1>
            <a href="http://www.naver.com" id="save-logo-link">
                <span class="blind">NAVER</span>
            </a>
        </h1>
    </div>
</header>
<section>
    <form action="/member/save" method="post" onsubmit="return save_check()">
        <div id="save-container">
            <div id="save-container-contents">
                <div> <!-- 가입폼 전체 -->
                    <div class="contents-group"><!--이메일 , 비밀번호1,2-->
                        <div id="group-id"><!--이메일 css 없음-->
                            <h3 class="join-title">
                                <label for="memberEmail">아이디</label>
                            </h3>
                            <span class="ps_box" style="background: #fff;outline: 0;">
                                <input type="text" id="memberEmail" name="memberEmail" class="save-input"
                                       maxlength="20" onblur="email_check()">
                                <span id="Email-domain">@naver.com</span>
                            </span>
                            <span class="err-box" id="emailResult"></span>
                        </div>
                        <div id="group-pw"><!--비밀번호 1차 2차 css 없음-->
                            <h3 class="join-title">
                                <label for="memberPassword">비밀번호</label>
                            </h3>
                            <span class="ps_box pswd1Img" id="pswd1Img">
							    <input type="password" id="memberPassword" name="memberPassword" class="save-input"
                                       onblur="pass_check()">
                                <span class="lbl">
                                    <span id="pswd1Span" class="step_txt"></span>
                                </span>
						    </span>
                            <span class="err-box" id="passResult"></span>
                            <h3 class="join-title">
                                <label for="memberPassword1">비밀번호 재확인</label>
                            </h3>
                            <span class="ps_box pswd2Img" id="pswd2Img">
							    <input type="password" id="memberPassword1" name="memberPassword1" class="save-input" onblur="pass1_check()">
						    </span>
                            <span class="err-box" id="passResult1" style="margin: 9px 0 0;"></span>
                        </div>
                    </div>
                    <div class="contents-group"><!--이름 , 생년 , 성별-->
                        <div id="group-name"><!--이름 css 없음-->
                            <h3 class="join-title">
                                <label for="memberName">이름</label>
                            </h3>
                            <span class="ps_box box_right_space">
							    <input type="text" id="memberName" name="memberName" class="save-input" onblur="name_check()">
						    </span>
                            <span class="err-box" id="nameResult"></span>
                        </div>
                        <div id="group-birthday"> <!--생일 css 없음-->
                            <h3 class="join-title">
                                <label for="yy">생년월일</label>
                            </h3>
                            <div id="birthday-box">
                                <div class="bir_yy">
								<span class="ps_box" style="padding: 11px 14px;">
									<input type="text" id="yy" name="memberBiryy" placeholder="년(4자)" class="save-input"
                                           maxlength="4" onblur="bir_check()">
								</span>
                                </div>
                                <div class="bir_mm">
								<span class="ps_box" style="padding: 11px 14px;">
									<select id="mm" name="memberBirmm" class="sel" onblur="bir_check()">
										<option value="">월</option>
										  	 			<option value="01">
                                                            1
                                                        </option>
										  	 			<option value="02">
                                                            2
                                                        </option>
										  	 			<option value="03">
                                                            3
                                                        </option>
										  	 			<option value="04">
                                                            4
                                                        </option>
										  	 			<option value="05">
                                                            5
                                                        </option>
										  	 			<option value="06">
                                                            6
                                                        </option>
										  	 			<option value="07">
                                                            7
                                                        </option>
										  	 			<option value="08">
                                                            8
                                                        </option>
										  	 			<option value="09">
                                                            9
                                                        </option>
										  	 			<option value="10">
                                                            10
                                                        </option>
										  	 			<option value="11">
                                                            11
                                                        </option>
										  	 			<option value="12">
                                                            12
                                                        </option>
									</select>
								</span>
                                </div>
                                <div class="bir_dd">
								<span class="ps_box" style="padding: 11px 14px;">
									<input type="text" id="dd" name="memberBirdd" placeholder="일" class="save-input"
                                           maxlength="2" onblur="bir_check()">
									<label for="dd" class="lbl"></label>
								</span>
                                </div>
                            </div>
                            <span class="err-box" id="birResult"></span>
                        </div>
                        <div id="group-gender"> <!-- 성별 css x -->
                            <h3 class="join-title">
                                <label for="memberGender">성별</label>
                            </h3>
                            <div class="ps_box gender_code">
                                <select id="memberGender" name="memberGender" class="sel">
                                    <option value="" selected="">성별</option>
                                    <option value="M">남자</option>
                                    <option value="F">여자</option>
                                    <option value="U">선택 안함</option>
                                </select>
                            </div>
                        </div>
                        <span class="err-box" id="genderResult" style="margin: 9px 0 0;"></span>
                    </div>
                    <div style="margin: 30px 0 9px;">
                        <button type="submit" id="save-button"><span>가입하기</span></button>
                    </div>
                </div>
            </div>
        </div>
    </form>
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
    const memberEmail = document.getElementById('memberEmail');
    const emailResult = document.getElementById('emailResult');
    const memberPassword = document.getElementById('memberPassword');
    const passResult = document.getElementById('passResult');
    const memberPassword1 = document.getElementById('memberPassword1');
    const passResult1 = document.getElementById('passResult1');
    const memberName = document.getElementById('memberName');
    const nameResult = document.getElementById('nameResult');
    const memberBiryy = document.getElementById('yy');
    const memberBirmm = document.getElementById('mm');
    const memberBirdd = document.getElementById('dd');
    const birResult = document.getElementById('birResult');
    const memberGender = document.getElementById('memberGender');
    const genderResult = document.getElementById('genderResult');

    const save_check = () => {
        if (!(email_check())) {
            memberEmail.focus();
            return false;
        } else if(!(pass_check())){
            memberPassword.focus();
            return false;
        } else if(!(pass1_check())){
            memberPassword1.focus();
            return false;
        } else if(!(name_check())){
            memberName.focus();
            return false;
        } else if(!(bir_check())){
            if(memberBiryy.value.length < 4) {
                memberBiryy.focus();
                return false;
            }else if(memberBirmm.value == ""){
                memberBirmm.focus();
                return false;
            }else if(memberBirdd.value.length < 2) {
                memberBirdd.focus();
                return false;
            }
        } else if(!(gender_check())){
            memberGender.focus();
            return false;
        }else {
            return true;
        }
    }

    const email_check = () => {
        const exp = /^[a-z0-9_-]{5,20}$/;
        $.ajax({
            type: "post",
            url: "/member/emailcheck",
            data: {
                "memberEmail": memberEmail.value
            },
            success: function () {
                if (memberEmail.value.length = 0) {
                    emailResult.style.color = "red";
                    emailResult.innerHTML = "필수 정보입니다.";
                    checkResult = false;
                } else if (!(memberEmail.value.match(exp))) {
                    emailResult.style.color = "red";
                    emailResult.innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
                    checkResult = false;
                } else {
                    emailResult.style.color = "green";
                    emailResult.innerHTML = "멋진 아이디네요!";
                    checkResult = true;
                }
            },
            error: function () {
                emailResult.style.color = "red";
                emailResult.innerHTML = "이미 사용중이거나 탈퇴한 아이디입니다.";
                checkResult = false;
            }
        })
        return checkResult;
    }
    const pass_check = () => {
        const exp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&+=!])(?!.*\s).{8,16}$/
        const pswd1Span = document.getElementById('pswd1Span');
        if (memberPassword.value.length == 0) {
            passResult.style.color = "red";
            pswd1Span.style.color = "red";
            $('#pswd1Img').removeClass('ps_box pswd1Img');
            $('#pswd1Img').removeClass('ps_box pswd1Img-2');
            $('#pswd1Img').addClass('ps_box pswd1Img-1');
            pswd1Span.innerHTML = "사용불가";
            passResult.innerHTML = "필수 정보입니다.";
            return false;
        } else if(!(memberPassword.value.match(exp))) {
            passResult.style.color = "red";
            pswd1Span.style.color = "red";
            $('#pswd1Img').removeClass('ps_box pswd1Img');
            $('#pswd1Img').removeClass('ps_box pswd1Img-2');
            $('#pswd1Img').addClass('ps_box pswd1Img-1');
            pswd1Span.innerHTML = "사용불가";
            passResult.innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
            return false;
        } else {
            passResult.style.color = "green";
            pswd1Span.style.color = "green";
            $('#pswd1Img').removeClass('ps_box pswd1Img');
            $('#pswd1Img').removeClass('ps_box pswd1Img-1');
            $('#pswd1Img').addClass('ps_box pswd1Img-2');
            pswd1Span.innerHTML = "안전";
            passResult.innerHTML = "";
            return true;
        }
    }
    const pass1_check = () => {
      if(memberPassword1.value.length == 0){
          $('#pswd2Img').removeClass('ps_box pswd2Img-1');
          $('#pswd2Img').addClass('ps_box pswd2Img');
          passResult1.style.color = "red";
          passResult1.innerHTML = "필수 정보입니다.";
          return false;
      } else if(memberPassword.value != memberPassword1.value) {
          $('#pswd2Img').removeClass('ps_box pswd2Img-1');
          $('#pswd2Img').addClass('ps_box pswd2Img');
          passResult1.style.color = "red";
          passResult1.innerHTML = "비밀번호가 일치하지 않습니다.";
          return false;
      } else {
          $('#pswd2Img').removeClass('ps_box pswd2Img');
          $('#pswd2Img').addClass('ps_box pswd2Img-1');
          passResult1.innerHTML = "";
          return true;
      }
    }
    const name_check = () => {
        if(memberName.value.length == 0){
            nameResult.style.color = "red";
            nameResult.innerHTML = "필수 정보입니다.";
            return false;
        } else {
            nameResult.style.color = "green";
            nameResult.innerHTML = "";
            return true;
        }
    }
    const bir_check = () => {
        if(memberBiryy.value.length < 4) {
            birResult.style.color = "red";
            birResult.innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
            return false;
        } else if(memberBirmm.value == ""){
            birResult.style.color = "red";
            birResult.innerHTML = "태어난 월을 선택하세요.";
            return false;
        } else if (memberBirdd.value.length < 2){
            birResult.style.color = "red";
            birResult.innerHTML = "태어난 일(날짜) 2자리를 정확하게 입력하세요.";
            return false;
        } else {
            birResult.style.color = "green";
            birResult.innerHTML = "";
            return true;
        }
    }
    const gender_check = () => {
        if(memberGender.value == ""){
            genderResult.style.color = "red";
            genderResult.innerHTML = "필수 정보입니다.";
            return false;
        } else {
            genderResult.style.color = "green";
            genderResult.innerHTML = "";
            return true;
        }
    }

</script>
</html>
