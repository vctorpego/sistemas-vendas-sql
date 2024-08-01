-- Criação da tabela Produto
CREATE TABLE Produto(
	idProduto serial Primary key,
	nomeProduto varchar(30),
	precoAtual float,
	pontoEncomenda varchar(30)
);

-- Criação da tabela Agricultores
CREATE TABLE Agricultores(
	idAgricultor serial Primary key,
	nomeAgricultor varchar(30),
	taxaAssociado float,
	valorAssociadoFixo float
);

-- Criação da tabela Fornecedor
CREATE TABLE Fornecedor(
	idFornecedor serial primary key,
	nomeFornecedor varchar(30)
);

-- Criação da tabela FormaPagamento
CREATE TABLE FormaPagamento(
	idFormaPagamento serial primary key,
	nomeFormaPagamento varchar(30),
	saldo float
);

-- Criação da tabela Estado
CREATE TABLE Estado(
	idEstado serial primary key,
	nomeEstado varchar(30)
);

-- Criação da tabela Cidade
CREATE TABLE Cidade(
	idCidade serial primary key,
	nomeCidade varchar(30),
	idEstado int references Estado(idEstado)
);

-- Criação da tabela Bairro
CREATE TABLE Bairro(
	idBairro serial primary key,
	nomeBairro varchar(30),
	idCidade int references Cidade(idCidade)
);

-- Criação da tabela Endereco
CREATE TABLE Endereco(
	idEndereco serial primary key,
	logradouro varchar(30),
	cep varchar(15),
	numero int,
	complemento varchar(30),
	idBairro int references Bairro(idBairro)
);

-- Criação da tabela Cliente
CREATE TABLE Cliente(
	idCliente serial primary key,
	nomeCliente varchar(30),
	idEndereco int references Endereco(idEndereco)
);

-- Criação da tabela Venda
CREATE TABLE Venda(
	idVenda serial primary key,
	data timestamp,
	entregaDomicilio boolean,
	idCliente int references Cliente(idCliente),
	idFormaPagamento int references FormaPagamento(idFormaPagamento)
);

-- Criação da tabela Movimentacao
CREATE TABLE Movimentacao(
    idMovimentacao serial primary key,
    valor float,
    data timestamp,
    descricao varchar(20),
    acerto boolean,
    emprestimo boolean,
    pagamento boolean,
    idFornecedor int references Fornecedor(idFornecedor),
    idAgricultor int references Agricultores(idagricultor),
    idFormaPagamento int references FormaPagamento(idFormaPagamento)
);

-- Criação da tabela ProdutoAgricultor
CREATE TABLE ProdutoAgricultor(
    saldoEstoque int,
    idAgricultor int references Agricultores(idAgricultor),
    idProduto int references Produto(idProduto)
);

-- Criação da tabela VendaProdutoAgricultor
CREATE TABLE VendaProdutoAgricultor(
    valor int,
    quantidade int,
    acertoRealizadoAgricultor boolean,
    idAgricultor int references Agricultores(idAgricultor),
    idProduto int references Produto(idProduto),
    idVenda int references Venda(idVenda)
);

-- Criação da tabela EntregaPerca
CREATE TABLE EntregaPerca(
    idEntregaPerca serial primary key,
    data timestamp,
    qtde int,
    perca boolean,
    entrega boolean,
    idAgricultor int references Agricultores(idAgricultor),
    idProduto int references Produto(idProduto)
);

-- Inserção de dados na tabela Produto
INSERT INTO Produto (nomeProduto, precoAtual, pontoEncomenda)
VALUES
('Maçã', 5, 'Hortifruti'),
('Banana', 3, 'Hortifruti'),
('Laranja', 4, 'Hortifruti'),
('Mandioca', 6, 'Hortifruti'),
('Quiabo', 7, 'Mercearia'),
('Arroz', 10, 'Mercearia'),
('Feijão', 8, 'Mercearia');

-- Inserção de dados na tabela Agricultores
INSERT INTO Agricultores (nomeAgricultor, taxaAssociado, valorAssociadoFixo)
VALUES
('Victor Pego', 0.1, 100),
('Kennedy Senna', 0.2, 200),
('Maria Antonya Fernandes', 0.3, 300),
('Eduarda Gava', 0.4, 400),
('Wanessa Alves', 0.5, 500);

-- Inserção de dados na tabela Fornecedor
INSERT INTO Fornecedor (nomeFornecedor)
VALUES
('Hortifruteira do João'),
('Mercearia da Maria'),
('Açougue do José'),
('Padaria da Ana'),
('Sorveteria do Pedro');

