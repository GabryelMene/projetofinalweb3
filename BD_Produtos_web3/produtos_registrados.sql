USE leafdb; 

CREATE TABLE IF NOT EXISTS `tb_produtosVinculados` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `idUsuario` INT NOT NULL, 
    `idProduto` INT NOT NULL,
    `enderecoProduto` VARCHAR(30) NOT NULL,
    `nomeUsuario` VARCHAR(255) NOT NULL,
    `nomeProduto` VARCHAR(255) NOT NULL,
    `data` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SHOW TABLES; 
