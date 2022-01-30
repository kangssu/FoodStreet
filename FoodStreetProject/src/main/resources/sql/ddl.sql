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
	gaipday datetime,
	auth_provider varchar(15)
)

create table food_request(
	num smallint auto_increment primary key,
	id varchar(100),
	name varchar(30),
	food_store varchar(50),
	place_name varchar(20),
	address1 varchar(20),
	address2 varchar(100),
	hp varchar(50),
	type_of_food varchar(100),
	price varchar(20),
	store_time varchar(100),
	img_name varchar(300),
	img_path varchar(300),
	menu varchar(300),
	comment varchar(200),
	reason varchar(300),
	state varchar(20),
	reporting_date datetime
)