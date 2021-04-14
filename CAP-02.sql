/* Aplicando o filtro BETWEEN. Ele pega o produto com preço maior que 19.5 e menor 19.52*/
SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA BETWEEN 19.50 AND 19.52;

/* Aplicando filtro com comparação tipo OU. 
Nesse caso irá pegar produto cujo sabor é Manga ou tamanho igual 470 ml*/
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Manga'
OR TAMANHO = '470 ml';

/* Aplicando filtro com comparação tipo E. 
Nesse caso irá pegar produto cujo sabor é Manga e seu tamanho igual 470 ml, ao mesmo tempo!*/
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Manga'
AND TAMANHO = '470 ml';

/* Filtro com LIKE. Irá procurar produtos cujo sabor tenha a palvra Maça*/
SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%';

/*Aplicando Filtro com LIKE e AND. Nesse caso pegará produtos
cujo sabor possui o texto Maça e a embalagem é pet*/
SELECT * FROM tabela_de_produtos WHERE SABOR LIKE '%Maça%'
AND EMBALAGEM = 'PET';