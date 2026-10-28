-- #########################################################################
-- ##                                                                     ##
-- ##                     SELECT BÁSICO NO MYSQL                          ##
-- ##                                                                     ##
-- ## Disciplina : Banco de Dados I                                       ##
-- ## Objetivo   : Aprender comandos básicos de consulta                  ##
-- ##               utilizando SELECT no MySQL                            ##
-- ##                                                                     ##
-- #########################################################################



-- #########################################################################
-- 1. CRIAR DATABASE
-- #########################################################################

CREATE DATABASE IF NOT EXISTS escola;



-- #########################################################################
-- 2. SELECIONAR DATABASE
-- #########################################################################

USE escola;



-- #########################################################################
-- 3. CRIAR TABELA
-- #########################################################################
-- Tabela utilizada nos exemplos de SELECT.
-- #########################################################################

CREATE TABLE IF NOT EXISTS aluno (

    id_aluno INT AUTO_INCREMENT PRIMARY KEY,

    nome VARCHAR(100),

    email VARCHAR(150),

    idade INT,

    cidade VARCHAR(100)

);



-- #########################################################################
-- 4. INSERIR DADOS PARA TESTES
-- #########################################################################

INSERT INTO aluno
(nome, email, idade, cidade)

VALUES

('Fulano de Tal', 'fulano@email.com', 20, 'Joinville'),
('Ciclano da Silva', 'ciclano@email.com', 22, 'Blumenau'),
('Beltrano dos Santos', 'beltrano@email.com', 19, 'Curitiba'),
('Maria Oliveira', 'maria@email.com', 25, 'Florianópolis');



-- #########################################################################
-- 5. CONSULTAR TODOS OS DADOS
-- #########################################################################
-- SELECT *:
-- Exibe TODOS os campos da tabela.
-- #########################################################################

SELECT * FROM aluno;



-- #########################################################################
-- 6. CONSULTAR APENAS UM CAMPO
-- #########################################################################
-- Exibe apenas o campo nome.
-- #########################################################################

SELECT nome
FROM aluno;



-- #########################################################################
-- 7. CONSULTAR MAIS DE UM CAMPO
-- #########################################################################
-- Exibe apenas os campos:
-- nome e cidade.
-- #########################################################################

SELECT nome, cidade
FROM aluno;



-- #########################################################################
-- 8. RENOMEAR NOME DAS COLUNAS NA CONSULTA
-- #########################################################################
-- AS permite alterar o nome exibido na consulta.
-- #########################################################################

SELECT
    nome AS Nome_Aluno,
    cidade AS Cidade_Aluno
FROM aluno;



-- #########################################################################
-- 9. CONSULTAR DADOS COM FILTRO
-- #########################################################################
-- WHERE filtra os resultados.
--
-- Exibe apenas alunos da cidade de Joinville.
-- #########################################################################

SELECT *
FROM aluno
WHERE cidade = 'Joinville';



-- #########################################################################
-- 10. CONSULTAR COM MAIS DE UMA CONDIÇÃO
-- #########################################################################
-- AND:
-- Todas as condições devem ser verdadeiras.
-- #########################################################################

SELECT *
FROM aluno
WHERE cidade = 'Blumenau'
AND idade = 22;



-- #########################################################################
-- 11. CONSULTAR UTILIZANDO OR
-- #########################################################################
-- OR:
-- Pelo menos uma condição deve ser verdadeira.
-- #########################################################################

SELECT *
FROM aluno
WHERE cidade = 'Curitiba'
OR cidade = 'Joinville';



-- #########################################################################
-- 12. CONSULTAR DADOS ORDENADOS
-- #########################################################################
-- ORDER BY organiza os resultados.
--
-- ASC:
-- Ordem crescente.
-- #########################################################################

SELECT *
FROM aluno
ORDER BY nome ASC;



-- #########################################################################
-- 13. CONSULTAR EM ORDEM DECRESCENTE
-- #########################################################################
-- DESC:
-- Ordem decrescente.
-- #########################################################################

SELECT *
FROM aluno
ORDER BY idade DESC;



-- #########################################################################
-- 14. LIMITAR QUANTIDADE DE RESULTADOS
-- #########################################################################
-- LIMIT define quantos registros serão exibidos.
-- #########################################################################

SELECT *
FROM aluno
LIMIT 2;



-- #########################################################################
-- 15. CONSULTAR DADOS DIFERENTES
-- #########################################################################
-- DISTINCT remove valores repetidos.
-- #########################################################################

SELECT DISTINCT cidade
FROM aluno;



-- #########################################################################
-- 16. CONSULTAR UTILIZANDO LIKE
-- #########################################################################
-- LIKE realiza buscas por padrões.
--
-- % representa qualquer sequência de caracteres.
-- #########################################################################

SELECT *
FROM aluno
WHERE nome LIKE '%Silva%';



-- #########################################################################
-- 17. CONSULTAR UTILIZANDO BETWEEN
-- #########################################################################
-- BETWEEN seleciona valores dentro de um intervalo.
-- #########################################################################

SELECT *
FROM aluno
WHERE idade BETWEEN 20 AND 25;



-- #########################################################################
-- 18. CONSULTAR UTILIZANDO IN
-- #########################################################################
-- IN permite comparar vários valores.
-- #########################################################################

SELECT *
FROM aluno
WHERE cidade IN ('Joinville', 'Curitiba');



-- #########################################################################
-- 19. CONTAR REGISTROS
-- #########################################################################
-- COUNT conta quantos registros existem.
-- #########################################################################

SELECT COUNT(*) AS Quantidade_Alunos
FROM aluno;



-- #########################################################################
-- 20. EXEMPLO COMPLETO FINAL
-- #########################################################################
-- Exibe:
--
-- - Nome
-- - Cidade
-- - Idade
--
-- Apenas alunos maiores de 20 anos,
-- organizados por nome.
-- #########################################################################

SELECT
    nome,
    cidade,
    idade

FROM aluno

WHERE idade > 20

ORDER BY nome ASC;