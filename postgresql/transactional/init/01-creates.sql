CREATE TABLE IF NOT EXISTS montadora(
  id_montadora INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  pais_origem VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS modelo(
  id_modelo INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  montadora_id_montadora INT NOT NULL
);

CREATE TABLE cliente(
  id_cliente INT NOT NULL,
  regiao VARCHAR(45) NOT NULL,
  estado VARCHAR(45) NOT NULL,
  cidade VARCHAR(45) NOT NULL,
  telefone VARCHAR(45) NOT NULL,
  celular VARCHAR(45) NOT NULL,
  sexo CHAR(1) NOT NULL,
  cep CHAR(9) NOT NULL,
  data_nasc DATE NOT NULL
);

CREATE TABLE carro(
  id_carro INT NOT NULL,
  cor VARCHAR(45) NOT NULL,
  valor_compra DOUBLE PRECISION NOT NULL,
  data_compra DATE NOT NULL,
  modelo_id_modelo INT NOT NULL,
  cliente_id_cliente INT NOT NULL
);

CREATE TABLE seguro(
  id_seguro INT NOT NULL,
  valor_segurado DOUBLE PRECISION NOT NULL,
  premio DOUBLE PRECISION NOT NULL,
  ano_vigencia INT NOT NULL,
  carro_id_carro INT NOT NULL
);

CREATE TABLE sinistro(
  id_sinistro INT NOT NULL,
  data_sinistro DATE NOT NULL,
  valor DOUBLE PRECISION NOT NULL,
  carro_id_carro INT NOT NULL
);
