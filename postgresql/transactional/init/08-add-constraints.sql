ALTER TABLE montadora ADD PRIMARY KEY(id_montadora);
ALTER TABLE modelo ADD PRIMARY KEY(id_modelo);
ALTER TABLE cliente ADD PRIMARY KEY(id_cliente);
ALTER TABLE carro ADD PRIMARY KEY(id_carro);
ALTER TABLE seguro ADD PRIMARY KEY(id_seguro);
ALTER TABLE sinistro ADD PRIMARY KEY(id_sinistro);

ALTER TABLE modelo ADD CONSTRAINT modelo_id_montadora_fk FOREIGN KEY (montadora_id_montadora) REFERENCES montadora(id_montadora);
ALTER TABLE carro ADD CONSTRAINT carro_id_modelo_fk FOREIGN KEY (modelo_id_modelo) REFERENCES modelo(id_modelo);
ALTER TABLE carro ADD CONSTRAINT carro_id_cliente_fk FOREIGN KEY (cliente_id_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE seguro ADD CONSTRAINT seguro_id_carro_fk FOREIGN KEY (carro_id_carro) REFERENCES carro(id_carro);
ALTER TABLE sinistro ADD CONSTRAINT sinistro_id_carro_fk FOREIGN KEY (carro_id_carro) REFERENCES carro(id_carro);
