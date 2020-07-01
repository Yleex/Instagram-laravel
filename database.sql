CREATE DATABASE IF NOT EXISTS laravel_master;
USE laravel_master;

CREATE TABLE IF NOT EXISTS users(
id 					int(255) auto_increment not null,
role				varchar(20),
name				varchar(100),
surname				varchar(200),
nick				varchar(100),
email				varchar(255),
password			varchar(255),
image				varchar(255),
created_at			datetime,
updated_at			datetime,
remember_token		varchar(255),
CONSTRAINT pk_users PRIMARY KEY(id)
)ENGINE=InnoDB;

INSERT INTO users VALUES(NULL, 'user', 'Alex', 'Montenegro', 'Montxela', 'alm@alm.com', 'pass', null, CURTIME(), CURTIME(), null);
INSERT INTO users VALUES(NULL, 'user', 'Pedro', 'Sanchez', 'Pechez', 'ped@chez.com', 'pass', null, CURTIME(), CURTIME(), null);
INSERT INTO users VALUES(NULL, 'user', 'Rafael', 'Espinoza', 'Espira', 'Rafa@espin.com', 'pass', null, CURTIME(), CURTIME(), null);

CREATE TABLE IF NOT EXISTS images(
id 					int(255) auto_increment not null,
users_id			int(255),
image_path			varchar(255),
description			text,
created_at			datetime,
updated_at			datetime,
CONSTRAINT pk_images PRIMARY KEY(id),
CONSTRAINT fk_images_users FOREIGN KEY(users_id) REFERENCES users(id)
)ENGINE=InnoDB;

INSERT INTO images VALUES(NULL, 1, 'nube.jpg', 'decripcion de prueba 1', CURTIME(), CURTIME());
INSERT INTO images VALUES(NULL, 2, 'sol.jpg', 'decripcion de prueba 2', CURTIME(), CURTIME());
INSERT INTO images VALUES(NULL, 3, 'arena.jpg', 'decripcion de prueba 3', CURTIME(), CURTIME());
INSERT INTO images VALUES(NULL, 4, 'fam.jpg', 'decripcion de prueba 4', CURTIME(), CURTIME());


CREATE TABLE IF NOT EXISTS comments(
id 					int(255) auto_increment not null,
users_id			int(255),
image_id			int(255),
content				text,
created_at			datetime,
updated_at			datetime,
CONSTRAINT pk_comments PRIMARY KEY(id),
CONSTRAINT fk_comments_users FOREIGN KEY(users_id) REFERENCES users(id),
CONSTRAINT fk_comments_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDB;

INSERT INTO comments VALUES(null, 1, 4, 'Buena foto', CURTIME(), CURTIME());
INSERT INTO comments VALUES(null, 2, 1, 'Buen paisaje', CURTIME(), CURTIME());
INSERT INTO comments VALUES(null, 2, 3, 'Hermosa playa', CURTIME(), CURTIME());

CREATE TABLE IF NOT EXISTS likes(
id 					int(255) auto_increment not null,
users_id			int(255),
image_id			int(255),
created_at			datetime,
updated_at			datetime,
CONSTRAINT pk_likes PRIMARY KEY(id),
CONSTRAINT fk_likes_users FOREIGN KEY(users_id) REFERENCES users(id),
CONSTRAINT fk_likes_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDB;

INSERT INTO likes VALUES(null, 1, 4, CURTIME(), CURTIME());
INSERT INTO likes VALUES(null, 2, 4, CURTIME(), CURTIME());
INSERT INTO likes VALUES(null, 3, 1, CURTIME(), CURTIME());
INSERT INTO likes VALUES(null, 3, 2, CURTIME(), CURTIME());
INSERT INTO likes VALUES(null, 2, 1, CURTIME(), CURTIME());
