<%--
  Created by IntelliJ IDEA.
  User: 이호섭
  Date: 2023-05-22
  Time: 오전 1:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>boardSave</title>
    <link rel="stylesheet" href="/resources/css/component.css">
    <script src="//cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
</head>
<body>
<%@include file="../component/header.jsp" %>
<%@include file="../component/nav.jsp" %>
<section style="background-color: #fff;margin: 0 auto;">
    <div class="board-save-box">
        <h3 class="blind">QnA영역</h3>
        <div class="board-save-box-inner">
            <form action="/board/save" method="post" class="save-form">
                <div style="width: 743px;">
                    <div style="width: 743px;padding: 15px 0 11px;font-size: 12px;visibility: hidden">패딩을위한공간</div>
                    <div class="board-save-title-area">
                        <div class="article">
                            <h3>
                                <label for="boardTitle">
                                    <img src="https://ssl.pstatic.net/static/kin/09renewal/h_question.gif"
                                         style="width: 64px;height:30px; " alt="질문">
                                </label>
                            </h3>
                            <div class="save-input">
                                <input id="boardTitle" name="boardTitle" class="save-input-title">
                            </div>
                        </div>
                        <div class="article2">
                            <span class="desc">
                                (<span id="au_title_cnt" style="text-align: right;">0</span>/80자)
                            </span>
                        </div>
                    </div>
                    <div class="board-save-contents-area">
                        <textarea id="editor1" name="boardContents">
                            궁금한 내용을 질문해 주세요.
                            <br>
                            <br>
                            질문 시 이런 점을 주의해 주세요!
                            <br>
                            - 답변이 등록되면 질문 수정/삭제가 불가합니다.
                            <br>
                            - 질문 내용에 개인정보(실명, 전화번호, 메신저 및 네이버 아이디)가 포함되지 않게 해 주세요.
                            <br>
                            - 의료 질문 관련하여 의료인은 SNS 상담을 하지 않고, 신체 사진/동영상을 요구하지 않습니다.
                            <br>
                            악의적인 범죄로 이어질 수 있으니 유의해 주세요.
                            <br>
                            피해를 입으셨다면, 서비스에 신고, 112 또는 사이버경찰청(www.police.go.kr)으로 신고 부탁드립니다.
                        </textarea>
                    </div>
                    <div class="board-save-btn-box">
                        <div class="board-save-btn">
                            <button type="button" class="save-btn">작성완료</button>
                            <button type="button" class="save-btn" onclick="back()">작성취소</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<%@include file="../component/footer.jsp" %>
</body>

<script>
    CKEDITOR.replace('editor1', {
        height: '350px'
    });

    CKEDITOR.instances['editor1'].on('contentDom', function() {
        this.document.on('click', function(event){
            CKEDITOR.instances.editor1.setData('<br>');
        });
    });

    const back = () => {
        location.href = "/login/index";
    }

</script>
</html>
