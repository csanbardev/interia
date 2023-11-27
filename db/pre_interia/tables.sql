CREATE TABLE t_categories(
  cat_id INT auto_increment PRIMARY KEY,
  cat_name VARCHAR(20) NOT NULL unique,
  cat_pending CHAR(1) DEFAULT 1,
  cat_img VARCHAR(70)
);

CREATE TABLE t_users(
  usr_id INT auto_increment PRIMARY KEY,
  usr_nick VARCHAR(20) NOT NULL unique,
  usr_password VARCHAR(200) not null,
  usr_email VARCHAR(50),
  usr_role VARCHAR(6) DEFAULT 'user',
  usr_avatar VARCHAR(50) DEFAULT 'uploads/avatar.png'
);

CREATE TABLE t_tutorials(
  tut_id INT auto_increment PRIMARY KEY,
  tut_url VARCHAR(100) not null,
  tut_approved CHAR(1) DEFAULT 0,
  tut_published_date date not null,
  tut_cat_id INT not null,
  tut_usr_id INT not null,
  tut_likes INT(11),
  tut_title VARCHAR(120) not null unique,
  tut_author VARCHAR(80) not null,
  tut_src_image VARCHAR(50) not null,
  tut_length varchar(30) not null,
  tut_yb_likes INT not null
);

alter table t_tutorials
	add constraint tut_fk1 foreign key(tut_usr_id)
    references t_users (usr_id) on delete cascade; 
   
alter table t_tutorials
	add constraint tut_fk2 foreign key(tut_cat_id)
    references t_categories (cat_id) on delete cascade;    


CREATE TABLE t_likes(
  lks_tut_id INT not null,
  lks_usr_id INT not null
);

alter table t_likes
	add constraint lks_fk1 foreign key(lks_usr_id)
    references t_users (usr_id) on delete cascade; 
   
alter table t_likes
	add constraint lks_fk2 foreign key(lks_tut_id)
    references t_tutorials (tut_id) on delete cascade;   

CREATE Table t_reports(
  rpt_id INT auto_increment PRIMARY KEY,
  rpt_tut_id INT not null,
  rpt_usr_id INT not null
);

alter table t_reports
	add constraint rpt_fk1 foreign key(rpt_usr_id)
    references t_users (usr_id) on delete cascade; 
   
alter table t_reports
	add constraint rpt_fk2 foreign key(rpt_tut_id)
    references t_tutorials (tut_id) on delete cascade;  
