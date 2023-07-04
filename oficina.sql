CREATE DATABASE db_oficina;

USE db_oficina;


-- ENTIDADES ESSENCIAIS
CREATE TABLE IF NOT EXISTS `db_oficina`.`tipo_logradouro` (
  `id_tipo_logradouro` INT NOT NULL AUTO_INCREMENT,
  `tipo_logradouro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_logradouro`))
ENGINE = InnoDB;

INSERT INTO tipo_logradouro	(tipo_logradouro)
	VALUES	('Rua'),
			('Avenida'),
            ('Alameda'),
            ('Travessa'),
            ('Rodovia'),
            ('Estrada');

CREATE TABLE IF NOT EXISTS `db_oficina`.`estado` (
  `id_estado` INT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NOT NULL,
  `sigla_estado` CHAR(2) NOT NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB;

INSERT INTO estado (estado, sigla_estado)
	VALUES	('Acre', 'AC'),
			('Alagoas', 'AL'),
			('Amapá', 'AP'),
			('Amazonas', 'AM'),
			('Bahia', 'BA'),
			('Ceará', 'CE'),
			('Distrito Federal', 'DF'),
			('Espírito Santo', 'ES'),
			('Goiás', 'GO'),
			('Maranhão', 'MA'),
			('Mato Grosso', 'MT'),
			('Mato Grosso do Sul', 'MS'),
			('Minas Gerais', 'MG'),
			('Pará', 'PA'),
			('Paraíba', 'PB'),
			('Paraná', 'PR'),
			('Pernambuco', 'PE'),
			('Piauí', 'PI'),
			('Rio de Janeiro', 'RJ'),
			('Rio Grande do Norte', 'RN'),
			('Rio Grande do Sul', 'RS'),
			('Rondônia', 'RO'),
			('Roraima', 'RR'),
			('Santa Catarina', 'SC'),
			('São Paulo', 'SP'),
			('Sergipe', 'SE'),
			('Tocantins', 'TO');

CREATE TABLE IF NOT EXISTS `db_oficina`.`equipe_especialidade` (
  `id_especialidade` INT NOT NULL AUTO_INCREMENT,
  `especialidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_especialidade`))
ENGINE = InnoDB;

INSERT INTO equipe_especialidade (especialidade)
	VALUES	('Mecatrônica'),
			('Funilaria'),
            ('Borracharia'),
            ('Pintura'),
            ('Elétrica');

CREATE TABLE IF NOT EXISTS `db_oficina`.`peca` (
  `id_peca` INT NOT NULL AUTO_INCREMENT,
  `nome_peca` VARCHAR(45) NULL,
  `valor_peca` FLOAT NULL,
  PRIMARY KEY (`id_peca`))
ENGINE = InnoDB;

INSERT INTO peca (nome_peca, valor_peca)
	VALUES	('Rebimboca da Parafuseta', '1500'),
			('Parafuso', 20),
            ('Porca', 10),
            ('Pneu', 50),
            ('Janela Dianteira', 250),
            ('Janela Traseira', 250),
            ('Janela Lateral', 150),
            ('Tinta', 120);

CREATE TABLE IF NOT EXISTS `db_oficina`.`servico` (
  `id_servico` INT NOT NULL AUTO_INCREMENT,
  `servico` VARCHAR(45) NOT NULL,
  `valor_servico` FLOAT NOT NULL,
  PRIMARY KEY (`id_servico`))
ENGINE = InnoDB;

INSERT INTO servico (servico, valor_servico)
	VALUES	('Pintura', 900),
			('Funilaria', 850),
            ('Troca de Pneu', 100),
            ('Troca de Vidro', 95),
            ('Substituição de Parafuso', 30),
            ('Enrolada no Cliente', 1300);

CREATE TABLE IF NOT EXISTS `db_oficina`.`ordem_servico_status` (
  `id_ordem_servico_status` INT NOT NULL AUTO_INCREMENT,
  `ordem_servico_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_ordem_servico_status`))
ENGINE = InnoDB;

INSERT INTO ordem_servico_status (ordem_servico_status)
	VALUES	('Em Análise'),
			('Aguardando Aprovação'),
            ('Orçamento Reprovado'),
            ('Orçamento Aprovado'),
            ('Pronto para Retirada'),
            ('Veículo Entregue');


