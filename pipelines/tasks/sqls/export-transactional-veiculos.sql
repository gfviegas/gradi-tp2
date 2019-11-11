SELECT
	md.nome AS nome_modelo,
	mn.nome AS nome_montadora,
	mn.pais_origem AS pais_origem_montadora,
  cr.id_carro AS veiculo_id,
	cr.cor,
	cr.valor_compra,
	cr.data_compra
FROM carro cr
	INNER JOIN modelo md ON cr.modelo_id_modelo = md.id_modelo
	INNER JOIN montadora mn ON md.montadora_id_montadora = mn.id_montadora
