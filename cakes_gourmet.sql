-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/11/2024 às 01:58
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cakes_gourmet`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `data_nasc` date NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `tel_1` varchar(11) NOT NULL,
  `tel_2` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `data_nasc`, `cpf`, `tel_1`, `tel_2`) VALUES
(1, 'DOUGLAS ANDRADE', '1998-06-14', '26538350020', '19971688236', '33333333333');

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `rua` varchar(100) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `endereco`
--

INSERT INTO `endereco` (`id_endereco`, `cep`, `rua`, `numero`, `bairro`, `cidade`, `uf`, `id_cliente`) VALUES
(1, '13349031', 'RUA ARISTI BARNABÉ', 316, 'JARDIM DAS GAIVOTAS', 'INDAIATUBA', 'SP', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `valor` float NOT NULL,
  `pagamento` varchar(45) NOT NULL,
  `data_pedido` datetime NOT NULL,
  `descricao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_cliente`, `valor`, `pagamento`, `data_pedido`, `descricao`) VALUES
(1, 1, 31, 'cartao', '2024-11-06 00:58:51', NULL),
(2, 1, 12.2, 'pix', '2024-11-06 02:26:37', NULL),
(3, 1, 73.7, 'pix', '2024-11-06 02:58:47', NULL),
(4, 1, 15.2, 'cartao', '2024-11-11 23:07:43', NULL),
(5, 1, 76.5, 'pix', '2024-11-18 23:05:51', NULL),
(6, 1, 15.6, 'pix', '2024-11-24 00:27:18', NULL),
(7, 1, 25.5, 'cartao', '2024-11-24 01:28:06', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_produto`
--

CREATE TABLE `pedido_produto` (
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `pedido_produto`
--

INSERT INTO `pedido_produto` (`id_pedido`, `id_cliente`, `id_produto`, `quantidade`) VALUES
(1, 1, 3, 1),
(1, 1, 4, 1),
(2, 1, 2, 1),
(3, 1, 2, 1),
(3, 1, 3, 3),
(4, 1, 12, 2),
(5, 1, 3, 3),
(6, 1, 4, 1),
(7, 1, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `preco` float NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `img` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `nome`, `preco`, `descricao`, `img`) VALUES
(1, 'Cake de Chocolate', 18.3, '500g', 'cf_01.webp'),
(2, 'Cake de Baunilha', 35.2, '5 unidade 300g', 'cf_02.webp'),
(3, 'Cakes Sortidos vários sabores', 25.5, '5 unidades', 'cf_03.webp'),
(4, 'Cake Morango com Cereja', 15.6, '2 unidades', 'cf_04.webp'),
(5, 'Cake Chocolate com Creme de Cereja ', 25.9, '2 unidades', 'cf_05.webp'),
(6, 'Cake de Laranja', 44.6, '3 Unidades', 'cf_06.webp'),
(7, 'Cake de Laranja Cobertura de Morango', 38.3, '2 unidades 500g', 'cf_07.webp'),
(8, 'Cakes Sortidos', 62.9, '7 unidades 550g', 'cf_08.webp'),
(9, 'Cake Broa de Fubá', 55.5, '8 unidades 500g', 'cf_09.webp'),
(10, 'Cake Ninho', 10.5, '3 unidades 750g', 'cf_10.webp'),
(11, 'Cake da Criançada ', 15.2, '3 unidades 500g', 'cf_11.webp'),
(12, 'Cake Tradicional', 7.6, '1 unidade 500g', 'cf_12.webp');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  `senha` varchar(120) NOT NULL,
  `cod_conf` int(6) DEFAULT NULL,
  `status` char(1) DEFAULT '1',
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `email`, `senha`, `cod_conf`, `status`, `id_cliente`) VALUES
(1, 'DOUGLAS100ANDRADE@GMAIL.COM', 'e40521fd4ee74fd6c3dd7582bec9ddde', NULL, '1', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`,`id_cliente`),
  ADD KEY `fk_endereco_cliente1_idx` (`id_cliente`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`,`id_cliente`),
  ADD KEY `fk_pedido_cliente1_idx` (`id_cliente`);

--
-- Índices de tabela `pedido_produto`
--
ALTER TABLE `pedido_produto`
  ADD PRIMARY KEY (`id_pedido`,`id_cliente`,`id_produto`),
  ADD KEY `fk_pedido_has_produto_produto1_idx` (`id_produto`),
  ADD KEY `fk_pedido_has_produto_pedido1_idx` (`id_pedido`,`id_cliente`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`,`id_cliente`),
  ADD KEY `fk_usuario_cliente1_idx` (`id_cliente`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `fk_endereco_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `pedido_produto`
--
ALTER TABLE `pedido_produto`
  ADD CONSTRAINT `fk_pedido_has_produto_pedido1` FOREIGN KEY (`id_pedido`,`id_cliente`) REFERENCES `pedido` (`id_pedido`, `id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedido_has_produto_produto1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
