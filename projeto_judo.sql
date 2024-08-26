-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/08/2024 às 21:15
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto_judo`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_conteudo`
--

CREATE TABLE `tb_conteudo` (
  `id_conteudo` int(11) NOT NULL,
  `conteudo` varchar(400) NOT NULL,
  `faixa` varchar(255) NOT NULL,
  `id_user` int(255) NOT NULL,
  `link_video` varchar(255) NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_faixa`
--

CREATE TABLE `tb_faixa` (
  `id_faixa` int(11) NOT NULL,
  `cor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_faixa`
--

INSERT INTO `tb_faixa` (`id_faixa`, `cor`) VALUES
(1, 'Branca'),
(2, 'Cinza'),
(3, 'Azul'),
(4, 'Amarela'),
(5, 'Laranja'),
(6, 'Verde'),
(7, 'Roxa'),
(8, 'Marrom'),
(9, 'Preta'),
(10, 'Coral'),
(11, 'Vermelha');

-- --------------------------------------------------------

--
-- Estrutura para tabela `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `tipo` tinyint(1) NOT NULL,
  `data_nascimento` date NOT NULL,
  `faixa atual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_conteudo`
--
ALTER TABLE `tb_conteudo`
  ADD PRIMARY KEY (`id_conteudo`);

--
-- Índices de tabela `tb_faixa`
--
ALTER TABLE `tb_faixa`
  ADD PRIMARY KEY (`id_faixa`);

--
-- Índices de tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_conteudo`
--
ALTER TABLE `tb_conteudo`
  MODIFY `id_conteudo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_faixa`
--
ALTER TABLE `tb_faixa`
  MODIFY `id_faixa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