-- Inserção de dados na tabela FormaPagamento
INSERT INTO FormaPagamento (nomeFormaPagamento, saldo)
VALUES
('Dinheiro', 1000),
('Cartão de crédito', 2000),
('Cartão de débito', 3000),
('Boleto bancário', 4000),
('Transferência bancária', 5000);

-- Inserção de dados na tabela Estado
INSERT INTO Estado (nomeEstado)
VALUES
('Espírito Santo'),
('Minas Gerais'),
('São Paulo'),
('Rio de Janeiro'),
('Paraná');

-- Inserção de dados na tabela Cidade
INSERT INTO Cidade (nomeCidade, idEstado)
VALUES
('Colatina', 1), -- Espírito Santo
('Vitória', 1),  -- Espírito Santo
('Baixo Guandu', 1),  -- Espírito Santo
('Belo Horizonte', 2), -- Minas Gerais
('Juiz de Fora', 2), -- Minas Gerais
('Rio de Janeiro', 3), -- Rio de Janeiro
('Niterói', 3), -- Rio de Janeiro
('São Paulo', 4), -- São Paulo
('Campinas', 4), -- São Paulo
('Curitiba', 5); -- Paraná

-- Inserção de dados na tabela Bairro
INSERT INTO Bairro (nomeBairro, idCidade)
VALUES
('Centro', 1),
('Marés', 1),
('Santa Luzia', 2),
('Lapa', 3),
('Copacabana', 3),
('Jardins', 4),
('Vila Madalena', 4),
('Centro', 5),
('Batel', 5);

-- Inserção de dados na tabela Endereco
INSERT INTO Endereco (logradouro, cep, numero, complemento, idBairro)
VALUES
('Rua da Matriz', '29700-000', 100, 'Apto. 100', 1),
('Rua do Imperador', '29705-000', 200, 'Casa', 2),
('Rua dos Andradas', '31310-000', 300, 'Comércio', 3),
('Rua da Consolação', '01310-000', 400, 'Escola', 4),
('Rua XV de Novembro', '80020-000', 500, 'Hospital', 5);

-- Inserção de dados na tabela Cliente
INSERT INTO Cliente (nomeCliente, idEndereco)
VALUES
('Igor Pulini', 1),
('Dione Sousa', 2),
('Tedesco Silva', 3),
('Gustavo Ludovico', 4),
('Giovany Frossad', 5);

-- Inserção de dados na tabela Venda
INSERT INTO Venda (data, entregaDomicilio, idCliente, idFormaPagamento)
VALUES
('2023-08-02 11:00:00', true, 1, 1),
('2023-09-03 12:00:00', false, 2, 2),
('2023-10-04 13:00:00', true, 3, 3),
('2023-11-05 14:00:00', false, 4, 4),
('2023-12-06 15:00:00', true, 5, 5);

-- Inserção de dados na tabela VendaProdutoAgricultor
INSERT INTO VendaProdutoAgricultor (valor, quantidade, acertoRealizadoAgricultor, idAgricultor, idProduto, idVenda)
VALUES
(100, 10, false, 1, 1, 1),
(200, 20, false, 2, 2, 2),
(300, 30, false, 3, 3, 3),
(400, 40, false, 4, 4, 4),
(500, 50, false, 5, 5, 5);

-- Inserção de dados na tabela EntregaPerca
INSERT INTO EntregaPerca (data, qtde, perca, entrega, idAgricultor, idProduto)
VALUES
('2023-12-12 11:00:00', 5, false, true, 1, 1),
('2023-12-13 12:00:00', 10, true, false, 2, 2),
('2023-12-14 13:00:00', 15, false, true, 3, 3),
('2023-12-15 14:00:00', 20, true, false, 4, 4),
('2023-12-16 15:00:00', 25, false, true, 5, 5);

-- Inserção adicional na tabela Venda
INSERT INTO Venda (data, entregaDomicilio, idCliente, idFormaPagamento)
VALUES
('2023-12-01', true, 1, 1),
('2023-12-02', false, 2, 2),
('2023-12-03', true, 3, 1),
('2023-12-04', false, 4, 3),
('2023-12-05', true, 5, 2);

-- Inserção adicional na tabela ProdutoAgricultor
INSERT INTO ProdutoAgricultor (saldoEstoque, idAgricultor, idProduto)
VALUES
(100, 1, 1),
(150, 2, 2),
(200, 3, 3),
(120, 4, 4),
(180, 5, 5);

