# Tipos de dados do MySQL — guia prático

Material de consulta para estudantes de Banco de Dados e para modelagem no MySQL Workbench. Referência: **MySQL 8.4**.

## 1. Tipos numéricos inteiros

Armazenam números sem casas decimais.

| Tipo | Faixa com sinal (SIGNED) | Para que serve | Exemplo de campo |
|---|---|---|---|
| `TINYINT` | -128 a 127 | Números inteiros pequenos, como nível de prioridade. | `prioridade TINYINT` |
| `SMALLINT` | -32.768 a 32.767 | Quantidades pequenas ou médias. | `numero_sala SMALLINT` |
| `MEDIUMINT` | -8.388.608 a 8.388.607 | Contagens intermediárias. | `total_acessos MEDIUMINT` |
| `INT` ou `INTEGER` | -2.147.483.648 a 2.147.483.647 | Identificadores, contadores e quantidades. | `id_cliente INT` |
| `BIGINT` | Aproximadamente -9,22 × 10¹⁸ a 9,22 × 10¹⁸ | Identificadores e contagens muito grandes. | `id_evento BIGINT` |

**Observações:** `UNSIGNED` impede números negativos e aumenta o limite positivo; `AUTO_INCREMENT` é um atributo comum para chaves primárias numéricas, não um tipo de dado.

## 2. Tipos numéricos decimais e de bits

| Tipo | Para que serve | Exemplo de campo |
|---|---|---|
| `DECIMAL(p,s)` | Valores decimais exatos; ideal para dinheiro, com `p` dígitos totais e `s` casas decimais. | `preco DECIMAL(10,2)` |
| `NUMERIC(p,s)` | Sinônimo de `DECIMAL`; valores decimais exatos. | `saldo NUMERIC(12,2)` |
| `FLOAT` | Número de ponto flutuante de precisão aproximada (simples). | `temperatura FLOAT` |
| `DOUBLE` ou `DOUBLE PRECISION` | Ponto flutuante aproximado de maior precisão. | `latitude_calculada DOUBLE` |
| `BIT(n)` | Armazena de 1 a 64 bits; útil para máscaras de bits e flags compactas. | `permissoes BIT(8)` |
| `BOOL` ou `BOOLEAN` | Sinônimos de `TINYINT(1)`; convencionalmente 0 = falso e 1 = verdadeiro. | `ativo BOOLEAN` |

**Importante:** para valores monetários, prefira `DECIMAL` em vez de `FLOAT`/`DOUBLE`. `BOOLEAN` não restringe automaticamente os valores apenas a 0 ou 1.

## 3. Tipos de texto e caracteres

| Tipo | Para que serve | Exemplo de campo |
|---|---|---|
| `CHAR(n)` | Texto com tamanho fixo; bom para códigos de comprimento constante. | `uf CHAR(2)` |
| `VARCHAR(n)` | Texto de tamanho variável; nomes, e-mails e endereços. | `nome VARCHAR(150)` |
| `TINYTEXT` | Texto pequeno, até 255 bytes. | `resumo TINYTEXT` |
| `TEXT` | Textos longos, até 65.535 bytes (limite sujeito ao tamanho da linha e codificação). | `descricao TEXT` |
| `MEDIUMTEXT` | Textos muito longos, até cerca de 16 MiB. | `conteudo MEDIUMTEXT` |
| `LONGTEXT` | Textos extremamente longos, até cerca de 4 GiB em limite teórico. | `documento LONGTEXT` |
| `ENUM('a','b',...)` | Permite um valor dentre opções predefinidas. | `status ENUM('aberto','fechado')` |
| `SET('a','b',...)` | Permite zero ou mais valores de um conjunto predefinido (até 64 membros). | `dias SET('seg','ter','qua')` |

**Atenção:** `VARCHAR(n)` define o número máximo de *caracteres*, enquanto limites de `TEXT` são medidos em *bytes*. Para textos em português, recomenda-se em geral `utf8mb4`.

## 4. Tipos de data e hora

| Tipo | Para que serve | Exemplo de campo/valor |
|---|---|---|
| `DATE` | Armazena data sem horário. | `nascimento DATE` → `2001-05-18` |
| `TIME` | Armazena horário ou duração, inclusive acima de 24 horas. | `duracao TIME` → `25:30:00` |
| `DATETIME` | Armazena data e hora, sem conversão automática de fuso horário. | `agendado_em DATETIME` → `2026-10-28 14:30:00` |
| `TIMESTAMP` | Instante armazenado em UTC e convertido segundo o fuso da sessão; comum para registros de criação/atualização. | `criado_em TIMESTAMP` |
| `YEAR` | Armazena um ano. | `ano_fabricacao YEAR` → `2026` |

**Diferença importante:** `DATETIME` preserva a data/hora informada; `TIMESTAMP` considera fuso horário na gravação e leitura. `TIMESTAMP` também possui intervalo de datas mais limitado que `DATETIME` na linha MySQL 8.4.

