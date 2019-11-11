SELECT
  ROW_NUMBER() OVER () AS ano_id,
  EXTRACT(YEAR FROM data_sinistro) AS ano
FROM sinistro
  GROUP BY ano
  ORDER BY ano
