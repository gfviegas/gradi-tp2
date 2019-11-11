SELECT
	id_seguro as seguro_id,
	valor_segurado,
	premio,
	ano_vigencia
FROM seguro
GROUP BY carro_id_carro, premio, id_seguro
