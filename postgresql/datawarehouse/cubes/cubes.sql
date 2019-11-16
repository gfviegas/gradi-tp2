--ATIVIDADE 2
--VIEWS REFERENTE AOS CUBOS DE DADOS

--cubeavgveiculos
--Retorna o valor médio de compra referente a cada montadora e modelo
CREATE VIEW cubeAvgVeiculos AS 
SELECT nome_montadora AS montadora, nome_modelo AS modelo, AVG(valor_compra) AS media 
FROM veiculo 
GROUP BY CUBE (nome_montadora, nome_modelo)