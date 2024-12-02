USE leafdb;

CREATE TABLE IF NOT EXISTS `tb_produtos` (
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    `nome` VARCHAR(150) NOT NULL, 
    `imagem` VARCHAR(255) NOT NULL,
    `marca` VARCHAR(50) NOT NULL,
    `modelo` VARCHAR(50) NOT NULL,
    `descricao` TEXT NOT NULL, 
    `enderecoProduto` VARCHAR(30), 
    `preco` DOUBLE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; 

INSERT INTO tb_produtos (nome, imagem, marca, modelo, descricao, enderecoProduto, preco) 
VALUES ("MacBook", "https://images.pexels.com/photos/812264/pexels-photo-812264.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", "Apple", "Air M3", "MacBook, fino, portátil e poderoso.", "AS-2F-XA-FA-61-AB", 5000); 

INSERT INTO tb_produtos (nome, imagem, marca, modelo, descricao, enderecoProduto, preco) 
VALUES ("Teclado mecânico", "https://images.kabum.com.br/produtos/fotos/447928/teclado-mecanico-gamer-logitech-g-g413-tkl-se-usb-anti-ghosting-abnt2-preto-920-010562_1723141603_g.jpg", "Logitech", "G413", "Teclado switch tátil", "SF-14-ZF-F9-O1-AB", 249.99); 

INSERT INTO tb_produtos (nome, imagem, marca, modelo, descricao, enderecoProduto, preco) 
VALUES ("PC Gamer", "https://m.media-amazon.com/images/I/6109CjoWCKL._AC_UF894,1000_QL80_.jpg", "Extra Pc's", "Pc x1", "Computador Gamer RGB Intel Core i5 8GB SSD 512GB Kit Gamer com Headset Monitor 20 Windows 10", "XA-16-GF-1D-51-AB", 1729.99);

INSERT INTO tb_produtos (nome, imagem, marca, modelo, descricao, enderecoProduto, preco) 
VALUES ("Mouse gamer", "https://m.media-amazon.com/images/I/61UxfXTUyvL._AC_UF894,1000_QL80_.jpg", "Logitech", "G203", "Mouse Gamer Logitech G203 LIGHTSYNC RGB, Efeito de Ondas de Cores, 6 Botões Programáveis e Até 8.000 DPI - Preto", "LG-SW-JA-8Q-LZ-AB", 99.99);

INSERT INTO tb_produtos (nome, imagem, marca, modelo, descricao, enderecoProduto, preco) 
VALUES ("Console Xbox", "https://m.media-amazon.com/images/I/51pNvD-nsvL.jpg", "Xbox", "Series S", "Console Xbox Series S", "XX-SA-JP-89-LL-AB", 2599.99);

INSERT INTO tb_produtos (nome, imagem, marca, modelo, descricao, enderecoProduto, preco) 
VALUES ("Console Playstation 5", "https://m.media-amazon.com/images/I/41bsdF9lMPL._AC_UF1000,1000_QL80_.jpg", "Sony", "Playstation 5", "Console PlayStation 5 ", "OP-SI-PQ-P1-XA-AB", 3950.99);

SHOW TABLES; 

