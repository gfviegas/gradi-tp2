COPY cliente(id_cliente, regiao, estado, cidade, telefone, celular, sexo, cep, data_nasc) FROM '/data/csv/cliente.csv' WITH (FORMAT csv);
