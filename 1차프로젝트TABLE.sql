create table item_category_2(
    icno number,
    name VARCHAR2(100) CONSTRAINT ic_name_nn NOT NULL,
    CONSTRAINT ic_icno_pk primary key(icno)
);

CREATE SEQUENCE ic_icno_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
CREATE TABLE item_2(
    ino number,
    name varchar2(300) CONSTRAINT item_name_nn NOT NULL,
    price varchar2(20) CONSTRAINT item_price_nn NOT NULL,
    icno number,
    image varchar2(260) CONSTRAINT item_image_nn NOT NULL,
    CONSTRAINT item_ino_pk PRIMARY KEY(ino),
    CONSTRAINT item_icno_fk FOREIGN KEY(icno)
    REFERENCES item_category_2(icno)
    
);
CREATE SEQUENCE item_ino_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE item_detail_2( -- 카톡으로 수정할거 확인
    name VARCHAR2(200)CONSTRAINT id_name_nn NOT NULL,
    description CLOB CONSTRAINT id_descript_nn NOT NULL,
    stock NUMBER CONSTRAINT id_stock_nn NOT NULL,
    status VARCHAR2(200) CONSTRAINT id_status_nn NOT NULL,
    discount NUMBER DEFAULT 0,
    price NUMBER CONSTRAINT id_price_nn NOT NULL,
    delivery_price varchar2(20) CONSTRAINT id_delivery_nn NOT NULL,
    poster VARCHAR2(260) CONSTRAINT id_delivery_nn NOT NULL,
    like_cnt NUMBER DEFAULT 0, -- 찜하기로한거 아닌지
    ino NUMBER,
    CONSTRAINT id_ino_fk FOREIGN KEY(ino)
    REFERENCES item_2(ino)
);

CREATE TABLE item_review_2(
    rno NUMBER,
    name VARCHAR2(34) CONSTRAINT ir_name_nn NOT NULL,
    comment CLOB CONSTRAINT ir_cmt_nn NOT NULL,
    create_date DATE DEFAULT SYSDATE,
    update_date DATE DEFAULT SYSDATE,
    hit NUMBER DEFAULT 0,
    mno NUMBER,
    ino NUMBER,
    CONSTRAINT ir_rno_pk PRIMARY KEY(rno),
    CONSTRAINT ir_mno_fk FOREIGN KEY(mno)
    REFERENCES member_2(mno),
    CONSTRAINT ir_ino_fk FOREIGN KEY(ino)
    REFERENCES itme_2(ino)
);

CREATE TABLE QA_2(
    
);

CREATE TABLE QA_REPLY_2(
    
);
































