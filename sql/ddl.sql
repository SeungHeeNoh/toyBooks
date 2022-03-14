DROP TABLE IF EXISTS author;

CREATE TABLE author
(
    author_id                 varchar(20) NOT NULL COMMENT '작가 id',
    author_password           varchar(20) NOT NULL COMMENT '작가 비밀번호',
    author_name               varchar(10) NOT NULL COMMENT '작가명',
    grade_update_date         datetime    NOT NULL DEFAULT now() COMMENT '등급 업데이트 날짜',
    author_lastest_login_date datetime    NOT NULL DEFAULT now() COMMENT '마지막 로그인 접속 기록',
    author_state              varchar(1)  NOT NULL DEFAULT 'Y' COMMENT '가입 상태',
    grade_code                varchar(20) NOT NULL COMMENT '등급코드',
    genre_no                  int         NOT NULL COMMENT '장르 번호'
);

DROP TABLE IF EXISTS genre;

CREATE TABLE genre
(
    genre_no   int          NOT NULL COMMENT '장르 번호',
    genre_name varchar(50)  NOT NULL COMMENT '장르명',
    genre_desc varchar(500) NOT NULL COMMENT '장르 설명'
);

DROP TABLE IF EXISTS serial;

CREATE TABLE serial
(
    serial_no            int          NOT NULL COMMENT '연재 제출 번호',
    serial_content       varchar(500) NOT NULL COMMENT '연재 제출 내용',
    serial_register_date datetime     NOT NULL DEFAULT now() COMMENT '연재 제출 등록 날짜',
    serial_count         int          NOT NULL DEFAULT 0 COMMENT '조회수',
    serial_state         varchar(1)   NOT NULL DEFAULT 'N' COMMENT '연재 가능 여부',
    author_id            varchar(20)  NOT NULL COMMENT '작가 id'
);

DROP TABLE IF EXISTS grade;

CREATE TABLE grade
(
    grade_code  varchar(20)  NOT NULL COMMENT '등급코드',
    grade_name  varchar(20)  NOT NULL COMMENT '등급명',
    grade_desc  varchar(200) NOT NULL COMMENT '등급설명',
    grade_order int          NOT NULL COMMENT '등급 순서'
);

DROP TABLE IF EXISTS admin;

CREATE TABLE admin
(
    admin_id       varchar(20) NOT NULL COMMENT '관리자 id',
    admin_password varchar(20) NOT NULL COMMENT '관리자 비밀번호',
    genre_no       int         NULL COMMENT '장르 번호',
    authority_code varchar(20) NOT NULL COMMENT '권한코드'
);

DROP TABLE IF EXISTS authority;

CREATE TABLE authority
(
    authority_code  varchar(20) NOT NULL COMMENT '권한코드',
    authority_name  varchar(20) NOT NULL COMMENT '권한명',
    authority_order int         NOT NULL COMMENT '권한순서'
);

ALTER TABLE author
    ADD CONSTRAINT PK_AUTHOR PRIMARY KEY (
                                          author_id
        );

ALTER TABLE genre
    ADD CONSTRAINT PK_GENRE PRIMARY KEY (
                                         genre_no
        );

ALTER TABLE serial
    ADD CONSTRAINT PK_SERIAL PRIMARY KEY (
                                          serial_no
        );

ALTER TABLE grade
    ADD CONSTRAINT PK_GRADE PRIMARY KEY (
                                         grade_code
        );

ALTER TABLE admin
    ADD CONSTRAINT PK_ADMIN PRIMARY KEY (
                                         admin_id
        );

ALTER TABLE authority
    ADD CONSTRAINT PK_AUTHORITY PRIMARY KEY (
                                             authority_code
        );

ALTER TABLE author
    ADD CONSTRAINT FK_grade_TO_author_1 FOREIGN KEY (
                                                     grade_code
        )
        REFERENCES grade (
                          grade_code
            );

ALTER TABLE author
    ADD CONSTRAINT FK_genre_TO_author_1 FOREIGN KEY (
                                                     genre_no
        )
        REFERENCES genre (
                          genre_no
            );

ALTER TABLE serial
    ADD CONSTRAINT FK_author_TO_serial_1 FOREIGN KEY (
                                                      author_id
        )
        REFERENCES author (
                           author_id
            );

ALTER TABLE admin
    ADD CONSTRAINT FK_genre_TO_admin_1 FOREIGN KEY (
                                                    genre_no
        )
        REFERENCES genre (
                          genre_no
            );

ALTER TABLE admin
    ADD CONSTRAINT FK_authority_TO_admin_1 FOREIGN KEY (
                                                        authority_code
        )
        REFERENCES authority (
                              authority_code
            );

