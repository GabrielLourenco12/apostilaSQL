SELECT DISTINCT SEXO FROM tb_autor;

/*substr é (coluna que você quer, posição na palavra correspondente,
quantidade de letras)*/
SELECT * FROM tb_autor
    WHERE SUBSTR(nome,2,1)='o';
    
/*UPPER DEIXA MAIUSCULO E LOWER MINUSCULO*/
SELECT UPPER(NOME) FROM TB_AUTOR;
SELECT LOWER(NOME) FROM TB_AUTOR;

/*Exibe o nome armazenado no banco de dados e em maiúsculo 
dos autores que começam coma letra ‘p’*/
SELECT nome, UPPER(nome) as maiusculo FROM TB_AUTOR
WHERE SUBSTR(nome,1,1)='p';

/*Exibe todos os livros que possuem a palavra ‘DE’ em qualquer
parte do título do livro*/
SELECT * FROM TB_LIVRO WHERE UPPER(titulo) LIKE '%DE%';

/*Exibe o mês de Nascimento COM A FUNCAO EXTRACT*/
SELECT * FROM TB_AUTOR
WHERE EXTRACT(MONTH FROM DATA_NASCIMENTO)=05;

/*Exibe o DIA de Nascimento COM A FUNCAO EXTRACT*/
SELECT * FROM TB_AUTOR
WHERE EXTRACT(DAY FROM DATA_NASCIMENTO)=10;

/*EXIBIR A DATA TODA*/
SELECT  
    EXTRACT(DAY FROM DATA_NASCIMENTO) AS DIA,
    EXTRACT(MONTH FROM DATA_NASCIMENTO) AS MES,
    EXTRACT(YEAR FROM DATA_NASCIMENTO) AS ANO
FROM TB_AUTOR;

/*ACHANDO A DATA DE NASCIMENTO DE ALGUÉM COM UMAS RESTRICOES*/
SELECT nome, EXTRACT(DAY FROM DATA_NASCIMENTO) AS DIA,
EXTRACT(MONTH FROM DATA_NASCIMENTO) AS MES,
EXTRACT(YEAR FROM DATA_NASCIMENTO) AS ANO
FROM TB_AUTOR
WHERE UPPER(SUBSTR(NOME,1,1))='P';

/*Exibição do campo sexo através do comando CASE, que exibe 
em duas situações ‘M’ para Masculino e ‘F’ para Feminino, 
caso contrário ‘Sexo inválido’*/
SELECT NOME, CASE SEXO
    WHEN 'M' THEN 'Masculino'
    WHEN 'F' THEN 'Feminino'
    ELSE 'Sexo inválido'
END sexo, SEXO
FROM tb_autor;