-- Inserção adicional na tabela VendaProdutoAgricultor
INSERT INTO VendaProdutoAgricultor (valor, quantidade, acertoRealizadoAgricultor, idAgricultor, idProduto, idVenda)
VALUES
(50, 2, true, 1, 1, 1),
(80, 3, false, 2, 2, 2),
(120, 1, true, 3, 3, 3),
(60, 2, false, 4, 4, 4),
(90, 2, true, 5, 5, 5);

-- Inserção adicional na tabela EntregaPerca
INSERT INTO EntregaPerca (data, qtde, perca, entrega, idAgricultor, idProduto)
VALUES
('2023-12-12', 5, false, true, 1, 1),
('2023-12-13', 10, true, false, 2, 2),
('2023-12-14', 15, false, true, 3, 3),
('2023-12-15', 20, true, false, 4, 4),
('2023-12-16', 25, false, true, 5, 5);

-- Comando para excluir um agricultor
DELETE FROM Movimentacao WHERE idAgricultor = 2;
DELETE FROM ProdutoAgricultor WHERE idAgricultor = 2;
DELETE FROM VendaProdutoAgricultor WHERE idAgricultor = 2;
DELETE FROM EntregaPerca WHERE idAgricultor = 2;
DELETE FROM Agricultores WHERE idAgricultor = 2;
SELECT * FROM Agricultores;

-- Consulta que retorna o nome do cliente, o identificador da venda, a data da compra e o valor total de cada venda no ano de 2023
SELECT
    Cliente.nomeCliente,
    Venda.idVenda,
    Venda.data,
    SUM(VendaProdutoAgricultor.valor * VendaProdutoAgricultor.quantidade) AS valorTotal
FROM Venda
JOIN Cliente ON Venda.idCliente = Cliente.idCliente
JOIN VendaProdutoAgricultor ON Venda.idVenda = VendaProdutoAgricultor.idVenda
WHERE EXTRACT(YEAR FROM Venda.data) = 2023
GROUP BY Cliente.nomeCliente, Venda.idVenda, Venda.data
ORDER BY Cliente.nomeCliente, Venda.idVenda;

SELECT
    Cliente.nomeCliente,
    Venda.idVenda,
    Venda.data,
    (
        SELECT SUM(vp.valor * vp.quantidade)
        FROM VendaProdutoAgricultor vp
        WHERE vp.idVenda = Venda.idVenda
    ) AS valorTotal
FROM Venda
JOIN Cliente ON Venda.idCliente = Cliente.idCliente
WHERE EXTRACT(YEAR FROM Venda.data) = 2023
ORDER BY Cliente.nomeCliente, Venda.idVenda;

-- Exemplos de joins com tabelas de cidade e estado
SELECT Cliente.nomeCliente, Cidade.nomeCidade, Estado.nomeEstado
FROM Cliente
INNER JOIN Endereco ON Cliente.idEndereco = Endereco.idEndereco
INNER JOIN Bairro ON Endereco.idBairro = Bairro.idBairro
INNER JOIN Cidade ON Bairro.idCidade = Cidade.idCidade
INNER JOIN Estado ON Cidade.idEstado = Estado.idEstado;

SELECT Cliente.nomeCliente, Cidade.nomeCidade, Estado.nomeEstado
FROM Cliente
LEFT JOIN Endereco ON Cliente.idEndereco = Endereco.idEndereco
LEFT JOIN Bairro ON Endereco.idBairro = Bairro.idBairro
LEFT JOIN Cidade ON Bairro.idCidade = Cidade.idCidade
LEFT JOIN Estado ON Cidade.idEstado = Estado.idEstado;

SELECT Cliente.nomeCliente, Cidade.nomeCidade, Estado.nomeEstado
FROM Cliente
RIGHT JOIN Endereco ON Cliente.idEndereco = Endereco.idEndereco
RIGHT JOIN Bairro ON Endereco.idBairro = Bairro.idBairro
RIGHT JOIN Cidade ON Bairro.idCidade = Cidade.idCidade
RIGHT JOIN Estado ON Cidade.idEstado = Estado.idEstado;

SELECT Cliente.nomeCliente, Cidade.nomeCidade, Estado.nomeEstado
FROM Cliente
FULL OUTER JOIN Endereco ON Cliente.idEndereco = Endereco.idEndereco
FULL OUTER JOIN Bairro ON Endereco.idBairro = Bairro.idBairro
FULL OUTER JOIN Cidade ON Bairro.idCidade = Cidade.idCidade
FULL OUTER JOIN Estado ON Cidade.idEstado = Estado.idEstado;

