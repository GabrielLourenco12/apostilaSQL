/*Apresenta Os títulos e preços dos livros com preços maior 
ou igual a média geral dos livros à venda.*/
SELECT
    L.titulo,
    L.preco
FROM
    TB_LIVRO L
WHERE
    l.preco >=
    (
        SELECT
            AVG(l.preco)
        FROM
            TB_LIVRO L
    );

/*Apresenta o nome dos autores que tiveram a publicação de algum livro 
na editora.*/
SELECT
    AU.NOME
FROM
    TB_AUTOR AU
WHERE
    AU.id_autor IN
    (
        SELECT
            LA.id_autor
        FROM
            TB_LIVRO_AUTOR LA
    );


/*Apresenta o nome dos autores que NÃO SÃO autores do livro BANCO DE DADOS.*/
SELECT
    AU.NOME
FROM
    TB_AUTOR AU
SELECT
    A.nome
FROM
    TB_AUTOR A
WHERE
    A.id_autor NOT IN
    (
       SELECT
            LA.id_autor
        FROM
            TB_LIVRO_AUTOR LA
        JOIN
            TB_LIVRO L ON (LA.id_livro=L.id_livro)
        WHERE
            UPPER(L.titulo) = 'BANCO DE DADOS'
    );


/*Apresenta o nome dos autores que tiveram a publicação de algum 
livro na editora.*/
   
    
SELECT
    A.nome
FROM
    TB_AUTOR A
WHERE
   EXISTS
    (
       SELECT
            *
        FROM
            TB_LIVRO_AUTOR LA
        WHERE
            la.id_autor=a.id_autor
    );
    
/*Apresenta as siglas da lotação com a tabela hierarquizada, 
através do comando START WITH ... CONNECT BY.*/    
SELECT
    sigla,
    level,
    sys_connect_by_path(sigla,',') caminho
FROM
    TB_LOTACAO
    START WITH id_lotacao_pai is null
    CONNECT BY NOCYCLE PRIOR id_lotacao=id_lotacao_pai;


/*Apresenta os títulos e nomes dos autores com suas publicações*/
CREATE OR REPLACE FORCE VIEW VW_LIVRO_AUTOR
AS
SELECT
    L.titulo,
    A.nome
FROM
    TB_AUTOR A
JOIN
    TB_LIVRO_AUTOR LA ON ( A.id_autor=la.id_autor)
JOIN
    TB_LIVRO L ON (L.id_livro = LA.id_livro);

/*PARA VISUALIZAR A VIEW CRIADA*/ 
SELECT
    *
FROM VW_LIVRO_AUTOR

