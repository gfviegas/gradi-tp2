-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-11-10 15:07:59.79

-- tables
-- Table: ano
CREATE TABLE ano (
    ano_id int  NOT NULL,
    ano int  NOT NULL,
    CONSTRAINT ano_pk PRIMARY KEY (ano_id)
);

-- Table: cliente
CREATE TABLE cliente (
    cliente_id int  NOT NULL,
    regiao varchar(45)  NOT NULL,
    estado varchar(45)  NOT NULL,
    cidade varchar(45)  NOT NULL,
    telefone varchar(45)  NOT NULL,
    celular varchar(45)  NOT NULL,
    sexo char(1)  NOT NULL,
    cep char(9)  NOT NULL,
    data_nasc date  NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY (cliente_id)
);

-- Table: seguro
CREATE TABLE seguro (
    seguro_id int  NOT NULL,
    valor_segurado double precision[]  NOT NULL,
    premio double precision[]  NOT NULL,
    ano_vigencia int  NOT NULL,
    CONSTRAINT seguro_pk PRIMARY KEY (seguro_id)
);

-- Table: sinistro
CREATE TABLE sinistro (
    data_sinistro date  NOT NULL,
    valor double precision  NOT NULL,
    veiculo_id int  NOT NULL,
    ano_id int  NOT NULL,
    cliente_id int  NOT NULL,
    seguro_id int  NOT NULL,
    CONSTRAINT sinistro_pk PRIMARY KEY (veiculo_id,ano_id,cliente_id,seguro_id)
);

-- Table: veiculo
CREATE TABLE veiculo (
    veiculo_id int  NOT NULL,
    cor varchar(45)  NOT NULL,
    valor_compra double precision  NOT NULL,
    data_compra date  NOT NULL,
    nome_modelo varchar(45)  NOT NULL,
    nome_montadora varchar(45)  NOT NULL,
    pais_origem_montadora varchar(45)  NOT NULL,
    CONSTRAINT veiculo_pk PRIMARY KEY (veiculo_id)
);

-- foreign keys
-- Reference: ano_sinistro (table: sinistro)
ALTER TABLE sinistro ADD CONSTRAINT ano_sinistro
    FOREIGN KEY (ano_id)
    REFERENCES ano (ano_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: cliente_sinistro (table: sinistro)
ALTER TABLE sinistro ADD CONSTRAINT cliente_sinistro
    FOREIGN KEY (cliente_id)
    REFERENCES cliente (cliente_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: seguro_sinistro (table: sinistro)
ALTER TABLE sinistro ADD CONSTRAINT seguro_sinistro
    FOREIGN KEY (seguro_id)
    REFERENCES seguro (seguro_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: veiculo_sinistro (table: sinistro)
ALTER TABLE sinistro ADD CONSTRAINT veiculo_sinistro
    FOREIGN KEY (veiculo_id)
    REFERENCES veiculo (veiculo_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

