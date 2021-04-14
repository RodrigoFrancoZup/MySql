/*Filtro usando DISTINCT. Aqui é para pegar os bairros sem repetiçao de clientes que moram em Rio de Janeiro*/
SELECT DISTINCT bairro FROM tabela_de_clientes WHERE cidade = 'Rio de Janeiro';

/*Exemplo anterior sem uso de Distinct, HÁ REPETIÇÃO.
Seleciona os bairros de clientes que moram em Rio de Janeiro*/
SELECT bairro  FROM tabela_de_clientes WHERE cidade = 'Rio de Janeiro';

/* Exibe todos os produtos*/
SELECT * FROM tabela_de_produtos;

/* Exibe apenas os 5 primeiros produtos.*/
SELECT * FROM tabela_de_produtos LIMIT 5;

/* Exibira apenas 3 produtos e começara depois do produto 2 (segundo)*/
SELECT * FROM tabela_de_produtos LIMIT 2,3;

/* Lista as 10 primeiras vendas do dia 01/01/2017 */
SELECT * FROM notas_fiscais WHERE data_venda = '2017-01-01' LIMIT 10;

/* ORDER BY - Listando todos clientes. Ordenaçao por nome em ordem alfabetica, 
pois o padrao do ORDER BY é ASC */
SELECT * FROM tabela_de_clientes ORDER BY nome;

/* ORDER BY - Listando todos clientes. Ordenaçao inversa por nome em, 
Uilizando a ordem DESC */
SELECT * FROM tabela_de_clientes ORDER BY nome DESC;

/*Obtendo código do produto Linha Refescante - 1L - Morago/Limão*/
SELECT codigo_do_produto FROM tabela_de_produtos WHERE nome_do_produto = 'Linha Refrescante - 1 Litro - Morango/Limão';

/* Selecionando a maior venda do produto com código 1101035*/
SELECT DISTINCT QUANTIDADE FROM itens_notas_fiscais WHERE CODIGO_DO_PRODUTO = '1101035' ORDER BY QUANTIDADE DESC;

/* Quantas vendas, cuja quantidade comprada foi de 99 do produto com código 1101035 ?*/
SELECT COUNT(*) AS contador, CODIGO_DO_PRODUTO FROM itens_notas_fiscais WHERE CODIGO_DO_PRODUTO = '1101035'
AND quantidade = 99 GROUP BY CODIGO_DO_PRODUTO;

/* FILTRANDO AGREAGAÇÃO COM HAVING
Listando CPF de clientes que fizeram mais de 2000 compras no ano de 2016*/
 SELECT CPF, COUNT(*) FROM notas_fiscais WHERE YEAR(DATA_VENDA) = 2016 GROUP BY CPF HAVING COUNT(*) > 2000;
 
 /* Fazendo condicional com CASE para classificar produto de acordo com seu preço*/
 SELECT nome_do_produto, preco_de_lista,
	CASE 
		WHEN preco_de_lista >= 12 THEN 'PRODUTO CARO'
		WHEN preco_de_lista >= 7 AND preco_de_lista  <12 THEN 'PRODUTO EM CONTA'
		ELSE 'PRODUTO BARATO' 
	END AS status_preco FROM tabela_de_produtos;

/* Classificando com CASE os clientes de acordo com ano de nascimento*/
SELECT nome,
	CASE
		WHEN YEAR(data_de_nascimento) < 1990 THEN 'VELHO'
        WHEN YEAR(data_de_nascimento) >= 1990 AND YEAR(data_de_nascimento) <= 1995 THEN 'JOVEM'
        ELSE 'CRIANÇA'
	END AS status_idade FROM tabela_de_clientes;
    