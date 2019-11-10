
-- primary keys
ALTER TABLE ano ADD PRIMARY KEY(ano_id);
ALTER TABLE cliente ADD PRIMARY KEY(cliente_id);
ALTER TABLE seguro ADD PRIMARY KEY(seguro_id);
ALTER TABLE sinistro ADD PRIMARY KEY(veiculo_id, ano_id, cliente_id, seguro_id);
ALTER TABLE veiculo ADD PRIMARY KEY(veiculo_id);

-- foreign keys
ALTER TABLE sinistro ADD CONSTRAINT ano_sinistro FOREIGN KEY (ano_id) REFERENCES ano (ano_id);
ALTER TABLE sinistro ADD CONSTRAINT cliente_sinistro FOREIGN KEY (cliente_id) REFERENCES cliente (cliente_id);
ALTER TABLE sinistro ADD CONSTRAINT seguro_sinistro FOREIGN KEY (seguro_id) REFERENCES seguro (seguro_id);
ALTER TABLE sinistro ADD CONSTRAINT veiculo_sinistro FOREIGN KEY (veiculo_id) REFERENCES veiculo (veiculo_id);
