-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02/10/2024 às 15:03
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
  `titulo` varchar(100) NOT NULL,
  `conteudo` varchar(400) NOT NULL,
  `id_faixa` int(255) NOT NULL,
  `id_user` int(255) NOT NULL,
  `link_video` varchar(255) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `autor` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_conteudo`
--

INSERT INTO `tb_conteudo` (`id_conteudo`, `titulo`, `conteudo`, `id_faixa`, `id_user`, `link_video`, `imagem`, `autor`) VALUES
(1, '', 'Tani-otoshi', 1, 1, 'https://www.youtube.com/embed/3b9Me3Fohpk?si=gm3CWnLLhPcj0DIh', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRQcK-D_Vn0XhbAxtCxVI9iADL9VOWovCxdA&s', ' KODOKAN'),
(2, '', 'Tani-otoshi', 1, 1, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/3b9Me3Fohpk?si=84SUzu8r0v7lhnN-\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" r', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRQcK-D_Vn0XhbAxtCxVI9iADL9VOWovCxdA&s', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_faixa`
--

CREATE TABLE `tb_faixa` (
  `id_faixa` int(11) NOT NULL,
  `cor` varchar(255) NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_faixa`
--

INSERT INTO `tb_faixa` (`id_faixa`, `cor`, `imagem`) VALUES
(1, 'Branca/Cinza', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRQcK-D_Vn0XhbAxtCxVI9iADL9VOWovCxdA&s'),
(2, 'Cinza/Azul', 'https://i.pinimg.com/236x/b0/11/ca/b011caa5627c6d2e4357bc2f2520cf64.jpg'),
(3, 'Azul/Amarela', 'https://i.pinimg.com/236x/bd/b0/41/bdb041b0169fc462a61ed162fad2b5ca.jpg'),
(4, 'Amarela/Laranja', 'https://i.pinimg.com/236x/e8/1a/14/e81a149f68b302f320c526f6bd1f270e.jpg'),
(5, 'Laranja/Verde', ''),
(6, 'Verde/Roxa', ''),
(7, 'Roxa/Marrom', ''),
(8, 'Marrom/Preta', ''),
(9, 'Preta/Coral', ''),
(10, 'Coral/Vermelha', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_questao`
--

CREATE TABLE `tb_questao` (
  `id_questao` int(11) NOT NULL,
  `id_material` int(11) NOT NULL,
  `questao` varchar(255) NOT NULL,
  `imagem_questao` varchar(255) NOT NULL,
  `txt_op1` varchar(255) NOT NULL,
  `txt_op2` varchar(255) NOT NULL,
  `txt_op3` varchar(255) NOT NULL,
  `txt_op4` varchar(255) NOT NULL,
  `op_correto` varchar(255) NOT NULL,
  `verificado` tinyint(1) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_questao_usuario`
--

CREATE TABLE `tb_questao_usuario` (
  `id_questaoU` int(11) NOT NULL,
  `resposta` varchar(255) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_questao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `tipo` tinyint(1) NOT NULL,
  `data_nascimento` date NOT NULL,
  `faixa_atual` int(11) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`id_usuario`, `nome`, `email`, `tipo`, `data_nascimento`, `faixa_atual`, `senha`) VALUES
(1, 'Teste', 'teste@teste.com', 0, '0000-00-00', 0, '$2b$10$45mZoz9TTXeN3xy6tBPL4eVo.ZXJwfxvg8bFeyrXvtpXYuO1vdBc.'),
(2, 'yasmin', 'yasmin@teste.com.br', 0, '0000-00-00', 0, '$2b$10$u6da/ARV0vhWWY0bFiX3SefhpXuytvu8rY1PaVrTL8vxQfyWcvbEy');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_conteudo`
--
ALTER TABLE `tb_conteudo`
  ADD PRIMARY KEY (`id_conteudo`),
  ADD KEY `tb_conteudo_ibfk_2` (`id_user`),
  ADD KEY `tb_conteudo_ibfk_1` (`id_faixa`);

--
-- Índices de tabela `tb_faixa`
--
ALTER TABLE `tb_faixa`
  ADD PRIMARY KEY (`id_faixa`);

--
-- Índices de tabela `tb_questao`
--
ALTER TABLE `tb_questao`
  ADD PRIMARY KEY (`id_questao`);

--
-- Índices de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_conteudo`
--
ALTER TABLE `tb_conteudo`
  MODIFY `id_conteudo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_faixa`
--
ALTER TABLE `tb_faixa`
  MODIFY `id_faixa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `tb_questao`
--
ALTER TABLE `tb_questao`
  MODIFY `id_questao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_conteudo`
--
ALTER TABLE `tb_conteudo`
  ADD CONSTRAINT `tb_conteudo_ibfk_1` FOREIGN KEY (`id_faixa`) REFERENCES `tb_faixa` (`id_faixa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_conteudo_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
