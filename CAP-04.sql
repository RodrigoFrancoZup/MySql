/* Obtendo faturamento anual da empresa 
 Data encontra-se em uma tabela. E o valor do produto e quantidade encotnra-se em outra,
 logo temos que usar JOIN*/
SELECT YEAR(notas.data_venda) AS ano, SUM(itens.PRECO * itens.QUANTIDADE) AS total FROM itens_notas_fiscais AS itens INNER JOIN notas_fiscais AS notas 
ON itens.NUMERO = notas.NUMERO GROUP BY ano;

/* Juntando dois selects com UNION - Sem repetição*/
SELECT bairro FROM tabela_de_clientes 
UNION 
SELECT bairro FROM tabela_de_vendedores;

/* Juntando dois selects com UNION - Permite repetição*/
SELECT bairro FROM tabela_de_clientes 
UNION ALL
SELECT bairro FROM tabela_de_vendedores;

/*Uniao sem sentido, apenas para mostrar que os campos não precisam ser do mesmo nome
apenas do mesmo TIPO. Varchar com Varchar*/
SELECT nome FROM tabela_de_clientes 
UNION ALL
SELECT bairro FROM tabela_de_vendedores;

/*Fazendo Sub-Consultas. Pense que queremos pegar todo cliente que tem bairro igual do vendedor
Uma opção é fazer um consulta de todos os bairros de vendedores e depois usar a resposta
na consulta de clientes, o ruim é que toda vez que surgiu bairro novo em vendedor
teremos que arrumar o codigo de consulta do cliente.
Um jeito facil de resolver isso é o como fizemos no 3 código a baixo, usando SUB-Consulta*/
SELECT bairro FROM tabela_de_vendedores;
SELECT * FROM tabela_de_clientes WHERE bairro IN ('Tijuca','Jardins','Copacabana','Santo Amaro');
SELECT * FROM tabela_de_clientes WHERE bairro IN (SELECT bairro FROM tabela_de_vendedores);
