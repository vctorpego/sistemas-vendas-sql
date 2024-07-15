## Sistema de Vendas

Este projeto foi desenvolvido como parte da disciplina de Banco de Dados. O sistema é implementado no PostgreSQL e inclui a criação de tabelas, inserção de dados, e uma série de consultas SQL para manipulação e análise de informações.

## Estrutura do Banco de Dados

### Criação da tabela Cliente

```sql
CREATE TABLE Cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    cidade_id INT REFERENCES Cidade(id)
);
```

## Inserção de Dados

### Inserção de dados na tabela Cliente

```c
INSERT INTO Cliente (nome, data_nascimento, cidade_id)
VALUES ('João', '1990-01-01', 1);
```

## Exemplos de Consultas

### Retornar o nome do cliente, o identificador da venda, a data da compra, e o valor total de cada venda no ano de 2023.

```sql
SELECT c.nome AS cliente, v.id AS venda, v.data_compra AS data_compra, v.valor_total AS valor_total
FROM clientes c
JOIN vendas v ON c.id = v.cliente_id
WHERE EXTRACT(YEAR FROM v.data_compra) = 2023;
```
