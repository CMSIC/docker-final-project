DROP DATABASE IF EXISTS `mydb_test`;

CREATE DATABASE `mydb_test`;

use mydb_test;

DROP TABLE IF EXISTS baba;

CREATE TABLE baba (
                         id int,
                         name VARCHAR(255)
);

INSERT INTO baba(id, name) VALUES
                                  (1,'Adib'),
                                  (2,'Baba'),
                                  (3,'Cacou');