-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14/10/2024 às 02:18
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Banco de dados: `projeto_judo`

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
(2, '', 'Tani-otoshi', 1, 1, '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/3b9Me3Fohpk?si=84SUzu8r0v7lhnN-\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" r', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRQcK-D_Vn0XhbAxtCxVI9iADL9VOWovCxdA&s', ''),
(3, 'Técnica 1', 'Descrição da Técnica 1', 1, 1, 'https://www.youtube.com/embed/video1', 'https://example.com/imagem1.jpg', 'Autor 1'),
(4, 'Técnica 2', 'Descrição da Técnica 2', 2, 1, 'https://www.youtube.com/embed/video2', 'https://example.com/imagem2.jpg', 'Autor 2'),
(5, 'Técnica 3', 'Descrição da Técnica 3', 3, 1, 'https://www.youtube.com/embed/video3', 'https://example.com/imagem3.jpg', 'Autor 3'),
(6, 'Técnica 4', 'Descrição da Técnica 4', 4, 1, 'https://www.youtube.com/embed/video4', 'https://example.com/imagem4.jpg', 'Autor 4'),
(7, 'Técnica 5', 'Descrição da Técnica 5', 5, 1, 'https://www.youtube.com/embed/video5', 'https://example.com/imagem5.jpg', 'Autor 5'),
(8, 'Técnica 6', 'Descrição da Técnica 6', 6, 1, 'https://www.youtube.com/embed/video6', 'https://example.com/imagem6.jpg', 'Autor 6'),
(9, 'Técnica 7', 'Descrição da Técnica 7', 7, 1, 'https://www.youtube.com/embed/video7', 'https://example.com/imagem7.jpg', 'Autor 7'),
(10, 'Técnica 8', 'Descrição da Técnica 8', 8, 1, 'https://www.youtube.com/embed/video8', 'https://example.com/imagem8.jpg', 'Autor 8'),
(11, 'Técnica 9', 'Descrição da Técnica 9', 9, 1, 'https://www.youtube.com/embed/video9', 'https://example.com/imagem9.jpg', 'Autor 9'),
(12, 'Técnica 10', 'Descrição da Técnica 10', 10, 1, 'https://www.youtube.com/embed/video10', 'https://example.com/imagem10.jpg', 'Autor 10'),
(13, 'Técnica 11', 'Descrição da Técnica 11', 1, 2, 'https://www.youtube.com/embed/video11', 'https://example.com/imagem11.jpg', 'Autor 11'),
(14, 'Técnica 12', 'Descrição da Técnica 12', 2, 2, 'https://www.youtube.com/embed/video12', 'https://example.com/imagem12.jpg', 'Autor 12'),
(15, 'Técnica 13', 'Descrição da Técnica 13', 3, 2, 'https://www.youtube.com/embed/video13', 'https://example.com/imagem13.jpg', 'Autor 13'),
(16, 'Técnica 14', 'Descrição da Técnica 14', 4, 2, 'https://www.youtube.com/embed/video14', 'https://example.com/imagem14.jpg', 'Autor 14'),
(17, 'Técnica 15', 'Descrição da Técnica 15', 5, 2, 'https://www.youtube.com/embed/video15', 'https://example.com/imagem15.jpg', 'Autor 15'),
(18, 'Técnica 16', 'Descrição da Técnica 16', 6, 2, 'https://www.youtube.com/embed/video16', 'https://example.com/imagem16.jpg', 'Autor 16'),
(19, 'Técnica 17', 'Descrição da Técnica 17', 7, 2, 'https://www.youtube.com/embed/video17', 'https://example.com/imagem17.jpg', 'Autor 17'),
(20, 'Técnica 18', 'Descrição da Técnica 18', 8, 2, 'https://www.youtube.com/embed/video18', 'https://example.com/imagem18.jpg', 'Autor 18'),
(21, 'Técnica 19', 'Descrição da Técnica 19', 9, 2, 'https://www.youtube.com/embed/video19', 'https://example.com/imagem19.jpg', 'Autor 19'),
(22, 'Técnica 20', 'Descrição da Técnica 20', 10, 2, 'https://www.youtube.com/embed/video20', 'https://example.com/imagem20.jpg', 'Autor 20');


-- Estrutura para tabela `tb_faixa`
--

CREATE TABLE `tb_faixa` (
  `id_faixa` int(11) NOT NULL,
  `cor` varchar(255) NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Despejando dados para a tabela `tb_faixa`


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


-- Estrutura para tabela `tb_questao`
--

CREATE TABLE `tb_questao` (
  `id_questao` int(11) NOT NULL,
  `id_conteudo` int(11) NOT NULL,
  `questao_Um` varchar(255) DEFAULT NULL,
  `imagem_questao_Um` varchar(255) DEFAULT NULL,
  `txt_op1_Um` varchar(255) DEFAULT NULL,
  `txt_op2_Um` varchar(255) DEFAULT NULL,
  `txt_op3_Um` varchar(255) DEFAULT NULL,
  `txt_op4_Um` varchar(255) DEFAULT NULL,
  `op_correto_Um` varchar(255) DEFAULT NULL,
  `questao_Dois` varchar(255) DEFAULT NULL,
  `imagem_questao_Dois` varchar(255) DEFAULT NULL,
  `txt_op1_Dois` varchar(255) DEFAULT NULL,
  `txt_op2_Dois` varchar(255) DEFAULT NULL,
  `txt_op3_Dois` varchar(255) DEFAULT NULL,
  `txt_op4_Dois` varchar(255) DEFAULT NULL,
  `op_correto_Dois` varchar(255) DEFAULT NULL,
  `questao_Tres` varchar(255) DEFAULT NULL,
  `imagem_questao_Tres` varchar(255) DEFAULT NULL,
  `txt_op1_Tres` varchar(255) DEFAULT NULL,
  `txt_op2_Tres` varchar(255) DEFAULT NULL,
  `txt_op3_Tres` varchar(255) DEFAULT NULL,
  `txt_op4_Tres` varchar(255) DEFAULT NULL,
  `op_correto_Tres` varchar(255) DEFAULT NULL,
  `questao` varchar(255) DEFAULT NULL,
  `imagem_qu_Quatroestao_Quatro` varchar(255) DEFAULT NULL,
  `txt_op1_Quatro` varchar(255) DEFAULT NULL,
  `txt_op2_Quatro` varchar(255) DEFAULT NULL,
  `txt_op3_Quatro` varchar(255) DEFAULT NULL,
  `txt_op4_Quatro` varchar(255) DEFAULT NULL,
  `op_correto_Quatro` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Despejando dados para a tabela `tb_questao`


INSERT INTO `tb_questao` (`id_questao`, `id_conteudo`, `questao_Um`, `imagem_questao_Um`, `txt_op1_Um`, `txt_op2_Um`, `txt_op3_Um`, `txt_op4_Um`, `op_correto_Um`, `questao_Dois`, `imagem_questao_Dois`, `txt_op1_Dois`, `txt_op2_Dois`, `txt_op3_Dois`, `txt_op4_Dois`, `op_correto_Dois`, `questao_Tres`, `imagem_questao_Tres`, `txt_op1_Tres`, `txt_op2_Tres`, `txt_op3_Tres`, `txt_op4_Tres`, `op_correto_Tres`, `questao_Quatro`, `imagem_questao_Quatro`, `txt_op1_Quatro`, `txt_op2_Quatro`, `txt_op3_Quatro`, `txt_op4_Quatro`, `op_correto_Quatro`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


-- Estrutura para tabela `tb_questao_usuario`


CREATE TABLE `tb_questao_usuario` (
  `id_questaoU` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_questao` int(11) NOT NULL,
  `resposta_um` varchar(255) NOT NULL,
  `resposta_dois` varchar(255) NOT NULL,
  `resposta_tres` varchar(255) NOT NULL,
  `resposta_quatro` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


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


-- Despejando dados para a tabela `tb_usuario`


INSERT INTO `tb_usuario` (`id_usuario`, `nome`, `email`, `tipo`, `data_nascimento`, `faixa_atual`, `senha`) VALUES
(1, 'Teste', 'teste@teste.com', 0, '0000-00-00', 0, '$2b$10$45mZoz9TTXeN3xy6tBPL4eVo.ZXJwfxvg8bFeyrXvtpXYuO1vdBc.'),
(2, 'yasmin', 'yasmin@teste.com.br', 0, '0000-00-00', 0, '$2b$10$u6da/ARV0vhWWY0bFiX3SefhpXuytvu8rY1PaVrTL8vxQfyWcvbEy');

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
-- AUTO_INCREMENT de tabela `tb_conteudo`
--
ALTER TABLE `tb_conteudo`
  MODIFY `id_conteudo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `tb_faixa`
--
ALTER TABLE `tb_faixa`
  MODIFY `id_faixa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `tb_questao`
--
ALTER TABLE `tb_questao`
  MODIFY `id_questao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

-- Restrições para tabelas `tb_conteudo`
--
ALTER TABLE `tb_conteudo`
  ADD CONSTRAINT `tb_conteudo_ibfk_1` FOREIGN KEY (`id_faixa`) REFERENCES `tb_faixa` (`id_faixa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_conteudo_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;


