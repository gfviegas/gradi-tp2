SELECT
	an.ano_id,
	cr.id_carro AS veiculo_id,
	sg.id_seguro AS seguro_id,
	cl.id_cliente AS cliente_id,
	sn.data_sinistro,
	sn.valor
FROM sinistro sn
INNER JOIN carro cr ON sn.carro_id_carro = cr.id_carro
INNER JOIN seguro sg ON sg.carro_id_carro = cr.id_carro AND sg.ano_vigencia = EXTRACT(YEAR FROM sn.data_sinistro)
INNER JOIN (
  SELECT
    ROW_NUMBER() OVER () AS ano_id,
    EXTRACT(YEAR FROM data_sinistro) AS ano
  FROM sinistro
    GROUP BY ano
    ORDER BY ano
  ) an ON EXTRACT(YEAR FROM sn.data_sinistro) = an.ano
INNER JOIN cliente cl ON cr.cliente_id_cliente = cl.id_cliente