SELECT Cliente.nomeCliente, Cidade.nomeCidade, Estado.nomeEstado
FROM Cliente
LEFT JOIN Endereco ON Cliente.idEndereco = Endereco.idEndereco
LEFT JOIN Bairro ON Endereco.idBairro = Bairro.idBairro
LEFT JOIN Cidade ON Bairro.idCidade = Cidade.idCidade
LEFT JOIN Estado ON Cidade.idEstado = Estado.idEstado
WHERE Cidade.idCidade IS NULL;

SELECT Cliente.nomeCliente, Cidade.nomeCidade, Estado.nomeEstado
FROM Cliente
RIGHT JOIN Endereco ON Cliente.idEndereco = Endereco.idEndereco
RIGHT JOIN Bairro ON Endereco.idBairro = Bairro.idBairro
RIGHT JOIN Cidade ON Bairro.idCidade = Cidade.idCidade
RIGHT JOIN Estado ON Cidade.idEstado = Estado.idEstado
WHERE Cliente.idCliente IS NULL;

SELECT Cliente.nomeCliente, Cidade.nomeCidade, Estado.nomeEstado
FROM Cliente
FULL OUTER JOIN Endereco ON Cliente.idEndereco = Endereco.idEndereco
FULL OUTER JOIN Bairro ON Endereco.idBairro = Bairro.idBairro
FULL OUTER JOIN Cidade ON Bairro.idCidade = Cidade.idCidade
FULL OUTER JOIN Estado ON Cidade.idEstado = Estado.idEstado
WHERE Cliente.idCliente IS NULL OR Cidade.idCidade IS NULL;

-- Consulta que retorna as cidades que tiveram vendas em novembro de 2023
SELECT DISTINCT C.nomeCidade
FROM Cidade C
WHERE C.idCidade IN (
   SELECT DISTINCT V.idVenda
   FROM Venda V
   WHERE EXTRACT(YEAR FROM V.data) = 2023 AND EXTRACT(MONTH FROM V.data) = 11
)
ORDER BY C.nomeCidade;

-- Consulta que retorna as cidades que não tiveram vendas em novembro de 2023
SELECT DISTINCT C.nomeCidade
FROM Cidade C
WHERE C.idCidade NOT IN (
   SELECT DISTINCT V.idVenda
   FROM Venda V
   WHERE EXTRACT(YEAR FROM V.data) = 2023 AND EXTRACT(MONTH FROM V.data) = 11
)
ORDER BY C.nomeCidade;

-- Consulta que retorna informações sobre o agricultor
SELECT
    Agricultores.nomeAgricultor,
    Produto.nomeProduto,
    SUM(VendaProdutoAgricultor.valor) AS valorTotalVendido,
    SUM(VendaProdutoAgricultor.quantidade) AS quantidadeTotalVendida,
    COUNT(EntregaPerca.entrega) AS quantidadeTotalEntregue,
    SUM(EntregaPerca.qtde) AS quantidadeTotalPerda
FROM Agricultores
JOIN ProdutoAgricultor ON Agricultores.idAgricultor = ProdutoAgricultor.idAgricultor
JOIN Produto ON ProdutoAgricultor.idProduto = Produto.idProduto
LEFT JOIN VendaProdutoAgricultor ON ProdutoAgricultor.idAgricultor = VendaProdutoAgricultor.idAgricultor
    AND ProdutoAgricultor.idProduto = VendaProdutoAgricultor.idProduto
LEFT JOIN EntregaPerca ON ProdutoAgricultor.idAgricultor = EntregaPerca.idAgricultor
    AND ProdutoAgricultor.idProduto = EntregaPerca.idProduto
GROUP BY Agricultores.nomeAgricultor, Produto.nomeProduto;

-- Comando para adicionar a data de aniversário no cadastro do cliente
ALTER TABLE Cliente
ADD COLUMN dataAniversario DATE;

UPDATE Cliente
SET dataAniversario = '1985-12-14'
WHERE idCliente = 1;

UPDATE Cliente
SET dataAniversario = '1985-12-15'
WHERE idCliente = 2;

UPDATE Cliente
SET dataAniversario = '1985-12-16'
WHERE idCliente = 3;

UPDATE Cliente
SET dataAniversario = '1985-12-17'
WHERE idCliente = 4;

UPDATE Cliente
SET dataAniversario = '1985-12-18'
WHERE idCliente = 5;

SELECT idCliente, nomeCliente, dataAniversario
FROM Cliente;

-- Consulta que retorna os clientes que fazem aniversário na data atual
SELECT idCliente, nomeCliente, dataAniversario
FROM Cliente
WHERE DATE_PART('month', dataAniversario) = DATE_PART('month', CURRENT_DATE)
      AND DATE_PART('day', dataAniversario) = DATE_PART('day', CURRENT_DATE);

