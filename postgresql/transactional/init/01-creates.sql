SET client_min_messages TO ERROR;

CREATE TABLE IF NOT EXISTS montadora(
  id_montadora INT NOT NULL,
  nome VARCHAR(45),
  pais_origem VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS modelo(
  id_modelo INT NOT NULL,
  nome VARCHAR(45),
  montadora_id_montadora INT NOT NULL
);

CREATE TABLE cliente(
  id_cliente INT NOT NULL,
  regiao VARCHAR(45),
  estado VARCHAR(45),
  cidade VARCHAR(45),
  telefone VARCHAR(45),
  celular VARCHAR(45),
  sexo CHAR(1),
  cep CHAR(9),
  data_nasc DATE
);

CREATE TABLE carro(
  id_carro INT NOT NULL,
  cor VARCHAR(45),
  valor_compra DOUBLE PRECISION,
  data_compra DATE,
  modelo_id_modelo INT NOT NULL,
  cliente_id_cliente INT NOT NULL
);

CREATE TABLE seguro(
  id_seguro INT NOT NULL,
  valor_segurado DOUBLE PRECISION,
  premio DOUBLE PRECISION,
  ano_vigencia INT,
  carro_id_carro INT NOT NULL
);

CREATE TABLE sinistro(
  id_sinistro INT NOT NULL,
  data_sinistro DATE,
  valor DOUBLE PRECISION,
  carro_id_carro INT NOT NULL
);
