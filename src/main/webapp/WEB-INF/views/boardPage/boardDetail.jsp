<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-24
  Time: 오후 3:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                                        헬린이입니다. 헬스 제대로 하고 있나요?
                                    </div>
                                </div>
                            </div>
                            <div class="detail-item-contents">
                                안녕하세요, 현재 10월부터 헬스를 시작한 헬린이입니다.
                                <div>주위에 운동 오래 해온 사람한테 한두달 가량 배우고 현재는 유튜브로 직장인 루틴을 짜서 혼자 하는 중입니다.</div>
                                <div><br></div>
                                <div>하루에 단백질은 최대한 섭취하려고 하는데, 직장인이다보니 그게 쉽지가 않아요 ㅠㅠ.</div>
                                <div>아침에 무조건 밥이랑 닭가슴살 먹고, 점심은 구내식당 일반식 , 오후4시에 고구마 or 바나나 + 프로틴 한스쿱, 퇴근 후 7시 30분 부터 운동
                                    시작해서 유산소까지 끝내면 9시20분 정도 됩니다.&nbsp;
                                </div>
                                <div><br></div>
                                <div>원래 집에 와서 탄수화물과 단백질을 채우기 위해 밥과 닭가슴살을 먹었지만 , 유산소를 병행하지 않아서인지 너무 늦은 시간 (10시)에 먹고 자서
                                    그런지, 체지방이 늘어나는게 보이더라고요,,&nbsp;
                                </div>
                                <div><br></div>
                                <div>현재는 운동 후 바나나 2개와 닭가슴살을 먹고 있습니다.</div>
                                <div><br></div>
                                <div>1. 식단을 저렇게 짜서 수행하는게 맞는건가요? 오후4시에 먹는 탄수화물은 퇴근 후 운동할때 힘을 쓰기 위하여 먹어야 한다고 그래서 먹습니다. 혹시
                                    수정하여야 할 부분이 있을까요?
                                </div>
                                <div><br></div>
                                <div>2. 웨이트 + 인터벌 유산소를 충분히 하였으면 저녁 10시쯤 바나나와 닭가슴살을 먹어도&nbsp;체지방이 감소 될까요? (너무 늦은 시간에 먹는 것
                                    같아서..) 잠은 1시~2시쯤 취침합니다.
                                </div>
                                <div><br></div>
                                <div>3. 제가 초반에는 중량도 낮게하고 자극 위주로 하다가 요새 운동에 대해 깨우치고 하는 중입니다.</div>
                                <div>10월 중순부터 시작하였고 그때와 오늘 인바디 수치를 비교해보니 근골격량이 0.5kg 밖에 늘지 않았더라고요.. 몸무게는 4kg이나 늘었는데.. 주로
                                    한달에 근골격량이 몇kg정도 증가해야 운동을 잘한걸까요?
                                </div>
                                <div><br></div>
                                <div><br></div>
                                <div>채택, 내공 아낌없이 드릴테니 성심성의껏 답변 해주시면 정말 감사하겠습니다.</div>
                                <div><br></div>
                                <div>광고는 신고할게요 !&nbsp;</div>
                                <div><br></div>
                                <div>프로틴은 마이프로틴 스트로베리 크림 먹습니다.</div>
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
                                    조회수 99,450
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
