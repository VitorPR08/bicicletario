-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08/12/2025 às 16:41
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
-- Banco de dados: `bicicletario`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `bicicletas`
--

CREATE TABLE `bicicletas` (
  `id_bicicleta` int(11) NOT NULL,
  `modalidade` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `seminova` char(1) NOT NULL,
  `cor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `bicicletas`
--

INSERT INTO `bicicletas` (`id_bicicleta`, `modalidade`, `marca`, `seminova`, `cor`) VALUES
(1, 'mtb', 'caloi', 's', 'cinza'),
(2, 'speed', 'caloi', 's', 'preta'),
(3, 'gravel', 'shimano', 'n', 'verde');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `telefone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `endereco`, `telefone`) VALUES
(1, 'vitor pinzon', 'rua santana', '424636'),
(3, 'matehus', 'sao borja', '134124124'),
(4, 'rodrigo', 'centro', '134353943');

-- --------------------------------------------------------

--
-- Estrutura para tabela `consertos`
--

CREATE TABLE `consertos` (
  `id_conserto` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_bicicleta` int(11) NOT NULL,
  `descricao_servico` varchar(111) NOT NULL,
  `data` date NOT NULL,
  `preco` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `consertos`
--

INSERT INTO `consertos` (`id_conserto`, `id_cliente`, `id_bicicleta`, `descricao_servico`, `data`, `preco`) VALUES
(1, 1, 1, 'limpeza geral e troca de quadro', '2025-12-07', 1000),
(3, 4, 3, 'troca de todos os componentes ', '2025-12-18', 2000),
(4, 4, 3, 'limpeza da bicicleta', '2025-12-22', 90);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `bicicletas`
--
ALTER TABLE `bicicletas`
  ADD PRIMARY KEY (`id_bicicleta`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `consertos`
--
ALTER TABLE `consertos`
  ADD PRIMARY KEY (`id_conserto`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_bicicleta` (`id_bicicleta`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `bicicletas`
--
ALTER TABLE `bicicletas`
  MODIFY `id_bicicleta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `consertos`
--
ALTER TABLE `consertos`
  MODIFY `id_conserto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `consertos`
--
ALTER TABLE `consertos`
  ADD CONSTRAINT `consertos_ibfk_1` FOREIGN KEY (`id_bicicleta`) REFERENCES `bicicletas` (`id_bicicleta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consertos_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
