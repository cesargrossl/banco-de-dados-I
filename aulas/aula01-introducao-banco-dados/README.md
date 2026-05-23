# Aula 01 - Introdução ao Banco de Dados

## Objetivos da Aula

- Entender o conceito de banco de dados
- Conhecer os principais SGBDs
- Compreender tabelas, registros e campos
- Executar os primeiros comandos SQL

---

# O que é Banco de Dados?

Banco de dados é uma coleção organizada de informações.

Exemplos:
- Sistema bancário
- Mercado
- Shopee
- Netflix
- Instagram

Todos utilizam banco de dados para armazenar informações.

---

# O que é um SGBD?

SGBD significa Sistema Gerenciador de Banco de Dados.

Exemplos:
- MySQL
- PostgreSQL
- SQL Server
- Oracle

---

# Estrutura de uma tabela

## Tabela Cliente

| ID | Nome | Cidade |
|----|------|---------|
| 1 | João | Joinville |
| 2 | Maria | Curitiba |

---

# Conceitos importantes

## Campo
É uma coluna da tabela.

Exemplo:
- nome
- cidade

## Registro
É uma linha da tabela.

---

# SQL

SQL é a linguagem utilizada para manipular banco de dados.

Exemplo:

```sql
SELECT * FROM cliente;
```

---

# Primeiro exemplo no MySQL

```sql
CREATE DATABASE db_escola;
```

---

# Ferramentas utilizadas

- MySQL
- MySQL Workbench
- VS Code

---

# Atividade

Criar uma tabela contendo:
- id
- nome
- telefone