-- DEMAIS ENTIDADES
CREATE TABLE IF NOT EXISTS `db_oficina`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome_cliente` VARCHAR(20) NOT NULL,
  `sobrenome_cliente` VARCHAR(50) NOT NULL,
  `cpf` CHAR(11) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `telefone_residencial` VARCHAR(20) NULL DEFAULT 'Null',
  `telefone_celular` VARCHAR(20) NOT NULL,
  `telefone_comercial` VARCHAR(20) NULL DEFAULT 'Null',
  PRIMARY KEY (`id_cliente`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;

INSERT INTO cliente (nome_cliente, sobrenome_cliente, cpf, email, telefone_residencial, telefone_celular, telefone_comercial)
VALUES ('Alice', 'Alves', '11111111111', 'alice.alves@gmail.com', Null, '1111111111', Null),
('Bruno', 'Barbosa', '22222222222', 'bruno.barbosa@gmail.com', '2222222222', '2222222222', Null),
('Carla', 'Cavalcante', '33333333333', 'carla.cavalcante@gmail.com', '3333333333', '3333333333', '3333333333'),
('Daniel', 'Dias', '44444444444', 'daniel.dias@hotmail.com', '4444444444', '4444444444', '4444444444'),
('Evelyn', 'Estrada', '55555555555', 'evelyn.estrada@hotmail.com', '5555555555', '5555555555', '5555555555'),
('Fernando', 'Ferreira', '66666666666', 'fernando.ferreira@hotmail.com', '6666666666', '6666666666', '6666666666'),
('Gabriela', 'Gonçalves', '77777777777', 'gabriela.goncalves@gmail.com', Null, '7777777777', Null),
('Henrique', 'Hernandez', '88888888888', 'henrique.hernandez@hotmail.com', Null, '8888888888', Null),
('Isabela', 'Ibrahim', '99999999999', 'isabela.ibrahim@gmail.com', Null, '9999999999', Null),
('João', 'Júnior', '00000000000', 'joao.junior@gmail.com', Null, '0000000000', Null);     


CREATE TABLE IF NOT EXISTS `db_oficina`.`veiculo` (
  `id_veiculo` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `tipo_veiculo` VARCHAR(45) NOT NULL,
  `modelo_veiculo` VARCHAR(45) NOT NULL,
  `marca_veiculo` VARCHAR(45) NOT NULL,
  `ano_veiculo` DATE NOT NULL,
  PRIMARY KEY (`id_veiculo`),
  INDEX `fk_veiculo_cliente1_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_veiculo_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `db_oficina`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO veiculo (id_cliente, tipo_veiculo, modelo_veiculo, marca_veiculo, ano_veiculo)
	VALUES	(1, 'Popular Hatch', 'Onix', 'Chevrolet', '2019-01-01'),
			(2, 'Popular Sedan', 'Corolla', 'Toyota', '2017-01-01'),
            (3, 'SUV', 'Q5', 'Audi', '2022-01-01'),
            (4, 'Utilitário', 'Hilux', 'Toyota', '2009-01-01'),
            (5, 'Utilitário', 'Ranger', 'Ford', '2000-01-01'),
            (6, 'Luxo Hatch', 'A3', 'Audi', '2018-01-01'),
            (7, 'Luxo Sedan', 'A6', 'Audi', '2020-01-01'),
            (8, 'Popular Sedan', 'Prisma', 'Chevrolet', '2000-01-01'),
            (9, 'Popular Sedan', 'Sandero', 'Renault', '2010-01-01'),
            (10, 'Popular Hatch', 'Uno', 'Fiat', '2018-01-01');
 
  CREATE TABLE IF NOT EXISTS `db_oficina`.`veiculo_servico` (
  `id_veiculo_servico` INT NOT NULL AUTO_INCREMENT,
  `id_veiculo` INT NOT NULL,
  `id_servico` INT NOT NULL,
  PRIMARY KEY (`id_veiculo_servico`, `id_veiculo`, `id_servico`),
  INDEX `fk_veiculo_servico_veiculo1_idx` (`id_veiculo` ASC) VISIBLE,
  INDEX `fk_veiculo_servico_servico1_idx` (`id_servico` ASC) VISIBLE,
  CONSTRAINT `fk_veiculo_servico_veiculo1`
    FOREIGN KEY (`id_veiculo`)
    REFERENCES `db_oficina`.`veiculo` (`id_veiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculo_servico_servico1`
    FOREIGN KEY (`id_servico`)
    REFERENCES `db_oficina`.`servico` (`id_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO veiculo_servico (id_veiculo, id_servico)
	VALUES	(21, 4),
			(22, 2),
            (23, 3),
            (24, 1),
            (25, 5),
            (26, 6),
            (27, 6),
            (28, 1),
            (29, 2),
            (30, 1);

CREATE TABLE IF NOT EXISTS `db_oficina`.`tabela_referencia` (
  `id_tabela_referencia` INT NOT NULL AUTO_INCREMENT,
  `id_servico` INT NOT NULL,
  `valor_servico` FLOAT NOT NULL,
  `tempo_conclusao` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_tabela_referencia`),
  INDEX `fk_tabela_referencia_servico1_idx` (`id_servico` ASC) VISIBLE,
  CONSTRAINT `fk_tabela_referencia_servico1`
    FOREIGN KEY (`id_servico`)
    REFERENCES `db_oficina`.`servico` (`id_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO tabela_referencia (id_servico, valor_servico, tempo_conclusao)
	VALUES	(1, 900, '5 dias'),
			(2, 850, '10 dias'),
            (3, 100, '1 dia'),
            (4, 95, '10 dias'),
            (5, 30, '8 dias'),
            (6, 1300, '45 dias');    


CREATE TABLE IF NOT EXISTS `db_oficina`.`equipe` (
  `id_equipe` INT NOT NULL AUTO_INCREMENT,
  `nome_equipe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_equipe`))
ENGINE = InnoDB;

INSERT INTO equipe (nome_equipe)
	VALUES	('Equipe Alfa'),
			('Equipe Beta'),
            ('Equipe Gama');

CREATE TABLE IF NOT EXISTS `db_oficina`.`endereco` (
  `id_endereco` INT NOT NULL AUTO_INCREMENT,
  `id_tipo_logradouro` INT NOT NULL,
  `logradouro` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `id_estado` INT NOT NULL,
  PRIMARY KEY (`id_endereco`),
  INDEX `fk_endereco_estado1_idx` (`id_estado` ASC) VISIBLE,
  INDEX `fk_endereco_tipo_logradouro1_idx` (`id_tipo_logradouro` ASC) VISIBLE,
  CONSTRAINT `fk_endereco_estado1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `db_oficina`.`estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_endereco_tipo_logradouro1`
    FOREIGN KEY (`id_tipo_logradouro`)
    REFERENCES `db_oficina`.`tipo_logradouro` (`id_tipo_logradouro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


INSERT INTO endereco (id_tipo_logradouro, logradouro, numero, complemento, bairro, cep, cidade, id_estado)
	VALUES	(1, 'Rua Alegria', '123', Null, 'Centro', '12345678', 'São Paulo', 25),
		(2, 'Avenida das Flores', '456', Null, 'Jardim Botânico', '12345678', 'São Paulo', 25),
		(3, 'Travessa da Paz', '789', Null, 'Vila Nova', '12345678', 'São Paulo', 25),
            	(4, 'Rua do Sol', '10', 'Apto 101', 'Centro', '12345678', 'São Paulo', 25),
            	(1, 'Avenida da Praia', '50', Null, 'Praia Grande', '12345678', 'São Paulo', 25),
            	(2, 'Rua dos Coqueiros', '789', Null, 'Jardim Tropical', '12345678', 'São Paulo', 25),
            	(3, 'Alameda das Palmeiras', '1234', Null, 'Jardim Botânico', '12345678', 'São Paulo', 25),
            	(4, 'Rua das Flores', '567', Null, 'Vila Bela', '12345678', 'São Paulo', 25),
            	(1, 'Avenida Principal', '987', Null, 'Centro', '12345678', 'Rio de Janeiro', 19),
            	(2, 'Rua das Montanhas', '654', 'Casa 123', 'Centro', '12345678', 'Belo Horizonte', 13);

CREATE TABLE IF NOT EXISTS `db_oficina`.`mecanico` (
  `id_mecanico` INT NOT NULL,
  `id_especialidade` INT NOT NULL,
  `id_equipe` INT NOT NULL,
  `id_endereco` INT NOT NULL,
  `nome_mecanico` VARCHAR(45) NOT NULL,
  `sobrenome_mecanico` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`id_mecanico`),
  INDEX `fk_mecanico_equipe_especialidade1_idx` (`id_especialidade` ASC) VISIBLE,
  INDEX `fk_mecanico_equipe1_idx` (`id_equipe` ASC) VISIBLE,
  INDEX `fk_mecanico_endereco1_idx` (`id_endereco` ASC) VISIBLE,
  CONSTRAINT `fk_mecanico_equipe_especialidade1`
    FOREIGN KEY (`id_especialidade`)
    REFERENCES `db_oficina`.`equipe_especialidade` (`id_especialidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mecanico_equipe1`
    FOREIGN KEY (`id_equipe`)
    REFERENCES `db_oficina`.`equipe` (`id_equipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mecanico_endereco1`
    FOREIGN KEY (`id_endereco`)
    REFERENCES `db_oficina`.`endereco` (`id_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE mecanico
MODIFY COLUMN id_mecanico INT NOT NULL AUTO_INCREMENT;

INSERT INTO mecanico (id_especialidade, id_equipe, id_endereco, nome_mecanico, sobrenome_mecanico)
	VALUES	(1, 1, 1, 'Carlos', 'Cavalcante'),
			(1, 2, 2, 'Daniel', 'Dias'),
            (2, 3, 3, 'Eduardo', 'Estrada'),
            (2, 1, 4, 'Fernando', 'Farias'),
            (3, 2, 5, 'Gabriel', 'Gonçalves'),
            (3, 3, 6, 'Henrique', 'Hernandes'),
            (4, 1, 7, 'Igor', 'Inácio'),
            (4, 2, 8, 'Jorge', 'Jesus'),
            (5, 3, 9, 'Kleber', 'Keller'),
            (5, 1, 10, 'Lucas', 'Lima');

CREATE TABLE IF NOT EXISTS `db_oficina`.`ordem_servico` (
  `id_ordem_servico` INT NOT NULL AUTO_INCREMENT,
  `numero_ordem_servico` INT NOT NULL,
  `id_ordem_servico_status` INT NOT NULL,
  `id_tabela_referencia` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `id_equipe` INT NOT NULL,
  `data_emissao` DATE NULL,
  `valor` FLOAT NULL,
  `ordem_servico_status` VARCHAR(45) NULL,
  `data_conclusao` DATE NULL,
  PRIMARY KEY (`id_ordem_servico`),
  INDEX `fk_ordem_servico_ordem_servico_status1_idx` (`id_ordem_servico_status` ASC) VISIBLE,
  INDEX `fk_ordem_servico_tabela_referencia1_idx` (`id_tabela_referencia` ASC) VISIBLE,
  INDEX `fk_ordem_servico_cliente1_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_ordem_servico_equipe1_idx` (`id_equipe` ASC) VISIBLE,
  CONSTRAINT `fk_ordem_servico_ordem_de_servico_status1`
    FOREIGN KEY (`id_ordem_servico_status`)
    REFERENCES `db_oficina`.`ordem_servico_status` (`id_ordem_servico_status`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_servico_tabela_referencia1`
    FOREIGN KEY (`id_tabela_referencia`)
    REFERENCES `db_oficina`.`tabela_referencia` (`id_tabela_referencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_servico_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `db_oficina`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_servico_equipe1`
    FOREIGN KEY (`id_equipe`)
    REFERENCES `db_oficina`.`equipe` (`id_equipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO ordem_servico (id_ordem_servico_status, numero_ordem_servico, id_tabela_referencia, id_cliente, id_equipe, data_emissao, valor, ordem_servico_status, data_conclusao)
	VALUES	(1, 1, 1, 1, 1, '2022-09-20', 900, 'Em Análise', CURRENT_TIMESTAMP),
			(1, 1, 2, 1, 1, '2022-09-20', 850, 'Em Análise', CURRENT_TIMESTAMP),
			(2, 2, 2, 2, 2, '2022-09-19', 850, 'Aguardando Aprovação', CURRENT_TIMESTAMP),
            (2, 2, 3, 2, 2, '2022-09-19', 100, 'Aguardando Aprovação', CURRENT_TIMESTAMP),
            (3, 3, 3, 3, 3, '2022-09-18', 100, 'Orçamento Reprovado', CURRENT_TIMESTAMP),
            (3, 3, 4, 3, 3, '2022-09-18', 95, 'Orçamento Reprovado', CURRENT_TIMESTAMP),
            (3, 3, 5, 3, 3, '2022-09-18', 30, 'Orçamento Reprovado', CURRENT_TIMESTAMP),
            (3, 3, 1, 3, 3, '2022-09-18', 900, 'Orçamento Reprovado', CURRENT_TIMESTAMP),
            (4, 4, 4, 4, 1, '2022-09-17', 95, 'Orçamento Aprovado', CURRENT_TIMESTAMP),
            (5, 5, 5, 5, 2, '2022-09-16', 30, 'Pronto para Retirada', CURRENT_TIMESTAMP),
            (6, 6, 6, 6, 3, '2022-09-15', 1300, 'Veículo Entregue', CURRENT_TIMESTAMP),
            (1, 7, 1, 7, 1, '2022-09-14', 900, 'Em Análise', CURRENT_TIMESTAMP),
            (2, 8, 2, 8, 2, '2022-09-13', 850, 'Aguardando Aprovação', CURRENT_TIMESTAMP),
            (3, 9, 3, 9, 3, '2022-12-09', 100, 'Orçamento Reprovado', CURRENT_TIMESTAMP),
            (4, 10, 4, 10, 1, '2022-11-09', 95, 'Orçamento Aprovado', CURRENT_TIMESTAMP);


SELECT * FROM peca;
SELECT * FROM ordem_servico;
    
CREATE TABLE IF NOT EXISTS `db_oficina`.`peca_ordem_servico` (
  `id_peca_ordem_servico` INT NOT NULL AUTO_INCREMENT,
  `id_peca` INT NOT NULL,
  `id_ordem_servico` INT NOT NULL,
  INDEX `fk_peca_has_ordem_servico_ordem_servico1_idx` (`id_ordem_servico` ASC) VISIBLE,
  INDEX `fk_peca_has_ordem_servico_peca1_idx` (`id_peca` ASC) VISIBLE,
  PRIMARY KEY (`id_peca_ordem_servico`),
  CONSTRAINT `fk_peca_has_ordem_servico_peca1`
    FOREIGN KEY (`id_peca`)
    REFERENCES `db_oficina`.`peca` (`id_peca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_peca_has_ordem_servico_ordem_servico1`
    FOREIGN KEY (`id_ordem_servico`)
    REFERENCES `db_oficina`.`ordem_servico` (`id_ordem_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO peca_ordem_servico (id_peca, id_ordem_servico)
	VALUES	(1, 16),
			(1, 23),
            (1, 27),
            (2, 17),
            (2, 18),
            (2, 28),
            (3, 19),
            (3, 20),
            (3, 29),
            (4, 21),
            (4, 24),
            (4, 30),
            (5, 22),
            (5, 25),
            (6, 26);
          

CREATE TABLE IF NOT EXISTS `db_oficina`.`servico_ordem_servico` (
  `id_servico_ordem_servico` INT NOT NULL AUTO_INCREMENT,
  `id_servico` INT NOT NULL,
  `id_ordem_servico` INT NOT NULL,
  PRIMARY KEY (`id_servico_ordem_servico`),
  INDEX `fk_servico_ordem_servico_servico1_idx` (`id_servico` ASC) VISIBLE,
  INDEX `fk_servico_ordem_servico_ordem_de_servico1_idx` (`id_ordem_servico` ASC) VISIBLE,
  CONSTRAINT `fk_servico_ordem_servico_servico1`
    FOREIGN KEY (`id_servico`)
    REFERENCES `db_oficina`.`servico` (`id_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servico_ordem_servico_ordem_servico1`
    FOREIGN KEY (`id_ordem_servico`)
    REFERENCES `db_oficina`.`ordem_servico` (`id_ordem_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SELECT * FROM ordem_servico;

SELECT id_servico, id_ordem_servico FROM servico
INNER JOIN ordem_servico WHERE id_tabela_referencia=servico.id_servico;

INSERT INTO servico_ordem_servico (id_servico, id_ordem_servico)
	VALUES	(1,	16),
			(1,	23),
			(1,	27),
			(2,	17),
			(2,	18),
			(2,	28),
			(3,	19),
			(3,	20),
			(3,	29),
			(4,	21),
			(4,	24),
			(4,	30),
			(5,	22),
			(5,	25),
			(6,	26);