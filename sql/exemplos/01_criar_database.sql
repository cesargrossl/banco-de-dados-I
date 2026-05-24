-- #########################################################################
-- ##                                                                     ##
-- ##                GERENCIAMENTO DE DATABASE NO MYSQL                   ##
-- ##                                                                     ##
-- ## Disciplina : Banco de Dados I                                       ##
-- ## Objetivo   : Aprender comandos de criação e gerenciamento           ##
-- ##               de bancos de dados (DATABASE) no MySQL               ##
-- ##                                                                     ##
-- #########################################################################



-- #########################################################################
-- 1. LISTAR TODOS OS BANCOS DE DADOS EXISTENTES
-- #########################################################################
-- O comando SHOW DATABASES exibe todos os bancos de dados
-- disponíveis no servidor MySQL.
--
-- Muito utilizado para visualizar quais databases já existem.
-- #########################################################################

SHOW DATABASES;



-- #########################################################################
-- 2. CRIAR UM NOVO DATABASE
-- #########################################################################
-- O comando CREATE DATABASE cria um novo banco de dados.
--
-- Neste exemplo será criado um database chamado "empresa".
--
-- Sintaxe:
-- CREATE DATABASE nome_database;
-- #########################################################################

CREATE DATABASE empresa;



-- #########################################################################
-- 3. CRIAR UM DATABASE COM CONFIGURAÇÕES
-- #########################################################################
-- Além de criar o database, é possível definir:
--
-- CHARACTER SET:
-- Define o conjunto de caracteres utilizado pelo banco.
--
-- COLLATE:
-- Define as regras de comparação de texto.
--
-- utf8mb4:
-- Permite armazenar caracteres especiais e emojis.
--
-- utf8mb4_general_ci:
-- Comparação de texto sem diferenciar maiúsculas/minúsculas.
-- #########################################################################

CREATE DATABASE sistema_vendas
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;



-- #########################################################################
-- 4. SELECIONAR UM DATABASE
-- #########################################################################
-- O comando USE define qual banco de dados será utilizado.
--
-- Após executar este comando, todas as operações acontecerão
-- dentro do database selecionado.
--
-- Sintaxe:
-- USE nome_database;
-- #########################################################################

USE sistema_vendas;



-- #########################################################################
-- 5. MOSTRAR QUAL DATABASE ESTÁ EM USO
-- #########################################################################
-- O comando SELECT DATABASE() mostra qual banco de dados
-- está atualmente selecionado.
--
-- Muito útil para confirmar se o database correto está ativo.
-- #########################################################################

SELECT DATABASE();



-- #########################################################################
-- 6. CRIAR DATABASE SOMENTE SE NÃO EXISTIR
-- #########################################################################
-- O comando IF NOT EXISTS evita erro caso o database já exista.
--
-- Sem IF NOT EXISTS:
-- Se o banco já existir, o MySQL exibirá erro.
--
-- Com IF NOT EXISTS:
-- O MySQL apenas ignora a criação.
-- #########################################################################

CREATE DATABASE IF NOT EXISTS loja_virtual;



-- #########################################################################
-- 7. ALTERAR O CHARACTER SET DO DATABASE
-- #########################################################################
-- ALTER DATABASE permite alterar configurações do banco.
--
-- CHARACTER SET define o padrão de caracteres do database.
--
-- utf8mb4 é recomendado para sistemas modernos.
-- #########################################################################

ALTER DATABASE sistema_vendas
CHARACTER SET utf8mb4;



-- #########################################################################
-- 8. ALTERAR O COLLATE DO DATABASE
-- #########################################################################
-- COLLATE define as regras de comparação de textos.
--
-- utf8mb4_unicode_ci:
-- Comparação baseada no padrão Unicode.
--
-- "ci" significa:
-- Case Insensitive
-- Não diferencia letras maiúsculas e minúsculas.
-- #########################################################################

ALTER DATABASE sistema_vendas
COLLATE utf8mb4_unicode_ci;



-- #########################################################################
-- 9. EXIBIR O COMANDO DE CRIAÇÃO DO DATABASE
-- #########################################################################
-- SHOW CREATE DATABASE mostra:
--
-- - Nome do database
-- - Character Set
-- - Collation
-- - Configurações utilizadas na criação
--
-- Muito útil para documentação e backup.
-- #########################################################################

SHOW CREATE DATABASE sistema_vendas;



-- #########################################################################
-- 10. LISTAR DATABASES COM FILTRO
-- #########################################################################
-- O comando LIKE permite filtrar resultados.
--
-- Neste exemplo serão exibidos apenas databases
-- que possuem a palavra "loja" no nome.
--
-- % significa:
-- Qualquer sequência de caracteres.
-- #########################################################################

SHOW DATABASES LIKE '%loja%';



-- #########################################################################
-- 11. VERIFICAR O CHARACTER SET ATUAL
-- #########################################################################
-- SHOW VARIABLES permite visualizar configurações do MySQL.
--
-- character_set_database:
-- Mostra o conjunto de caracteres do database atual.
-- #########################################################################

SHOW VARIABLES LIKE 'character_set_database';



-- #########################################################################
-- 12. VERIFICAR O COLLATE ATUAL
-- #########################################################################
-- collation_database:
-- Mostra a regra de comparação utilizada no database atual.
-- #########################################################################

SHOW VARIABLES LIKE 'collation_database';



-- #########################################################################
-- 13. REMOVER UM DATABASE
-- #########################################################################
-- O comando DROP DATABASE remove completamente
-- um banco de dados.
--
-- IMPORTANTE:
-- Todos os dados, tabelas e informações serão apagados.
--
-- Deve ser utilizado com muito cuidado.
-- #########################################################################

DROP DATABASE empresa;



-- #########################################################################
-- 14. REMOVER DATABASE SOMENTE SE EXISTIR
-- #########################################################################
-- IF EXISTS evita erro caso o database não exista.
--
-- Muito utilizado em scripts automáticos.
-- #########################################################################

DROP DATABASE IF EXISTS sistema_estoque;



-- #########################################################################
-- 15. EXEMPLO COMPLETO FINAL
-- #########################################################################
-- Neste exemplo será realizado:
--
-- 1. Criação do database
-- 2. Definição de charset
-- 3. Definição de collation
-- 4. Seleção do database
-- 5. Verificação do database ativo
-- 6. Exibição da estrutura do database
-- #########################################################################

CREATE DATABASE IF NOT EXISTS aula_mysql
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE aula_mysql;

SELECT DATABASE();

SHOW CREATE DATABASE aula_mysql;

SHOW DATABASES;