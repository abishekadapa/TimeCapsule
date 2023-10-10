CREATE TABLE USERS (id int NOT NULL, uname varchar2(10) NOT NULL,passwd varchar2(20) NOT NULL,cpass varchar2(20) NOT NULL,email varchar2(50) NOT NULL,dob varchar2(10) NOT NULL,phno number(10) NOT NULL,gender varchar2(10) NOT NULL,PRIMARY KEY (id));
CREATE TABLE EVENTS(id int NOT NULL,user_id int REFERENCES USERS(id),title varchar2(20) NOT NULL,dat varchar2(10),cont varchar2(4000),PRIMARY KEY (id));



For MySql
CREATE TABLE USERS (id int NOT NULL PRIMARY KEY AUTO_INCREMENT, uname varchar(10) NOT NULL,passwd varchar(20) NOT NULL,cpass varchar(20) NOT NULL,email varchar(50) NOT NULL,dob varchar(10) NOT NULL,phno int(10) NOT NULL,gender varchar(10) NOT NULL);
CREATE TABLE EVENTS(id int NOT NULL PRIMARY KEY AUTO_INCREMENT,user_id int NOT NULL ,title varchar(20) NOT NULL,dat varchar(10) NOT NULL,cont varchar(4000) NOT NULL,FOREIGN KEY (user_id) REFERENCES users(id));




create sequence id_for_users;
create sequence id_for_events;

create or replace TRIGGER trig_for_user
  BEFORE INSERT ON USERS
  FOR EACH ROW
BEGIN
  SELECT id_for_users.nextval
  INTO :new.id
  FROM dual;
END;

create or replace TRIGGER trig_for_event
  BEFORE INSERT ON EVENTS
  FOR EACH ROW
BEGIN
  SELECT id_for_events.nextval
  INTO :new.id
  FROM dual;
END;