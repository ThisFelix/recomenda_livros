--
-- Database: `gerenciadordeatividades`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividade`
--

CREATE TABLE `atividade` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `corpo` longtext NOT NULL,
  `data` varchar(255) NOT NULL,
  `cod_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `atividade`
--

INSERT INTO `atividade` (`id`, `titulo`, `corpo`, `data`, `cod_user`) VALUES
(8, 'FÃ©lix', '12345678784545', '2017-09-07', 1),
(9, 'aaaaaaa', 'wwwwwwwwwwwwww', '2017-09-13', 1),
(10, 'POE', 'ajspofapjf pwe pojerk', '2017-09-23', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `correcao`
--

CREATE TABLE `correcao` (
  `id` int(11) NOT NULL,
  `nota` int(11) NOT NULL,
  `observacao` longtext NOT NULL,
  `id_atividade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `senha` int(15) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `dataNasc` date NOT NULL,
  `endereco` varchar(30) NOT NULL,
  `corretor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `senha`, `nome`, `dataNasc`, `endereco`, `corretor`) VALUES
(1, 'teste@teste.com', 1234, 'Félix', '1996-12-02', 'rua sei la', 1),
(2, 'teste@felix.com', 4567, 'Carlos', '2017-09-19', 'rua abc', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atividade`
--
ALTER TABLE `atividade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `correcao`
--
ALTER TABLE `correcao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_atividade` (`id_atividade`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atividade`
--
ALTER TABLE `atividade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `correcao`
--
ALTER TABLE `correcao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `correcao`
--
ALTER TABLE `correcao`
  ADD CONSTRAINT `correcao_ibfk_1` FOREIGN KEY (`id_atividade`) REFERENCES `atividade` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
