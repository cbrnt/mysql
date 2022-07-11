-- Задание 1
CREATE DATABASE test CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- Задание 2
CREATE TABLE users (
    id int NOT NULL AUTO_INCREMENT,
    email varchar (255),
    pass varchar(255) NOT NULL,
    sum int,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created TIMESTAMP NOT NULL,
    PRIMARY KEY (`id`)
);

-- Задание 3
INSERT INTO users (email, pass, sum, created) VALUES ("elon@tesla.com", "t3sla_rul3s_the_worlds", 3022050, "2022-12-12 01:30:20");
INSERT INTO users (email, pass, sum, created) VALUES ("ragozin@gagarin.sorry", "bututs_rules", 9999999, "2022-12-13 03:30:11");
INSERT INTO users (email, pass, sum, created) VALUES ("master@sky.net", "hate_skin_bags", 100101001, "2022-12-01 03:30:11");
INSERT INTO users (email, pass, sum, created) VALUES ("hub01@sky.net", "love_master_host", 1010101, "2022-07-11 15:00:11");
INSERT INTO users (email, pass, sum, created) VALUES ("hub02@sky.net", "love_master_host", 1011110101, "2022-07-11 15:01:11");
INSERT INTO users (email, pass, sum, created) VALUES ("hub03@sky.net", "love_master_host", 1011110101, "2022-06-11 15:01:11");


-- Задание 4
SELECT * FROM users WHERE email = 'ragozin@gagarin.sorry';
-- записей за сегодня, говорят сильно нарягает базу, так применяем date() ко всем полям базы
SELECT * FROM users WHERE date(created) = CURDATE();
-- вот полегче запрос
SELECT * FROM users WHERE created BETWEEN 'CURDATE() 00:00:00' AND 'CURDATE() 23:59:59';
-- сколько по дням
SELECT date(created), COUNT(*) FROM users GROUP BY date(created);
-- сумма
SELECT SUM(sum) FROM users;

-- Задание 5
UPDATE users SET sum = 100500 WHERE id = 5;
UPDATE users SET sum = 9999 WHERE email = "hub01@sky.net";
UPDATE users SET sum = 10000 WHERE created BETWEEN '2022-06-01 00:00:00' AND 'CURDATE() 2022-06-31 00:00:00 23:59:59';

-- Задание 6
ALTER TABLE users ADD UNIQUE (email);

-- Задание 7
INSERT INTO users (email, pass, sum, created) VALUES ("ragozin@gagarin.sorry", "bututs_rules", 9999999, "2022-12-13 03:30:11") ON DUPLICATE KEY UPDATE email = "not_ragozin@gagarin.sorry";

-- Задание 8
show databases;

-- Задание 9
show tables;

-- Задание 10
desc users;

-- Задание 11
show create table users;

-- Задание 12
ALTER TABLE users ADD sex CHAR(7) DEFAULT 'unknown' AFTER pass;
ALTER TABLE users MODIFY COLUMN sex enum(
    'unknown',
    'M',
    'F'
);

-- Задание 13
ALTER TABLE users MODIFY COLUMN sum FLOAT(10, 2);

-- Задание 14
ALTER TABLE users RENAME COLUMN sum TO money;