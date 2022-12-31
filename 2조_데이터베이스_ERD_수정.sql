create table item_category_2(
    icno number,
    name VARCHAR2(100) CONSTRAINT ic_name_nn_2 NOT NULL,
    CONSTRAINT ic_icno_pk_2 primary key(icno)
);

CREATE SEQUENCE ic_icno_seq_2
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
create table item_list_2(
    ilno            NUMBER,
	name           VARCHAR2(300) CONSTRAINT il_name_nn_2 NOT NULL,
	price          NUMBER   CONSTRAINT il_price_nn_2 NOT NULL,
    link            varchar2(300) constraint il_link_nn_2 not null,
    CONSTRAINT il_ilno_pk_2 PRIMARY KEY(ilno)
);

drop table item_list_2;

desc item_list_2;
alter table item_list_2 add link varchar2(300);

CREATE SEQUENCE il_ino_seq_2
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------


CREATE TABLE ITEM_2
(
	ino            NUMBER,
    name           VARCHAR2(300) CONSTRAINT item_name_nn_2 NOT NULL,
	image          VARCHAR2(260) CONSTRAINT item_image_nn_2 NOT NULL,
	price          NUMBER   CONSTRAINT item_price_nn_2 NOT NULL,
	description    CLOB     CONSTRAINT item_descript_nn_2 NOT NULL,
	stock          NUMBER  default 0,
	status         VARCHAR2(200) CONSTRAINT item_status_nn_2 NOT NULL,
	discount       NUMBER Default 0,
	delivery_price NUMBER   CONSTRAINT item_deli_nn_2 NOT NULL,
	like_cnt       NUMBER   DEFAULT 0,
	jjim_cnt       NUMBER    DEFAULT 0,
	icno           NUMBER,
	CONSTRAINT item_ino_pk_2 PRIMARY KEY(ino),
    CONSTRAINT item_icno_fk_2 FOREIGN KEY(icno)
    REFERENCES item_category_2(icno)
);

drop table item_2;
desc item_2;
desc item_category_2;
select * from item_category_2;

create table item_2(
ino number,
icno number,
name varchar2(300) CONSTRAINT item_name_nn_2 NOT NULL,
image VARCHAR2(260) CONSTRAINT item_image_nn_2 NOT NULL,
price number CONSTRAINT item_price_nn_2 NOT NULL,
point number default 0,
brand varchar2(300) constraint item_brand_nn_2 not null,
delivery_price number default 0,
CONSTRAINT item_ino_pk_2 PRIMARY KEY(ino),
CONSTRAINT item_icno_fk_2 FOREIGN KEY(icno)
REFERENCES item_category_2(icno)
);

CREATE SEQUENCE item_ino_seq_2
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

alter table item_2 add link varchar2(300);
desc item_2;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------


create table item_22(
    ino            NUMBER,
    ilno           NUMBER,
	image          VARCHAR2(260) CONSTRAINT item_image_nn_22 NOT NULL,
	name           VARCHAR2(300) CONSTRAINT item_name_nn_22 NOT NULL,
	price          NUMBER   CONSTRAINT item_price_nn_22 NOT NULL,
    
    CONSTRAINT item_ino_pk_22 PRIMARY KEY(ino),
    CONSTRAINT item_ilno_fk_22 foreign key(ilno)
    references item_list_2(ilno)
);
drop table item_22;

CREATE SEQUENCE item_ino_seq_22
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------




CREATE TABLE ITEM_REVIEW_2
(
	rno         NUMBER ,
	name        VARCHAR2(100)  CONSTRAINT ir_name_nn_2 NOT NULL,
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





CREATE TABLE QA_2
(
	qano       NUMBER   ,
	title      VARCHAR2(100) CONSTRAINT qa_title_nn_2 NOT NULL,
	comment    CLOB     CONSTRAINT qa_title_nn_2 NOT NULL,
	category   VARCHAR2(100) CONSTRAINT qa_title_nn_2 NOT NULL,
	password   VARCHAR2(100) CONSTRAINT qa_title_nn_2 NOT NULL,
	lock       VARCHAR2(100) CONSTRAINT qa_title_nn_2 NOT NULL,
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