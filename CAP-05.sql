/* Utilizando a função CONCAT - Sem utilizar uma tabela do banco!*/
SELECT CONCAT("Olá, ", "Mundo! ", "Mysql ", "Funções!") AS resultado;

/* Usando funçao CONCAT para formar o Endereço Completo do Cliente.
 Agora utilizamos a tabela.*/
SELECT nome, CONCAT(endereco_1, ' ', endereco_2, ' ', bairro, ' ', cidade, ' ', estado) AS Endereco_Completo FROM tabela_de_clientes;

/*Calculando idade de Clientes*/
SELECT nome, TIMESTAMPDIFF (YEAR, data_de_nascimento, CURDATE()) AS idade FROM tabela_de_clientes;

/*Podemos fazer operações matematicas*/
SELECT 5+5 AS resultado;

/*Funçao CEILING arredonda o valor sempre pra valor Inteiro Superior!*/
SELECT CEILING(10.121212121212121) AS resultado;

/*Funçao FLOOR arredonda o valor sempre pra valor Inteiro INFERIOR!*/
SELECT FLOOR(10.121212121212121) AS resultado;

/*Funçao ROUND arredonda o valor de acordo com o Decimal. 
Até 0,4 arredondamento inferior, depois disso superior!*/
SELECT ROUND(10.4) AS resultado;

/*Funçao ROUND arredonda o valor de acordo com o Decimal. 
Até 0,4 arredondamento inferior, depois disso superior!*/
SELECT ROUND(10.6) AS resultado;

/*Funçao ROUND aceita um parâmetro para indicar numero de casa decimal.
Nesse caso analisa o último numero, onde n >= 5 arredondamento superior*/
SELECT ROUND(10.444, 2) AS resultado;

/* Calculando imposto pago no ano de 2016 com arredondamento inferior.*/
SELECT YEAR(DATA_VENDA) AS ano ,FLOOR(SUM(PRECO * QUANTIDADE * IMPOSTO)) AS imposto_pago  FROM notas_fiscais nf 
INNER JOIN itens_notas_fiscais inf ON nf.numero = inf.numero  WHERE YEAR(DATA_VENDA) = 2016 GROUP BY ano;

/* Usando a função CONVERT, ela é capaz de transformar o tipo do resultado
   Nesse exemplo pegamos um FLOAT a passamos a trata-lo como char!*/
SELECT SUBSTRING(CONVERT(23.3, CHAR), 1,1) AS RESULTADO;

/* Há funções próprias para Converter Datas. São as Function Date Format*/

/* Queremos construir um SQL cujo resultado seja = “O cliente João da Silva faturou 120000 no ano de 2016”. 
Somente para o ano de 2016.
O CONCAT por baixo dos panos ele faz todo argumento virar um varchar, por isso não precisamos usar o CONVERT*/
SELECT CONCAT('O cliente ', c.nome, ' faturou ', ROUND(SUM(inf.PRECO * inf.QUANTIDADE), 2), ' no ano de 2016.' ) AS RESULTADO FROM tabela_de_clientes c INNER JOIN notas_fiscais nf ON c.CPF = nf.CPF 
INNER JOIN itens_notas_fiscais inf ON inf.NUMERO = nf.NUMERO WHERE YEAR(DATA_VENDA) = 2016 GROUP BY (c.nome);

/* RESPOSTA DO PROFESSOR DA QUESTAO ANTERIOR:*/
SELECT CONCAT('O cliente ', TC.NOME, ' faturou ', 
CAST(SUM(INF.QUANTIDADE * INF.preco) AS char (20))
 , ' no ano ', CAST(YEAR(NF.DATA_VENDA) AS char (20))) AS SENTENCA FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
INNER JOIN tabela_de_clientes TC ON NF.CPF = TC.CPF
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY TC.NOME, YEAR(DATA_VENDA)

