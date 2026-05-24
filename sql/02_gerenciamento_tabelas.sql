-- #########################################################################
-- ##                                                                     ##
-- ##                 GERENCIAMENTO DE TABELAS NO MYSQL                   ##
-- ##                                                                     ##
-- ## Disciplina : Banco de Dados I                                       ##
-- ## Objetivo   : Aprender comandos de criação e alteração               ##
-- ##               de tabelas e campos no MySQL                         ##
-- ##                                                                     ##
-- #########################################################################



-- #########################################################################
-- 1. CRIAR UM DATABASE
-- #########################################################################
-- Cria um banco de dados chamado "escola".
--
-- IF NOT EXISTS:
-- Cria o banco apenas se ele ainda não existir.
-- #########################################################################

CREATE DATABASE IF NOT EXISTS escola;



-- #########################################################################
-- 2. SELECIONAR O DATABASE
-- #########################################################################
-- Define qual banco de dados será utilizado.
-- #########################################################################

USE escola;



-- #########################################################################
-- 3. CRIAR UMA TABELA
-- #########################################################################
-- O comando CREATE TABLE cria uma nova tabela.
--
-- Neste exemplo será criada a tabela "aluno".
--
-- Campos:
--
-- id_aluno:
-- Número inteiro automático utilizado como chave primária.
--
-- nome:
-- Campo texto com até 100 caracteres.
--
-- email:
-- Campo texto para armazenar e-mail.
--
-- idade:
-- Campo numérico inteiro.
--
-- data_cadastro:
-- Armazena data e hora automaticamente.
-- #########################################################################

CREATE TABLE aluno (

    id_aluno INT AUTO_INCREMENT PRIMARY KEY,

    nome VARCHAR(100) NOT NULL,

    email VARCHAR(150),

    idade INT,

    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP

);



-- #########################################################################
-- 4. MOSTRAR TODAS AS TABELAS
-- #########################################################################
-- SHOW TABLES exibe todas as tabelas do database atual.
-- #########################################################################

SHOW TABLES;



-- #########################################################################
-- 5. EXIBIR A ESTRUTURA DA TABELA
-- #########################################################################
-- DESCRIBE mostra:
--
-- - Nome dos campos
-- - Tipo de dados
-- - Tamanho
-- - Restrições
-- - Chave primária
-- #########################################################################

DESCRIBE aluno;



-- #########################################################################
-- 6. MOSTRAR O COMANDO DE CRIAÇÃO DA TABELA
-- #########################################################################
-- SHOW CREATE TABLE exibe o SQL completo utilizado
-- para criar a tabela.
-- #########################################################################

SHOW CREATE TABLE aluno;



-- #########################################################################
-- 7. ADICIONAR UM NOVO CAMPO
-- #########################################################################
-- ALTER TABLE modifica uma tabela existente.
--
-- ADD COLUMN:
-- Adiciona um novo campo na tabela.
--
-- telefone:
-- Campo texto com até 20 caracteres.
-- #########################################################################

ALTER TABLE aluno
ADD COLUMN telefone VARCHAR(20);



-- #########################################################################
-- 8. ADICIONAR MAIS DE UM CAMPO
-- #########################################################################
-- É possível adicionar vários campos em um único comando.
-- #########################################################################

ALTER TABLE aluno
ADD COLUMN endereco VARCHAR(200),
ADD COLUMN cidade VARCHAR(100);



-- #########################################################################
-- 9. ALTERAR O TIPO DE UM CAMPO
-- #########################################################################
-- MODIFY COLUMN altera:
--
-- - Tipo do campo
-- - Tamanho
-- - Restrições
--
-- Neste exemplo o campo nome será alterado
-- para aceitar até 200 caracteres.
-- #########################################################################

ALTER TABLE aluno
MODIFY COLUMN nome VARCHAR(200);



-- #########################################################################
-- 10. ALTERAR O NOME DE UM CAMPO
-- #########################################################################
-- CHANGE COLUMN altera:
--
-- - Nome do campo
-- - Tipo do campo
--
-- Sintaxe:
-- CHANGE COLUMN nome_antigo nome_novo tipo;
-- #########################################################################

ALTER TABLE aluno
CHANGE COLUMN telefone celular VARCHAR(20);



-- #########################################################################
-- 11. RENOMEAR UMA TABELA
-- #########################################################################
-- RENAME TABLE altera o nome da tabela.
-- #########################################################################

RENAME TABLE aluno TO tb_aluno;



-- #########################################################################
-- 12. EXCLUIR UM CAMPO
-- #########################################################################
-- DROP COLUMN remove um campo da tabela.
--
-- CUIDADO:
-- Todos os dados do campo serão perdidos.
-- #########################################################################

ALTER TABLE tb_aluno
DROP COLUMN endereco;



-- #########################################################################
-- 13. ADICIONAR UMA CHAVE PRIMÁRIA
-- #########################################################################
-- PRIMARY KEY identifica registros únicos.
-- #########################################################################

CREATE TABLE curso (

    id_curso INT,

    nome_curso VARCHAR(100)

);



ALTER TABLE curso
ADD PRIMARY KEY (id_curso);



-- #########################################################################
-- 14. ADICIONAR CHAVE ESTRANGEIRA
-- #########################################################################
-- FOREIGN KEY cria relacionamento entre tabelas.
--
-- Neste exemplo:
--
-- id_curso da tabela tb_aluno
-- referencia id_curso da tabela curso.
-- #########################################################################

ALTER TABLE tb_aluno
ADD COLUMN id_curso INT;



ALTER TABLE tb_aluno
ADD CONSTRAINT fk_aluno_curso
FOREIGN KEY (id_curso)
REFERENCES curso(id_curso);



-- #########################################################################
-- 15. REMOVER CHAVE ESTRANGEIRA
-- #########################################################################
-- DROP FOREIGN KEY remove relacionamento.
-- #########################################################################

ALTER TABLE tb_aluno
DROP FOREIGN KEY fk_aluno_curso;



-- #########################################################################
-- 16. EXCLUIR UMA TABELA
-- #########################################################################
-- DROP TABLE remove completamente a tabela.
--
-- Todos os dados serão apagados.
-- #########################################################################

DROP TABLE curso;



-- #########################################################################
-- 17. EXCLUIR TABELA SOMENTE SE EXISTIR
-- #########################################################################
-- IF EXISTS evita erro caso a tabela não exista.
-- #########################################################################

DROP TABLE IF EXISTS tb_teste;



-- #########################################################################
-- 18. EXEMPLO COMPLETO FINAL
-- #########################################################################
-- Neste exemplo será realizado:
--
-- 1. Criação da tabela
-- 2. Adição de campos
-- 3. Alteração de campo
-- 4. Renomeação de tabela
-- 5. Exibição da estrutura
-- #########################################################################

CREATE TABLE produto (

    id_produto INT AUTO_INCREMENT PRIMARY KEY,

    descricao VARCHAR(100),

    valor DECIMAL(10,2)

);



ALTER TABLE produto
ADD COLUMN estoque INT;



ALTER TABLE produto
MODIFY COLUMN descricao VARCHAR(200);



RENAME TABLE produto TO tb_produto;



DESCRIBE tb_produto;

SHOW CREATE TABLE tb_produto;