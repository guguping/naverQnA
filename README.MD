### 프로젝트 기획안

#### 작성일 : 2023.05.15

#### 작성자 : 이호섭

### 프로젝트 명 : 네이버 지식인 QnA

### 기획 의도 :

    네이버 지식인 페이지
    회원들이 모르는 부분을 질문하면 그부분에대해 알고있는 사용자가
    답글을 달아주는 시스템
    이렇게 질문이나 답글이 쌓이는 경우
    다른 유저가 비슷한 궁금증이 있는 경우 굳이 글을 올리지 않아도
    검색을 통해 이미 전에 있었던 글을 참고하여 궁금증을 해결할 수 있습니다

### 벤치마킹

    네이버 QNA 지식IN을 참고한 이유는
    아무래도 국내 최고의 포털사이트를 참고하는게 기능적인 부분, 사용자 편의성 부분을
    참고하기 좋을것이라고 생각했습니다

### 주요 기능

    로그인 기능
    회원가입 기능 
    검색 기능
    페이징 기능
    게시글 기능
    답글 기능

### 기타

    게시판 활성화를 위하여 포인트 기능
    포인트를 통한 랭킹 기능
    랭킹에 따른 특별한 답글 CSS
    포인트를 활용 가능한 상점 기능

### sql - member_table

```sql
drop table if exists member_table;
create table member_table
(
    id               bigint auto_increment primary key,
    memberEmail      varchar(20) not null unique,
    memberDomain     varchar(30) not null unique,
    memberPassword   varchar(20) not null,
    memberName       varchar(10) not null,
    memberBirthday   varchar(15) not null,
    memberGender     varchar(1)  not null,
    memberCreateDate datetime default now()
);
```

### sql - board_table;

```sql
drop table if exists board_table;
create table board_table
(
    id               bigint auto_increment primary key,
    boardTitle       varchar(80)  not null,
    boardWriter      varchar(20)  not null,
    boardContents    varchar(500) not null,
    boardHits        int      default 0,
    boardCreatedDate datetime default now(),
    fileAttached     int      default 0,
    memberId         bigint,
    constraint fk_member_board foreign key (memberId) references member_table (id) on delete cascade
);
```

### sql - comment_table;

```sql
drop table if exists comment_table;
create table comment_table
(
    id                 bigint auto_increment primary key,
    boardId            bigint,
    memberId           bigint,
    commentWriter      varchar(20)  not null,
    commentContents    varchar(500) not null,
    commentCreatedDate datetime default now(),
    constraint fk_member_comment foreign key (memberId) references member_table (id) on delete cascade,
    constraint fk_board_comment foreign key (boardId) references board_table (id) on delete cascade
);
```

### ck에디터 플러그인

- 목록
  https://ckeditor.com/docs/ckeditor4/latest/api/CKEDITOR_config.html#cfg-extraPlugins


- 적용 방법

```javascript
CKEDITOR.replace('editor1', {
    height: '350px',
    language: 'ko',
    enterMode: CKEDITOR.ENTER_BR // 엔터시 자동 br추가

});
```

### 게시판 조회수 중복 제거 (오류 많음 사용 X)

```javascript
  // 세션 시작
HttpSession
BoardHitsSession = request.getSession(true);
// 해당 세션의 유효 시간을 5분으로 설정 1=1초
BoardHitsSession.setMaxInactiveInterval(30);
// 파라미터로 받은 값을 세션 벨류로 저장
String
bestBoardIdx = request.getParameter("bestBoardId");
// 중복 조회 확인
if (BoardHitsSession.getAttribute("visited_" + bestBoardIdx) == null) {
    // 중복 조회가 아닌 경우
    BoardHitsSession.setAttribute("visited_" + bestBoardIdx, true);
    // 조회수 증가 및 기타 로직 처리
    boardService.boardHitsUp(bestBoardId);
}
```

### 게시판 조회수 중복 제거 (쿠키 사용)

```javascript
Cookie oldCookie = null;
Cookie[] cookies = request.getCookies();
if (cookies != null) {
    for (Cookie cookie:cookies) {
        if (cookie.getName().equals("postView")) {
            oldCookie = cookie;
        }
    }
}

if (oldCookie != null) {
    if (!oldCookie.getValue().contains("[" + BoardId.toString() + "]")) {
        boardService.boardHitsUp(BoardId);
        oldCookie.setValue(oldCookie.getValue() + "_[" + BoardId + "]");
        oldCookie.setPath("/");
        oldCookie.setMaxAge(3600);
        response.addCookie(oldCookie);
    }
} else {
    boardService.boardHitsUp(BoardId);
    Cookie
    newCookie = new Cookie("postView", "[" + BoardId + "]");
    newCookie.setPath("/");
    newCookie.setMaxAge(3600);
    response.addCookie(newCookie);
}
```
#### 참고 사이트 : https://mighty96.github.io/til/view/