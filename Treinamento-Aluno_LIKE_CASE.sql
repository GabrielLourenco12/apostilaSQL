SELECT DISTINCT SEXO FROM tb_autor;

/*substr � (coluna que voc� quer, posi��o na palavra correspondente,
quantidade de letras)*/
SELECT * FROM tb_autor
    WHERE SUBSTR(nome,2,1)='o';
    
/*UPPER DEIXA MAIUSCULO E LOWER MINUSCULO*/
SELECT UPPER(NOME) FROM TB_AUTOR;
SELECT LOWER(NOME) FROM TB_AUTOR;

/*Exibe o nome armazenado no banco de dados e em mai�sculo 
dos autores que come�am coma letra �p�*/
SELECT nome, UPPER(nome) as maiusculo FROM TB_AUTOR
WHERE SUBSTR(nome,1,1)='p';

/*Exibe todos os livros que possuem a palavra �DE� em qualquer
parte do t�tulo do livro*/
SELECT * FROM TB_LIVRO WHERE UPPER(titulo) LIKE '%DE%';

/*Exibe o m�s de Nascimento COM A FUNCAO EXTRACT*/
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

/*ACHANDO A DATA DE NASCIMENTO DE ALGU�M COM UMAS RESTRICOES*/
SELECT nome, EXTRACT(DAY FROM DATA_NASCIMENTO) AS DIA,
EXTRACT(MONTH FROM DATA_NASCIMENTO) AS MES,
EXTRACT(YEAR FROM DATA_NASCIMENTO) AS ANO
FROM TB_AUTOR
WHERE UPPER(SUBSTR(NOME,1,1))='P';

/*Exibi��o do campo sexo atrav�s do comando CASE, que exibe 
em duas situa��es �M� para Masculino e �F� para Feminino, 
caso contr�rio �Sexo inv�lido�*/
SELECT NOME, CASE SEXO
    WHEN 'M' THEN 'Masculino'
    WHEN 'F' THEN 'Feminino'
    ELSE 'Sexo inv�lido'
END sexo, SEXO
FROM tb_autor;

