/*Conta a quantidade (COUNT) de Livros que possuem o título Banco de Dados*/
SELECT COUNT(*) quantidade_autores
FROM tb_livro li
JOIN tb_livro_autor la ON (li.id_livro=la.id_livro)
WHERE UPPER(li.titulo)='BANCO DE DADOS';

/*Exibe a projeção de valores agregados para o campo preço, 
utilizando os comandos SUM, AVG, MAX,MIN*/
SELECT
SUM(li.preco) soma_total,
TO_CHAR(AVG(li.preco),'9999.99') media_preco,
MAX(preco) maior_preco,
MIN(preco) menor_preco
FROM
TB_LIVRO li;

/*Exibe a projeção de valores agregados contando 
a quantidade de livros em relação a editora que ele pertence.*/
SELECT ed.descricao, COUNT(*) quantidade_livros 
FROM tb_livro li
JOIN tb_editora ed ON (li.id_editora=ed.id_editora)
GROUP BY ed.descricao;

SELECT li.preco, COUNT(*) quantidade_livros 
FROM tb_livro li
GROUP BY li.preco;

/*Exibe SUM e AVG, de acordo com a editora que publicou o livro*/
SELECT ed.descricao, 
AVG(li.preco) MEDIA_PRECO,
SUM(li.preco) SOMA_TOTAL
FROM tb_livro li
JOIN tb_editora ed ON (li.id_editora=ed.id_editora)
GROUP BY ed.descricao;

/*Exibe a quantidade de livros por título apenas os títulos 
que possuírem mais de 2 AUTORES entre os dados, 
este filtro é graças a cláusula HAVING.*/
SELECT
l.titulo,
count(*) quantidade_AUTORES
FROM TB_LIVRO l
JOIN
TB_LIVRO_AUTOR la on ( l.id_livro=la.id_livro)
GROUP BY l.titulo
HAVING COUNT(*)>1;

/*Faz a união entre suas tabelas pelos campos nome e sexo*/
SELECT
nome, sexo,'TABELA AUTOR'
    FROM TB_AUTOR
    
UNION 
SELECT
nome, sexo, 'TABELA FUNCIONARIO'
    FROM tb_funcionario
        ORDER BY 3,1;
        
/*UNION NORMAL AGORA*/
SELECT
nome, sexo
    FROM TB_AUTOR
    
UNION ALL
SELECT
nome, sexo
    FROM tb_funcionario;

/*Interseccao das tabelas*/
SELECT
nome, sexo
    FROM TB_AUTOR
    
INTERSECT
SELECT
nome, sexo
    FROM tb_funcionario;

/*TUDO MENOS O QUE REPETE*/        
SELECT
nome, sexo
    FROM TB_AUTOR
    
MINUS
SELECT
nome, sexo
    FROM tb_funcionario;
    

        
        





