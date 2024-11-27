USE leafdb;

CREATE TABLE `tb_produtos` (
    `id` NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `nome` VARCHAR(150) NOT NULL,
    `descricao` VARCHAR(300), 
    `preco` DOUBLE NOT NULL,

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; 