-- Consulta que retorna o nome do cliente e as datas de suas compras
SELECT
    Cliente.nomeCliente,
    MAX(Venda.data) AS dataUltimaCompra,
    MIN(Venda.data) AS dataPrimeiraCompra
FROM Cliente
JOIN Venda ON Cliente.idCliente = Venda.idCliente
WHERE
    Venda.data BETWEEN '2023-10-01' AND '2023-10-31'  -- Compraram em outubro
    AND Cliente.idCliente NOT IN (
        SELECT Venda.idCliente
        FROM Venda
        WHERE Venda.data BETWEEN '2023-11-01' AND '2023-11-30'  -- Não compraram em novembro
    )
GROUP BY Cliente.nomeCliente
ORDER BY dataUltimaCompra;

-- Comando para inserir datas de aniversários em Agricultores
ALTER TABLE Agricultores
ADD COLUMN dataAniversario DATE;

UPDATE Agricultores
SET dataAniversario = '2003-11-16'
WHERE idAgricultor = 1;

UPDATE Agricultores
SET dataAniversario = '2003-11-12'
WHERE idAgricultor = 2;

UPDATE Agricultores
SET dataAniversario = '2003-12-15'
WHERE idAgricultor = 3;

UPDATE Agricultores
SET dataAniversario = '2003-12-16'
WHERE idAgricultor = 4;

UPDATE Agricultores
SET dataAniversario = '2003-12-17'
WHERE idAgricultor = 5;

-- Listagem de clientes e agricultores que fazem aniversário na data atual
SELECT
    'Cliente' AS Tipo,
    idCliente AS ID,
    nomeCliente AS Nome,
    dataAniversario AS DataAniversario
FROM Cliente
WHERE EXTRACT(DAY FROM dataAniversario) = EXTRACT(DAY FROM CURRENT_DATE)
    AND EXTRACT(MONTH FROM dataAniversario) = EXTRACT(MONTH FROM CURRENT_DATE)

UNION ALL

SELECT
    'Agricultor' AS Tipo,
    idAgricultor AS ID,
    nomeAgricultor AS Nome,
    dataAniversario AS DataAniversario
FROM Agricultores
WHERE EXTRACT(DAY FROM dataAniversario) = EXTRACT(DAY FROM CURRENT_DATE)
    AND EXTRACT(MONTH FROM dataAniversario) = EXTRACT(MONTH FROM CURRENT_DATE)
ORDER BY DataAniversario;

-- Consulta que retorna informações de clientes que compraram em 2023
SELECT
    Cliente.nomeCliente,
    Cidade.nomeCidade,
    Estado.nomeEstado
FROM Cliente
JOIN Endereco ON Cliente.idEndereco = Endereco.idEndereco
JOIN Bairro ON Endereco.idBairro = Bairro.idBairro
JOIN Cidade ON Bairro.idCidade = Cidade.idCidade
JOIN Estado ON Cidade.idEstado = Estado.idEstado
JOIN Venda ON Cliente.idCliente = Venda.idCliente
WHERE Venda.data >= '2023-01-01' AND Venda.data < '2024-01-01'
ORDER BY Estado.nomeEstado, Cidade.nomeCidade, Cliente.nomeCliente;

-- Consulta que retorna o nome do produto, o valor total e a quantidade vendida para cada produto
SELECT p.nome AS nome_produto, 
SELECT
    Produto.nomeProduto,
    SUM(VendaProdutoAgricultor.valor) AS valorTotal,
    SUM(VendaProdutoAgricultor.quantidade) AS quantidadeVendida
FROM Produto
JOIN VendaProdutoAgricultor ON Produto.idProduto = VendaProdutoAgricultor.idProduto
GROUP BY Produto.nomeProduto
ORDER BY valorTotal;

-- Consulta que retorna o nome do produto e o tipo dos produtos que não tiveram vendas em outubro
SELECT
   nomeProduto
FROM Produto
WHERE idProduto NOT IN (
   SELECT DISTINCT VPA.idProduto
   FROM VendaProdutoAgricultor VPA
   JOIN Venda V ON VPA.idVenda = V.idVenda
   WHERE EXTRACT(MONTH FROM V.data) = 10
);

-- Consulta que retorna informações sobre formas de pagamento no ano de 2023
SELECT
    FP.nomeFormaPagamento,
    SUM(M.valor) AS valorTotalVendido,
    SUM(CASE WHEN M.acerto THEN M.valor ELSE 0 END) AS valorTotalAcerto,
    SUM(CASE WHEN M.emprestimo THEN M.valor ELSE 0 END) AS valorTotalEmprestimo,
    SUM(CASE WHEN M.pagamento THEN M.valor ELSE 0 END) AS valorTotalPagamentos
