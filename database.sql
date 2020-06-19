CREATE DATABASE IF NOT EXISTS laravel_master;
USE laravel_master;

CREATE TABLE IF NOT EXISTS users(
id 							int(255) auto_increment not null,
role						varchar(20),
name						varchar(100),
surname					varchar(200),
nick						varchar(100),
email						varchar(255),
password				varchar(255),
image						varchar(255),
created_at			datetime,
updated_at			datetime,
remenber_token	varchar(255),
CONSTRAINT pk_user PRYMARY KEY(id)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS images(
id 							int(255) auto_increment not null,
user_id					int(255),
image_path			varchar(255),
description			text,
created_at			datetime,
updated_at			datetime,
CONSTRAINT pk_images PRYMARY KEY(id),
CONSTRAINT fk_images_users FOREING KEY(user_id) REFERENCES users(id)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS comments(
id 							int(255) auto_increment not null,
user_id					int(255),
image_id				int(255),
content					text,
created_at			datetime,
updated_at			datetime,
CONSTRAINT pk_comments PRYMARY KEY(id),
CONSTRAINT fk_comments_users FOREING KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_comments_images FOREING KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS likes(
id 							int(255) auto_increment not null,
user_id					int(255),
image_id				int(255),
created_at			datetime,
updated_at			datetime,
CONSTRAINT pk_likes PRYMARY KEY(id),
CONSTRAINT fk_likes_users FOREING KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_likes_images FOREING KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDB;