USE leafdb; 

CREATE TABLE `tb_produtosRegistrados` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `idUsuario_registrados` INT NOT NULL, 
    `idProduto_registrados` INT NOT NULL,
    `data` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),

    CONSTRAINT `idUsuario_registrados` FOREIGN KEY (`idUsuario_registrados`) REFERENCES `tb_usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `idProduto_registrados` FOREIGN KEY (`idProduto_registrados`) REFERENCES `tb_produtos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SHOW TABLES; 