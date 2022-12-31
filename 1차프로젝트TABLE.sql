create table item_category_2(
    icno number,
    name VARCHAR2(100) CONSTRAINT ic_name_nn NOT NULL,
    CONSTRAINT ic_icno_pk primary key(icno)
);

CREATE SEQUENCE ic_icno_seq_2
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
    CONSTRAINT item_ino_pk_2 PRIMARY KEY(ino),
    CONSTRAINT item_icno_fk_2 FOREIGN KEY(icno)
    REFERENCES item_category_2(icno) 
);
    -----------------------------------------------------------------------
    -----------------------------------------------------------------------
CREATE TABLE ITEM_2
(
	ino            NUMBER,
	image          VARCHAR2(260) CONSTRAINT id_image_nn_2 NOT NULL,
	name           VARCHAR2(300) CONSTRAINT id_name_nn_2 NOT NULL,
	price          varchar2(100)   CONSTRAINT id_price_nn_2 NOT NULL,
	description    CLOB ,
	stock          NUMBER   CONSTRAINT id_stock_nn_2 NOT NULL,
	status         VARCHAR2(600) CONSTRAINT id_status_nn_2 NOT NULL,
	discount       varchar2(100),
	delivery_price varchar2(100)   CONSTRAINT id_deli_nn_2 NOT NULL,
	like_cnt       NUMBER   CONSTRAINT id_like_nn_2 NOT NULL,
	jjim_cnt       NUMBER   CONSTRAINT id_jjim_nn_2 NOT NULL,
	icno           NUMBER,
	CONSTRAINT item_ino_pk_2 PRIMARY KEY(ino),
    CONSTRAINT item_icno_fk_2 FOREIGN KEY(icno)
    REFERENCES item_category_2(icno)
);



CREATE TABLE ITEM_2 ----------------- 다른 버전
(
	ino            NUMBER,
	image          VARCHAR2(260) CONSTRAINT item_image_nn_2 NOT NULL,
	name           VARCHAR2(300) CONSTRAINT item_name_nn_2 NOT NULL,
	price          varchar2(100)   default 0,
	description    CLOB    ,
	stock          NUMBER   default 0,
	status         VARCHAR2(600) CONSTRAINT item_status_nn_2 NOT NULL,
	discount       varchar2(100)  Default 0,
	delivery_price varchar2(100)   CONSTRAINT item_deli_nn_2 NOT NULL,
	like_cnt       NUMBER   DEFAULT 0,
	jjim_cnt       NUMBER    DEFAULT 0,
	icno           NUMBER,
	CONSTRAINT item_ino_pk_2 PRIMARY KEY(ino),
    CONSTRAINT item_icno_fk_2 FOREIGN KEY(icno)
    REFERENCES item_category_2(icno)
);
drop table item_2;
drop SEQUENCE item_ino_seq_2;

CREATE SEQUENCE item_ino_seq_2
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
    drop table itme_2;
    -----------------------------------------------------------------------
    -----------------------------------------------------------------------

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
    -----------------------------------------------------------------------
    -----------------------------------------------------------------------
CREATE TABLE ITEM_REVIEW_2
(
	rno         NUMBER ,
	name        VARCHAR2  CONSTRAINT ir_name_nn_2 NOT NULL,
	comment     CLOB     CONSTRAINT ir_comt_nn_2 NOT NULL,
	create_date DATE     DEFAULT SYSDATE,
	update_date DATE     DEFAULT SYSDATE,
	hit         NUMBER   DEFAULT 0,
	ino         NUMBER,
	id          VARCHAR2,
    CONSTRAINT ir_rno_pk_2 PRIMARY KEY(rno),
    CONSTRAINT ir_id_fk_2 FOREIGN KEY(id)
    REFERENCES member_2(id),
    CONSTRAINT ir_ino_fk_2 FOREIGN KEY(ino)
    REFERENCES itme_2(ino)
);

CREATE SEQUENCE review_rno_seq_2
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    -----------------------------------------------------------------------
    -----------------------------------------------------------------------
CREATE TABLE QA_2
(
	qano       NUMBER   ,
	title      VARCHAR2 CONSTRAINT qa_title_nn_2 NOT NULL,
	comment    CLOB     CONSTRAINT qa_title_nn_2 NOT NULL,
	category   VARCHAR2 CONSTRAINT qa_title_nn_2 NOT NULL,
	password   VARCHAR2 CONSTRAINT qa_title_nn_2 NOT NULL,
	lock       VARCHAR2 CONSTRAINT qa_title_nn_2 NOT NULL,
	hit        NUMBER   CONSTRAINT qa_title_nn_2 NOT NULL,
	crate_date DATE     DEFAULT SYSDATE,
	ono        NUMBER,
	ino        NUMBER,
	id         VARCHAR2,
	CONSTRAINT qa_qano_pk_2 PRIMARY KEY (qano),
    CONSTRAINT qa_ono_fk_2 FOREIGN KEY(ono)
    REFERENCES order_2(ono),
    CONSTRAINT qa_ino_fk_2 FOREIGN KEY(ino)
    REFERENCES itme_2(ino),
    CONSTRAINT qa_id_fk_2 FOREIGN KEY(id)
    REFERENCES member_2(id)
);

CREATE SEQUENCE qa_qano_seq_2
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE TABLE HR.QA_REPLY_2
(
	qarno ,
	comment     CLOB   CONSTRAINT qr_comment_nn_2 NOT NULL,
	create_date DATE   DEFAULT SYSDATE,
	hit         NUMBER CONSTRAINT qr_hit_nn_2 NOT NULL,
	qano        NUMBER,
	CONSTRAINT qr_qarno_pk_2 PRIMARY KEY (qarno),
    CONSTRAINT qr_qano_fk_2 FOREIGN KEY(qano)
    REFERENCES qa_2(qano)
);

CREATE SEQUENCE qa_qarno_seq_2
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
































