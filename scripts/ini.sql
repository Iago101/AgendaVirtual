CREATE DATABASE `agenda` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE agenda;

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  unique(`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tarefas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_usuario` int(11),
  `titulo` varchar(20) DEFAULT NULL,
  `descricao` varchar(20) DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  `data_conclusao` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY ( `fk_usuario` ) REFERENCES `usuarios` ( `id` )
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* ALTER TABLE `tarefas` ADD CONSTRAINT `fk_usuario` FOREIGN KEY ( `id` ) REFERENCES `usuarios` ( `id` ) ; */

desc `tarefas`;