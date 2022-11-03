CREATE DATABASE db_blog;

CREATE TABLE tb_users (
	id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(30),
    user_email VARCHAR(30),
    user_password VARCHAR(30),
    user_role VARCHAR(30)
);

CREATE TABLE tb_posts (
	id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    title VARCHAR(30),
    content TEXT,
    moment DATETIME,
    FOREIGN KEY (user_id) REFERENCES tb_users(id)
);

CREATE TABLE tb_comments(
	id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    content VARCHAR(100),
    moment DATETIME,
    commentStatus VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES tb_users(id),
    FOREIGN KEY (post_id) REFERENCES tb_posts(id)
);

DROP TABLE tb_posts;

