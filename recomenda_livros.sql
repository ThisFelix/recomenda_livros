-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 07-Dez-2017 às 00:10
-- Versão do servidor: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recomenda_livros`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `lista_livros`
--

CREATE TABLE `lista_livros` (
  `id_lista` int(11) NOT NULL,
  `cod_livro` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `lista_livros`
--

INSERT INTO `lista_livros` (`id_lista`, `cod_livro`, `cod_usuario`, `status`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 3),
(3, 2, 1, 2),
(5, 4, 3, 1),
(7, 1, 3, 2),
(26, 4, 2, 2),
(28, 5, 4, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

CREATE TABLE `livro` (
  `id_livro` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `genero` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `livro`
--

INSERT INTO `livro` (`id_livro`, `titulo`, `autor`, `genero`) VALUES
(1, 'O Código Da Vinci', 'Dan Brown', 'Suspense'),
(2, 'Laranja Mecânica', 'Anthony Burgess', 'Ficção Utópica e Distópica\r\n'),
(4, 'Forrest Gump', 'Winston Groom', 'Ficção'),
(5, 'Java Web', 'Giovanni Ravagnani', 'Programação');

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro_status`
--

CREATE TABLE `livro_status` (
  `id_status` int(11) NOT NULL,
  `descricao_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `livro_status`
--

INSERT INTO `livro_status` (`id_status`, `descricao_status`) VALUES
(1, 'Lido'),
(2, 'Leitura Não Iniciada'),
(3, 'Em Leitura');

-- --------------------------------------------------------

--
-- Estrutura da tabela `recomendacao`
--

CREATE TABLE `recomendacao` (
  `id_recomendacao` int(11) NOT NULL,
  `cod_recomendado` int(11) NOT NULL,
  `cod_livro` int(11) NOT NULL,
  `cod_recomendador` int(11) NOT NULL,
  `status_recomenda` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `recomendacao`
--

INSERT INTO `recomendacao` (`id_recomendacao`, `cod_recomendado`, `cod_livro`, `cod_recomendador`, `status_recomenda`) VALUES
(1, 3, 4, 3, 'Aceito'),
(2, 3, 1, 2, 'Aceito'),
(3, 3, 1, 3, 'Não Visualizado'),
(4, 3, 1, 1, 'Aceito'),
(5, 1, 1, 3, 'Recusado'),
(10, 2, 4, 3, 'Aceito');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `email`, `senha`, `nome`) VALUES
(1, 'felix@felix.com', '1234', 'Matheus'),
(2, 'thais.zottele@gmail.com', '123456', 'Thaís'),
(3, 'mat@felix.com', '1234', 'Matheus F.'),
(4, 'giovanni@ifsp.edu.br', '1234', 'Felix');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lista_livros`
--
ALTER TABLE `lista_livros`
  ADD PRIMARY KEY (`id_lista`),
  ADD KEY `cod_livro` (`cod_livro`),
  ADD KEY `cod_usuario` (`cod_usuario`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`id_livro`);

--
-- Indexes for table `livro_status`
--
ALTER TABLE `livro_status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `recomendacao`
--
ALTER TABLE `recomendacao`
  ADD PRIMARY KEY (`id_recomendacao`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lista_livros`
--
ALTER TABLE `lista_livros`
  MODIFY `id_lista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `livro`
--
ALTER TABLE `livro`
  MODIFY `id_livro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `livro_status`
--
ALTER TABLE `livro_status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `recomendacao`
--
ALTER TABLE `recomendacao`
  MODIFY `id_recomendacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `lista_livros`
--
ALTER TABLE `lista_livros`
  ADD CONSTRAINT `lista_livros_ibfk_1` FOREIGN KEY (`cod_livro`) REFERENCES `livro` (`id_livro`),
  ADD CONSTRAINT `lista_livros_ibfk_2` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `lista_livros_ibfk_3` FOREIGN KEY (`status`) REFERENCES `livro_status` (`id_status`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