## 5. Tipos binários

| Tipo | Para que serve | Exemplo de campo |
|---|---|---|
| `BINARY(n)` | Sequência de bytes de tamanho fixo. | `codigo_binario BINARY(16)` |
| `VARBINARY(n)` | Sequência de bytes de tamanho variável. | `token VARBINARY(64)` |
| `TINYBLOB` | Conteúdo binário pequeno (até 255 bytes). | `miniatura TINYBLOB` |
| `BLOB` | Conteúdo binário até aproximadamente 64 KiB. | `arquivo BLOB` |
| `MEDIUMBLOB` | Conteúdo binário até aproximadamente 16 MiB. | `imagem MEDIUMBLOB` |
| `LONGBLOB` | Conteúdo binário de tamanho muito grande (limite teórico próximo de 4 GiB). | `video LONGBLOB` |

**Boa prática:** para arquivos grandes, muitas aplicações armazenam o arquivo em um serviço de armazenamento e mantêm no banco o caminho ou identificador, em vez do conteúdo completo.

## 6. Dados JSON

| Tipo | Para que serve | Exemplo de campo |
|---|---|---|
| `JSON` | Armazena documentos JSON válidos, como objetos e listas, permitindo funções para consultar propriedades. | `configuracoes JSON` |

Exemplo de valor JSON: `{"tema":"escuro","notificacoes":true}`.

## 7. Tipos espaciais (geometria)

| Tipo | Para que serve | Exemplo de uso |
|---|---|---|
| `GEOMETRY` | Tipo genérico para uma geometria espacial. | Geometria de uma área. |
| `POINT` | Um ponto com coordenadas. | Posição de uma loja. |
| `LINESTRING` | Linha composta por pontos. | Trajeto de entrega. |
| `POLYGON` | Polígono que delimita uma região. | Área de cobertura. |
| `MULTIPOINT` | Conjunto de pontos. | Locais de atendimento. |
| `MULTILINESTRING` | Conjunto de linhas. | Rede de ruas. |
| `MULTIPOLYGON` | Conjunto de polígonos. | Regiões não contíguas. |
| `GEOMETRYCOLLECTION` | Coleção de geometrias de diferentes tipos. | Mapa com pontos e linhas. |

Para dados geográficos reais, verifique o sistema de referência espacial (**SRID**) apropriado.

## 8. Exemplo completo de criação de tabela

```sql
CREATE TABLE produtos (
    id_produto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    codigo CHAR(8) UNIQUE,
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT UNSIGNED NOT NULL DEFAULT 0,
    peso_kg DECIMAL(8,3),
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    categoria ENUM('roupa', 'cama', 'banho') NOT NULL,
    cadastro_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atributos JSON
);
```

Neste exemplo, cada coluna possui um tipo compatível com o dado armazenado: preço e peso usam `DECIMAL`, nome usa `VARCHAR`, descrição usa `TEXT` e cadastro usa `DATETIME`.

## 9. Guia rápido de escolha

| Informação | Tipo sugerido |
|---|---|
| Código numérico de cliente | `INT UNSIGNED` |
| Nome de pessoa | `VARCHAR(150)` |
| CPF (preservando zeros iniciais) | `CHAR(11)` |
| Telefone (pode incluir `+`, espaços e zeros iniciais) | `VARCHAR(20)` |
| E-mail | `VARCHAR(254)` |
| Valor de produto | `DECIMAL(10,2)` |
| Quantidade em estoque | `INT UNSIGNED` |
| Data de nascimento | `DATE` |
| Data e horário de agendamento | `DATETIME` |
| Registro de alteração com fuso | `TIMESTAMP` |
| Observações extensas | `TEXT` |
| Status de pedido com poucas opções | `ENUM(...)` ou tabela relacionada |
| Dados estruturados flexíveis | `JSON` |
| Coordenada ou localização espacial | `POINT` |

## 10. Conceitos que não são tipos de dados

- **`PRIMARY KEY`**: define a chave primária.
- **`FOREIGN KEY`**: define uma chave estrangeira.
- **`NOT NULL`**: impede valores nulos.
- **`NULL`**: representa ausência de valor conhecido, não uma string vazia.
- **`UNIQUE`**: impede duplicação de valores conforme as regras da restrição.
- **`DEFAULT`**: define um valor padrão.
- **`AUTO_INCREMENT`**: gera valores inteiros sequenciais automaticamente.
- **`UNSIGNED`**: faz tipos numéricos compatíveis não aceitarem números negativos.

## Referência

Documentação oficial MySQL 8.4 — [Data Types](https://dev.mysql.com/doc/refman/8.4/en/data-types.html).

> Observação: limites de armazenamento, comportamento e recursos podem variar conforme a versão do MySQL, a codificação, o mecanismo de armazenamento e a configuração do servidor.
