CREATE TABLE user(
  id int NOT NULL AUTO_INCREMENT,
  user_name varchar(32) NOT NULL,
  password varchar(32) NOT NULL,
  real_name varchar(32) NOT NULL,
  phone_number varchar(32) NOT NULL,
  department varchar(32) NOT NULL,
  UNIQUE(user_name),
  PRIMARY KEY (id)
)CHARSET=utf8;

CREATE TABLE role (
  id int(11) NOT NULL AUTO_INCREMENT,
  role_name varchar(35) NOT NULL,
  cn_role_name varchar(35) NOT NULL,
  UNIQUE(role_name, cn_role_name),
  PRIMARY KEY (id)
) CHARSET=utf8;

CREATE TABLE permission (
  id int(11) NOT NULL AUTO_INCREMENT,
  permission_name varchar(35) NOT NULL,
  UNIQUE(permission_name),
  PRIMARY KEY (id)
) CHARSET=utf8;

CREATE TABLE user_role_relation (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  role_id int(11) NOT NULL,
  PRIMARY KEY (id)
) CHARSET=utf8;
  --,
  --FOREIGN KEY (user_id) REFERENCES user(id),
  --FOREIGN KEY (role_id) REFERENCES role(id)
CREATE TABLE role_permission_relation (
  id int(11) NOT NULL AUTO_INCREMENT,
  role_id int(11) NOT NULL,
  permission_id int(11) NOT NULL,
  PRIMARY KEY (id)
) CHARSET=utf8;
  --,
  --FOREIGN KEY (permission_id) REFERENCES permission (id),
  --FOREIGN KEY (role_id) REFERENCES role (id)