FROM FormaPagamento FP
LEFT JOIN Movimentacao M ON FP.idFormaPagamento = M.idFormaPagamento AND EXTRACT(YEAR FROM M.data) = 2023
GROUP BY FP.nomeFormaPagamento
ORDER BY FP.nomeFormaPagamento;

-- Consulta que lista o nome do cliente, forma de pagamento e total comprado por forma de pagamento
SELECT
    Cliente.nomeCliente,
    FormaPagamento.nomeFormaPagamento,
    SUM(VendaProdutoAgricultor.valor) AS valorTotalComprado
FROM Cliente
JOIN Venda ON Cliente.idCliente = Venda.idCliente
JOIN FormaPagamento ON Venda.idFormaPagamento = FormaPagamento.idFormaPagamento
JOIN VendaProdutoAgricultor ON Venda.idVenda = VendaProdutoAgricultor.idVenda
GROUP BY Cliente.nomeCliente, FormaPagamento.nomeFormaPagamento
ORDER BY Cliente.nomeCliente, FormaPagamento.nomeFormaPagamento;

-- Consulta que retorna os 3 estados com maior valor total de vendas
SELECT
    Estado.nomeEstado,
    SUM(VendaProdutoAgricultor.valor) AS valorTotalVendas
FROM Estado
JOIN Cidade ON Estado.idEstado = Cidade.idEstado
JOIN Bairro ON Cidade.idCidade = Bairro.idCidade
JOIN Endereco ON Bairro.idBairro = Endereco.idBairro
JOIN Cliente ON Endereco.idEndereco = Cliente.idEndereco
JOIN Venda ON Cliente.idCliente = Venda.idCliente
JOIN VendaProdutoAgricultor ON Venda.idVenda = VendaProdutoAgricultor.idVenda
GROUP BY Estado.nomeEstado
HAVING SUM(VendaProdutoAgricultor.valor) > 0
ORDER BY valorTotalVendas DESC
LIMIT 3;

-- Consulta que retorna clientes da cidade de Vitória, Colatina e/ou Baixo Guandu
SELECT
    Cliente.nomeCliente,
    Cidade.nomeCidade
FROM Cliente
JOIN Endereco ON Cliente.idEndereco = Endereco.idEndereco
JOIN Bairro ON Endereco.idBairro = Bairro.idBairro
JOIN Cidade ON Bairro.idCidade = Cidade.idCidade
WHERE Cidade.nomeCidade IN ('Vitória', 'Colatina', 'Baixo Guandu');

SELECT
    Cliente.nomeCliente,
    Cidade.nomeCidade
FROM Cliente
JOIN Endereco ON Cliente.idEndereco = Endereco.idEndereco
JOIN Bairro ON Endereco.idBairro = Bairro.idBairro
JOIN Cidade ON Bairro.idCidade = Cidade.idCidade
WHERE Cidade.nomeCidade = 'Vitória' OR Cidade.nomeCidade = 'Colatina' OR Cidade.nomeCidade = 'Baixo Guandu';

-- Consulta que retorna todos os produtos, exceto Banana e Quiabo
SELECT
    *
FROM Produto
WHERE nomeProduto <> 'Banana' AND nomeProduto <> 'Quiabo';

SELECT nomeProduto
FROM Produto
EXCEPT
SELECT nomeProduto
FROM Produto
WHERE nomeProduto IN ('Banana', 'Quiabo');

-- Consulta que retorna o valor total de vendas agrupados por ano e mês
SELECT
    EXTRACT(YEAR FROM Venda.data) AS ano,
    EXTRACT(MONTH FROM Venda.data) AS mes,
    SUM(VendaProdutoAgricultor.valor) AS valorTotalVendas
FROM Venda
JOIN VendaProdutoAgricultor ON Venda.idVenda = VendaProdutoAgricultor.idVenda
GROUP BY ano, mes
ORDER BY ano, mes;

-- Consulta que retorna o nome do agricultor e suas comissões
SELECT
    Agricultores.nomeAgricultor,
    EXTRACT(YEAR FROM Venda.data) AS ano,
    EXTRACT(MONTH FROM Venda.data) AS mes,
    SUM(VendaProdutoAgricultor.valor * Agricultores.taxaAssociado) AS valorTotalComissao
FROM Agricultores
JOIN VendaProdutoAgricultor ON Agricultores.idAgricultor = VendaProdutoAgricultor.idAgricultor
JOIN Venda ON VendaProdutoAgricultor.idVenda = Venda.idVenda
GROUP BY Agricultores.nomeAgricultor, ano, mes
ORDER BY Agricultores.nomeAgricultor, ano, mes;

