<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav>
    <div id="nav-inner">
        <h3 class="blind"></h3>
        <ul id="nav-list" style="display: flex;justify-content: center;">
            <c:choose>
                <c:when test="${sessionScope.memberId != null}">
                    <li class="nav-menu"><a href="/login/index" class="nav-list-item"><em>홈</em></a></li>
                </c:when>
                <c:otherwise>
                    <li class="nav-menu"><a href="/" class="nav-list-item"><em>홈</em></a></li>
                </c:otherwise>
            </c:choose>
            <li class="nav-menu"><a href="/board/Qna" class="nav-list-item"><em>Q&A</em></a></li>
<%--            <c:choose>--%>
<%--                <c:when test="${sessionScope.memberId != null}">--%>
<%--                    <li class="nav-menu"><a href="/board/loginRank?memberId=${sessionScope.memberId}" class="nav-list-item"><em>명예의전당</em></a></li>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
                    <li class="nav-menu"><a href="/board/Rank" class="nav-list-item"><em>명예의전당</em></a></li>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
            <li class="nav-menu"><span class="nav-list-bar">|</span><a href="#" class="nav-list-item"
                                                                       style="width: auto;"><em>프로필</em></a></li>
            <li class="nav-menu"><a href="#" class="nav-list-item"><em>룰렛</em></a></li>
            <li class="nav-menu"><span class="nav-list-bar">|</span></li>
            <c:choose>
                <c:when test="${sessionScope.memberId!=null}">
                    <li class="nav-menu" style="background-color: #00c73c;border: 1px solid #00bd39;margin-left: 15px;">
                        <a href="/board/save" class="nav-list-item-question">
                            <span class="btn_inner">
                                <i class="nav-list-item-question-icon"></i>질문하기
                            </span>
                        </a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-menu" style="background-color: #00c73c;border: 1px solid #00bd39;margin-left: 15px;">
                        <a href="/member/login" class="nav-list-item-question">
                            <span class="btn_inner">
                                <i class="nav-list-item-question-icon"></i>질문하기
                            </span>
                        </a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</nav>
