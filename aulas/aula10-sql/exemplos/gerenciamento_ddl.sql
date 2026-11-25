-- ============================================================
-- SQL - DDL (Data Definition Language)
-- Gerenciamento de bancos de dados e tabelas - MySQL 8
-- ============================================================

-- 1. CREATE DATABASE: cria um banco de dados.
-- Um banco de dados organiza e armazena tabelas e outros objetos.
CREATE DATABASE escola;

-- 2. USE: seleciona o banco de dados que sera utilizado.
-- Os proximos comandos serao executados no banco escola.
USE escola;

-- 3. ALTER DATABASE: altera as configuracoes do banco de dados.
-- CHARACTER SET define o conjunto de caracteres padrao.
-- COLLATE define as regras de comparacao e ordenacao de textos.
ALTER DATABASE escola
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

-- 4. CREATE TABLE: cria uma tabela dentro do banco selecionado.
-- Uma tabela organiza informacoes em linhas e colunas.
-- INT: numeros inteiros.
-- VARCHAR(100): textos de ate 100 caracteres.
-- DATE: datas no formato AAAA-MM-DD.
-- DECIMAL(10,2): numeros com 10 digitos, sendo 2 decimais.
-- BOOLEAN: valores logicos (verdadeiro ou falso).
CREATE TABLE alunos (
    codigo INT,
    nome VARCHAR(100),
    idade INT,
    nascimento DATE,
    mensalidade DECIMAL(10,2),
    ativo BOOLEAN
);

-- 5. ALTER TABLE ... ADD COLUMN: adiciona uma coluna a tabela.
ALTER TABLE alunos ADD COLUMN email VARCHAR(150);

-- 6. ALTER TABLE ... MODIFY COLUMN: modifica a definicao da coluna.
-- Neste exemplo, aumenta o limite do nome para 200 caracteres.
ALTER TABLE alunos MODIFY COLUMN nome VARCHAR(200);

-- 7. ALTER TABLE ... RENAME COLUMN: altera o nome de uma coluna.
-- O tipo de dado permanece o mesmo.
ALTER TABLE alunos RENAME COLUMN nascimento TO data_nascimento;

-- 8. ALTER TABLE ... CHANGE COLUMN: permite alterar nome e tipo.
-- A coluna idade passa a se chamar idade_aluno, mantendo INT.
ALTER TABLE alunos CHANGE COLUMN idade idade_aluno INT;

-- 9. ALTER TABLE ... DROP COLUMN: exclui uma coluna e seus dados.
ALTER TABLE alunos DROP COLUMN email;

-- 10. RENAME TABLE: altera o nome de uma tabela existente.
-- A estrutura e os dados da tabela sao preservados.
RENAME TABLE alunos TO estudantes;

-- 11. CREATE TABLE: cria uma segunda tabela no mesmo banco.
CREATE TABLE professores (
    codigo INT,
    nome VARCHAR(100),
    salario DECIMAL(10,2)
);

-- 12. DROP TABLE: exclui uma tabela, sua estrutura e seus dados.
-- O banco de dados e as demais tabelas permanecem existentes.
-- Remova o comentario abaixo para executar a exclusao.
-- DROP TABLE professores;

-- 13. DROP DATABASE: exclui o banco de dados inteiro.
-- Todas as tabelas e dados desse banco serao excluidos.
-- Remova o comentario abaixo somente se desejar excluir o banco.
-- DROP DATABASE escola;
