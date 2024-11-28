USE leafdb;

CREATE TABLE `tb_produtos` (
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    `nome` VARCHAR(150) NOT NULL, 
    `imagem` LONGBLOB,
    `marca` VARCHAR(50) NOT NULL,
    `modelo` VARCHAR(50) NOT NULL,
    `descricao` VARCHAR(300) NOT NULL, 
    `enderecoProduto` VARCHAR(30), 
    `preco` DOUBLE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; 

SHOW TABLES; 