-- Consulta que lista produtos que venderam mais que 2000 reais
SELECT
    Produto.nomeProduto,
    SUM(VendaProdutoAgricultor.valor) AS valorTotalVendas
FROM Produto
JOIN VendaProdutoAgricultor ON Produto.idProduto = VendaProdutoAgricultor.idProduto
WHERE VendaProdutoAgricultor.valor > 2000
GROUP BY Produto.nomeProduto;

-- Consulta que retorna clientes que não compraram em novembro de 2022
SELECT
    Cliente.nomeCliente,
    CASE
        WHEN COUNT(Venda.idVenda) = 0 THEN 'Nunca Comprou'
        WHEN COUNT(CASE WHEN EXTRACT(MONTH FROM Venda.data) = 11
        AND EXTRACT(YEAR FROM Venda.data) = 2022 THEN 1 END) = 0 THEN 'Não Comprou em Novembro 2022'
    END AS statusCompra
FROM Cliente
LEFT JOIN Venda ON Cliente.idCliente = Venda.idCliente
GROUP BY Cliente.nomeCliente
ORDER BY Cliente.nomeCliente;

-- Consulta que retorna o cliente com a maior compra no segundo semestre de 2023
SELECT
    Cliente.nomeCliente,
    Venda.idVenda,
    MAX(VendaProdutoAgricultor.valor) AS maiorValorCompra
FROM Cliente
JOIN Venda ON Cliente.idCliente = Venda.idCliente
JOIN VendaProdutoAgricultor ON Venda.idVenda = VendaProdutoAgricultor.idVenda
WHERE Venda.data >= '2023-07-01' AND Venda.data < '2024-01-01'
GROUP BY Cliente.nomeCliente, Venda.idVenda
ORDER BY maiorValorCompra DESC
LIMIT 1;

-- Consulta que retorna os produtos menos vendidos e a quantidade vendida
SELECT
    Produto.nomeProduto,
    SUM(CASE WHEN VendaProdutoAgricultor.quantidade IS NOT NULL THEN VendaProdutoAgricultor.quantidade ELSE 0 END) AS quantidadeVendida
FROM Produto
LEFT JOIN VendaProdutoAgricultor ON Produto.idProduto = VendaProdutoAgricultor.idProduto
GROUP BY Produto.nomeProduto
ORDER BY quantidadeVendida ASC;

-- Consulta que retorna o valor total vendido por estado, incluindo estados sem vendas
SELECT
   Estado.nomeEstado,
   SUM(VendaProdutoAgricultor.valor + 0) AS valorTotalVendido
FROM Estado
LEFT OUTER JOIN Cidade ON Estado.idEstado = Cidade.idEstado
LEFT OUTER JOIN Bairro ON Cidade.idCidade = Bairro.idCidade
LEFT OUTER JOIN Endereco ON Bairro.idBairro = Endereco.idBairro
LEFT OUTER JOIN Cliente ON Endereco.idEndereco = Cliente.idEndereco
LEFT OUTER JOIN Venda ON Cliente.idCliente = Venda.idCliente
LEFT OUTER JOIN VendaProdutoAgricultor ON Venda.idVenda = VendaProdutoAgricultor.idVenda
GROUP BY Estado.nomeEstado
ORDER BY Estado.nomeEstado;

-- Comando para adicionar coluna ValorTotal na tabela Cliente
ALTER TABLE Cliente
ADD COLUMN ValorTotal FLOAT;

UPDATE Cliente
SET ValorTotal = (
   SELECT SUM(VPA.valor)
   FROM VendaProdutoAgricultor VPA
   JOIN Venda V ON VPA.idVenda = V.idVenda
   WHERE Cliente.idCliente = V.idCliente
   GROUP BY V.idCliente
);

SELECT * FROM Cliente;

-- Comando que adiciona restrição para nomes de clientes únicos
ALTER TABLE Cliente
ADD CONSTRAINT nome_unico UNIQUE (nomeCliente);

-- Comando que adiciona restrição para data de aniversário não nula
ALTER TABLE Cliente
ALTER COLUMN dataAniversario SET NOT NULL;

-- Comando que exclui a restrição de não permitir aniversários nulos
ALTER TABLE Cliente
ALTER COLUMN dataAniversario DROP NOT NULL;

-- Comandos para adicionar campo classe na tabela Cliente e classificar os clientes
ALTER TABLE cliente
ADD COLUMN classe INT;

UPDATE cliente
SET classe =
   CASE
       WHEN valortotal <= 1000 THEN 1
       WHEN valortotal <= 2000 THEN 2
       WHEN valortotal <= 3000 THEN 3
       WHEN valortotal <= 4000 THEN 4
       ELSE 5
   END
