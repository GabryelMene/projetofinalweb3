CREATE DATABASE sistema_java;

USE sistema_java;

CREATE TABLE `tb_usuarios` (
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `nome` VARCHAR(150),
    `fotoPerfil` BLOB,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `emailRecuperacao` VARCHAR(100) UNIQUE,
    `senha` TEXT NOT NULL,
    `descricao` VARCHAR(300),
    `endereçoProdutoRegistrado` VARCHAR(30),
    `novidades` TINYINT(1) NOT NULL,
    `perfilPrivado` TINYINT(1) DEFAULT 0
)	ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO tb_usuarios(nome, email, senha, novidades)
values
("admim", "admim@admim", sha1("ADMIM@123"), 0);

SELECT * FROM tb_usuarios;
