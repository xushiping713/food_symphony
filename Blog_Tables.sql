use mgaosxu_db;

drop table if exists user;
drop table if exists following;
drop table if exists blogPost;
drop table if exists file;
drop table if exists comment;
drop table if exists cookingEvent;
drop table if exists tag;
drop table if exists eventsignup;

create table user (
	nm integer auto_increment primary key,
	name varchar(30) not null,
	username varchar(30) not null,
 	password varchar(20) not null,
	shortintro varchar(100))
ENGINE = InnoDB;

create table following (
	user int,
	following int,
	primary key (user, following),
	foreign key (user) references user(nm),
	foreign key (following) references user(nm)) 
ENGINE = InnoDB;

create table blogPost (
	blogID integer auto_increment primary key,
	userID integer not null,
	title varchar(70) not null,
	numoflikes integer not null default 0,
	datePosted TIMESTAMP,
	time integer,
	price integer,
	foreign key (userID) references user(nm))
ENGINE = InnoDB;

create table file (
	blogID integer(10) not null,
	fileNum integer(2) not null,
	primary key (blogID, fileNum),
	extension enum('.jpg', '.pdf', '.txt', '.png', '.jpeg'),
	foreign key (blogID) references blogPost(blogID))
ENGINE = InnoDB;	

create table comment (
	commentID integer auto_increment primary key,
	blogID integer not null,
	commentContent text,
	numoflikes integer default 0,
	datePosted date,
	foreign key (blogID) references blogPost(blogID))
ENGINE = InnoDB;

create table likePosts (
	userID 
	blogID
	foreign key (userID) references user(nm),
	foreign key (blogID) references blogPost(blogID))
ENGINE = InnoDB;
	)