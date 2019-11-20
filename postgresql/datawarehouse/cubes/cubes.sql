--ATIVIDADE 2
--VIEWS REFERENTE AOS CUBOS DE DADOS

--cubeavgveiculos
--Retorna o valor médio de compra referente a cada montadora e modelo
CREATE VIEW cubeavgveiculos AS 
SELECT nome_montadora AS montadora, nome_modelo AS modelo, AVG(valor_compra) AS media 
FROM veiculo 
GROUP BY CUBE (nome_montadora, nome_modelo);

--cubetotalvenda
--Retorna a soma de venda de veículos por uma data
CREATE VIEW cubetotalvenda AS
SELECT
    EXTRACT (YEAR FROM data_compra) ano,
    EXTRACT (MONTH FROM data_compra) mes,
    EXTRACT (DAY FROM data_compra) dia,
    SUM (valor_compra) AS total
FROM
    veiculo
GROUP BY
    CUBE (
        EXTRACT (YEAR FROM data_compra),
        EXTRACT (MONTH FROM data_compra),
        EXTRACT (DAY FROM data_compra)
    );

--cubesinistroveiculo
--Retorna o custo e quantidade de sinistro por veiculo
CREATE VIEW cubesinistroveiculo AS
SELECT
	nome_modelo,
	nome_montadora,
	SUM(valor) AS custo_sinistro,
	COUNT(*) AS qtdSinistros
FROM sinistro
NATURAL JOIN veiculo
GROUP BY 
	CUBE(
		nome_modelo,
		nome_montadora
	);

--cubesinistrocliente
--Retorna o custo e quantidade de sinistro por cliente
CREATE VIEW cubesinistrocliente AS
SELECT 
	sexo,
	estado,
	SUM(valor) AS custo_sinistro,
	COUNT(*) AS qtdSinistros
FROM
sinistro
NATURAL JOIN cliente
GROUP BY
	CUBE (
		sexo,
		estado
	);

--cubeprejureceita
--Retorna o prejuízo e receita da seguradora por data
CREATE VIEW cubeprejureceita AS
SELECT 
	EXTRACT (YEAR FROM data_sinistro) ano,
    EXTRACT (MONTH FROM data_sinistro) mes,
    EXTRACT (DAY FROM data_sinistro) dia,
	SUM(valor) AS prejuizo,
	SUM(premio) AS receita
FROM
sinistro
NATURAL JOIN seguro
GROUP BY
	CUBE(
		EXTRACT (YEAR FROM data_sinistro),
    	EXTRACT (MONTH FROM data_sinistro),
    	EXTRACT (DAY FROM data_sinistro)
	)