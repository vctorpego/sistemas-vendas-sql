## Sistema de Vendas

Este projeto foi desenvolvido como parte da disciplina de Banco de Dados. O sistema é implementado no PostgreSQL e inclui a criação de tabelas, inserção de dados, e uma série de consultas SQL para manipulação e análise de informações.

## Estrutura do Banco de Dados

### Criação de Tabela

#### Criação da tabela Cliente

```sql
CREATE TABLE Cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    cidade_id INT REFERENCES Cidade(id)
);
```
### Inserção de Dados

#### Inserção de dados na tabela Cliente

```c
INSERT INTO Cliente (nome, data_nascimento, cidade_id)
VALUES ('João', '1990-01-01', 1);
```

### Deleção de Dados

#### Comando para excluir um agricultor

```c
-- Excluir vendas associadas ao cliente
DELETE FROM Vendas
WHERE cliente_id = (SELECT id FROM Clientes WHERE nome = 'Victor');

-- Excluir o cliente
DELETE FROM Clientes
WHERE nome = 'Victor';
```

## Exemplos de Consultas

#### Retorna o nome do cliente, o identificador da venda, a data da compra, e o valor total de cada venda no ano de 2023.

```sql
SELECT c.nome AS cliente, v.id AS venda, v.data_compra AS data_compra, v.valor_total AS valor_total
FROM clientes c
JOIN vendas v ON c.id = v.cliente_id
WHERE EXTRACT(YEAR FROM v.data_compra) = 2023;
```

#### Retorna o valor total de vendas agrupados por ano e mês.

```c
SELECT
    EXTRACT(YEAR FROM Venda.data) AS ano,
    EXTRACT(MONTH FROM Venda.data) AS mes,
    SUM(VendaProdutoAgricultor.valor) AS valorTotalVendas
FROM Venda
JOIN VendaProdutoAgricultor ON Venda.idVenda = VendaProdutoAgricultor.idVenda
GROUP BY ano, mes
ORDER BY ano, mes;
```
