create table member(
	num smallint auto_increment primary key,
	member_level smallint,
	id varchar(100),
	pw varchar(100),
	name varchar(30),
	nickname varchar(50),
	email varchar(70),
	hp varchar(50),
	img_name varchar(300),
	img_path varchar(300),
	gaipday datetime
)