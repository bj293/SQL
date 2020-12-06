-- Exercise 1

CREATE INDEX zip_index ON vendors(vendor_zip_code ASC);


-- Exercise 2
use ex;
create table members(
members_id int primary key,
first_name varchar(45) not null,
last_name varchar(45) not null,
address varchar(45) default '',
city varchar(45) default '',
state varchar(45) default '',
phone char(10) default ''
)
charset latin1 collate latin1_swedish_ci
engine = InnoDB;

create table members_groups(
members_id int references members(member_id),
group_id int references groupss(group_di)
)
charset latin1 collate latin1_swedish_ci
engine = innodb;

create table groupss(
group_id int primary key,
group_name varchar(45) not null
)
charset latin1 collate latin1_swedish_ci
engine = innodb;