create table member(
	num smallint auto_increment primary key,
	member_level smallint,
	id varchar(100),
	pw varchar(100),
	pw_check varchar(100),
	name varchar(30),
	nickname varchar(50),
	email varchar(70),
	hp varchar(50),
	member_img varchar(100),
	gaipday datetime
)