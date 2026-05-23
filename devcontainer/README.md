# MySQL Docker — Banco de Dados 1

Ambiente Docker utilizado para aulas da disciplina de Banco de Dados 1.

---

# Tecnologias utilizadas

- Docker
- Docker Compose
- MySQL 8.4

---

# Estrutura

```txt
.
├── docker-compose.yml
└── README.md
```

---

# Pré-requisitos

Instalar:

- Docker
- Docker Compose

---

# Subir ambiente

Execute o comando abaixo na pasta do projeto:

```bash
docker compose up -d
```

---

# Verificar containers

```bash
docker ps
```

---

# Parar ambiente

```bash
docker compose down
```

---

# Remover volumes do banco

```bash
docker compose down -v
```

⚠️ Esse comando remove todos os dados do banco.

---

# Dados de acesso

## Root

| Campo | Valor |
|---|---|
| Usuário | root |
| Senha | root123 |

---

## Usuário padrão

| Campo | Valor |
|---|---|
| Usuário | aluno |
| Senha | aluno123 |
| Banco | banco_dados_1 |

---

# Porta utilizada

| Serviço | Porta |
|---|---|
| MySQL | 3306 |

---

# Conectar via terminal

```bash
docker exec -it mysql_bd1 mysql -u root -p
```

---

# Conectar via MySQL Workbench

| Campo | Valor |
|---|---|
| Hostname | localhost |
| Port | 3306 |
| Username | root |
| Password | root123 |

---

# Estrutura do docker-compose

```yaml
version: '3.9'

services:
  mysql:
    image: mysql:8.4
    container_name: mysql_bd1
    restart: always

    environment:
      MYSQL_ROOT_PASSWORD: root123
      MYSQL_DATABASE: banco_dados_1
      MYSQL_USER: aluno
      MYSQL_PASSWORD: aluno123

    ports:
      - "3306:3306"

    volumes:
      - mysql_data:/var/lib/mysql

    command: --default-authentication-plugin=mysql_native_password

volumes:
  mysql_data:
```

---

# Logs do container

```bash
docker logs mysql_bd1
```

---

# Reiniciar container

```bash
docker restart mysql_bd1
```

---

# Observações

- O banco é persistido utilizando volume Docker.
- O ambiente foi criado para fins didáticos.
- Compatível com MySQL Workbench e DBeaver.

---