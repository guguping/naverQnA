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
create table member_table(
id bigint auto_increment primary key,
memberEmail varchar(20) not null unique,
memberDomain varchar(30) not null unique,
memberPassword varchar(20) not null,
memberName varchar(10) not null,
memberBirthday varchar(15) not null,
memberGender varchar(1) not null,
memberCreateDate datetime default now()
);
```

### sql - board_table;
```sql
drop table if exists board_table;
create table board_table(
id bigint auto_increment primary key,
boardTitle varchar(80) not null,
boardWriter varchar(20) not null,
boardContents varchar(500) not null,
boardHits int default 0,
boardCreatedDate datetime default now(),
fileAttached int default 0,
memberId bigint,
constraint fk_member_board foreign key (memberId) references member_table(id) on delete cascade
);
```