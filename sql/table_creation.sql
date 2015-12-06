CREATE TABLE equipment(
id INT NOT NULL AUTO_INCREMENT,
serial VARCHAR(32) NOT NULL,
cn_name VARCHAR(128) NOT NULL,
en_name VARCHAR(128),
description VARCHAR (10000) NOT NULL,
note VARCHAR (10000),
made_by VARCHAR (32) NOT NULL,
quantity MEDIUMINT NOT NULL,
category VARCHAR (64) NOT NULL,
manufacturer VARCHAR(255) NOT NULL,
price INT NOT NULL,
mng_level TINYINT NOT NULL,
operator_id INT,
director_id INT,
motion_state VARCHAR(32) NOT NULL,
running_state VARCHAR(32) NOT NULL,
repair_time BIGINT NOT NULL,
repair_frqc SMALLINT NOT NULL,
maintain_time BIGINT NOT NULL,
maintain_frqc SMALLINT NOT NULL,
is_deleted TINYINT(1) DEFAULT 0,
PRIMARY KEY (id),
UNIQUE (serial)
)CHARSET=utf8;

CREATE TABLE system_settings(
id INT NOT NULL AUTO_INCREMENT,
is_recyclable TINYINT DEFAULT 0,
PRIMARY KEY (id)
)CHARSET=utf8;