-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-11-10 15:07:59.79

-- tables
-- Table: ano
CREATE TABLE ano (
  ano_id SERIAL NOT NULL,
  ano INT
);

-- Table: cliente
CREATE TABLE cliente (
  cliente_id INT NOT NULL,
  regiao VARCHAR(45),
  estado VARCHAR(45),
  cidade VARCHAR(45),
  telefone VARCHAR(45),
  celular VARCHAR(45),
  sexo CHAR(1),
  cep CHAR(9),
  data_nasc DATE
);

-- Table: seguro
CREATE TABLE seguro (
  seguro_id INT NOT NULL,
  valor_segurado DOUBLE PRECISION,
  premio DOUBLE PRECISION,
  ano_vigencia INT
);

-- Table: sinistro
CREATE TABLE sinistro (
  data_sinistro DATE,
  valor DOUBLE PRECISION,
  veiculo_id INT,
  ano_id INT,
  cliente_id INT,
  seguro_id INT
);

-- Table: veiculo
CREATE TABLE veiculo (
  veiculo_id INT NOT NULL,
  cor VARCHAR(45),
  valor_compra DOUBLE PRECISION,
  data_compra DATE,
  nome_modelo VARCHAR(45),
  nome_montadora VARCHAR(45),
  pais_origem_montadora VARCHAR(45)
);