WHERE EXISTS (
   SELECT 1
   FROM venda v
   WHERE v.idCliente = cliente.idCliente
   AND EXTRACT(YEAR FROM v.data) = 2023
);

-- Comando que apaga estados sem cidades cadastradas
DELETE FROM Estado
WHERE idEstado NOT IN (SELECT idEstado FROM Cidade WHERE idEstado IS NOT NULL);

-- Consulta que retorna informações de vendas por ano e mês
SELECT
    EXTRACT(YEAR FROM V.data) AS ano,
    EXTRACT(MONTH FROM V.data) AS mes,
    SUM(VPA.valor) AS valorTotalVendas,
    COUNT(DISTINCT V.idVenda) AS quantidadePedidos,
    COUNT(DISTINCT VP.idProduto) AS quantidadeProdutosVendidos,
    COUNT(DISTINCT E.idEndereco) AS numeroEstadosAtendidos,
    COUNT(DISTINCT C.idCidade) AS numeroCidadesAtendidas,
    COUNT(DISTINCT Cl.idCliente) AS numeroClientesAtendidos
FROM Venda V
JOIN VendaProdutoAgricultor VPA ON V.idVenda = VPA.idVenda
JOIN VendaProdutoAgricultor VP ON V.idVenda = VP.idVenda
JOIN Cliente Cl ON V.idCliente = Cl.idCliente
JOIN Endereco E ON Cl.idEndereco = E.idEndereco
JOIN Cidade C ON E.idBairro = C.idCidade
GROUP BY ano, mes
ORDER BY ano, mes;

-- Consulta que retorna o nome do agricultor e os produtos que ele não vendeu em novembro de 2023
SELECT
    A.nomeAgricultor,
    P.nomeProduto
FROM
    Agricultores A,
    Produto P
WHERE
    (A.idAgricultor, P.idProduto) NOT IN (
        SELECT
            VPA.idAgricultor,
            VPA.idProduto
        FROM
            VendaProdutoAgricultor VPA
            JOIN Venda V ON VPA.idVenda = V.idVenda
        WHERE
            EXTRACT(YEAR FROM V.data) = 2023 AND EXTRACT(MONTH FROM V.data) = 11
    );

-- Consulta que retorna o nome das cidades que tiveram venda no ano passado e não foram atendidas este ano
SELECT DISTINCT C.nomeCidade
FROM Cidade C
WHERE C.idCidade IN (
   SELECT DISTINCT V.idVenda
   FROM Venda V
   WHERE EXTRACT(YEAR FROM V.data) = 2022
   ) AND C.idCidade NOT IN (
       SELECT DISTINCT V.idVenda
       FROM Venda V
       WHERE EXTRACT(YEAR FROM V.data) = 2023
   );

-- Consulta que retorna o nome do produto e o número de clientes que compraram este produto
SELECT
    P.nomeProduto,
    COUNT(DISTINCT V.idCliente) AS numeroClientes
FROM Produto P
LEFT JOIN VendaProdutoAgricultor VP ON P.idProduto = VP.idProduto
LEFT JOIN Venda V ON VP.idVenda = V.idVenda
GROUP BY P.nomeProduto
ORDER BY P.nomeProduto;

-- Consulta que retorna o valor total vendido por estado e produto
SELECT
   E.nomeEstado,
   P.nomeProduto,
   SUM(VPA.valor) AS valorTotalVendido
FROM Estado E
JOIN Cidade C ON E.idEstado = C.idEstado
JOIN Venda V ON C.idCidade = V.idVenda
JOIN VendaProdutoAgricultor VPA ON V.idVenda = VPA.idVenda
JOIN Produto P ON VPA.idProduto = P.idProduto
GROUP BY E.nomeEstado, P.nomeProduto
ORDER BY E.nomeEstado, P.nomeProduto;

-- Sequência de comandos para apagar todos os dados do banco de dados e depois as tabelas
-- Primeiro, apaga todos os dados das tabelas (respeitando as chaves estrangeiras)
DROP TABLE ProdutoAgricultor;
DROP TABLE VendaProdutoAgricultor;
DROP TABLE EntregaPerca;
DROP TABLE Movimentacao;
DROP TABLE Venda;
DROP TABLE Cliente;
DROP TABLE Endereco;
DROP TABLE Bairro;
DROP TABLE Cidade;
DROP TABLE Estado;
DROP TABLE FormaPagamento;
DROP TABLE Fornecedor;
DROP TABLE Agricultores;
DROP TABLE Produto;
