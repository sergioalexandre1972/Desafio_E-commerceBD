select * from Cliente;
select * from ClientePF;
select * from ClientePJ;
select * from  Produto; 
-- 1. Quantos pedidos foram feitos por cada cliente?

SELECT c.idCliente, CONCAT(c.pNome, ' ', c.Sobrenome) AS NomeCliente,
COUNT(p.idPedido) AS TotalPedidos FROM Cliente c LEFT JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
GROUP BY c.idCliente, c.pNome, c.Sobrenome;

-- 2. Algum vendedor também é fornecedor?
SELECT
vt.Razao_Social AS NomeVendedor,
f.Razao_Social AS NomeFornecedor
FROM Vendedor_terceiro vt
JOIN Fornecedor f ON vt.Razao_Social = f.Razao_Social;

-- 3. Relação de produtos, fornecedores e estoques
SELECT
p.idProduto,
p.Descricao,
f.Razao_Social AS Fornecedor,
e.Local AS LocalEstoque,
pe.Quantidade AS QtdEstoque
FROM Produto p
JOIN Produto_fornecedor pf ON pf.Produto_idProduto = p.idProduto
JOIN Fornecedor f ON pf.Fornecedor_idFornecedor = f.idFornecedor
JOIN Produto_estoque pe ON pe.Produto_idProduto = p.idProduto
JOIN Estoque e ON e.idEstoque = pe.Estoque_idEstoque;

-- 4. Relação de nomes dos fornecedores e nomes dos produtos
SELECT
f.Razao_Social AS Fornecedor,
p.Descricao AS Produto
FROM Fornecedor f
JOIN Produto_fornecedor pf ON pf.Fornecedor_idFornecedor = f.idFornecedor
JOIN Produto p ON pf.Produto_idProduto = p.idProduto
ORDER BY f.Razao_Social, p.Descricao;

-- 5. Recuperaçãos simples (SELECT)
SELECT Descricao, Valor FROM Produto;

-- 6. Filtros com WHERE (Ex: produtos com valor acima de R$100)
SELECT * FROM Produto WHERE Valor > 100.00;

-- 7. Atributo derivado: total do pedido (valor dos produtos * quantidades)
SELECT
pp.Pedido_idPedido,
SUM(pp.Quantidade * pr.Valor) AS TotalPedido
FROM Produto_pedido pp
JOIN Produto pr ON pr.idProduto = pp.Produto_idProduto
GROUP BY pp.Pedido_idPedido;

-- 8. Ordenação: lista de clientes por ordem de sobrenome
SELECT * FROM Cliente ORDER BY Sobrenome ASC;

-- 9. Agrupamento com GROUP BY e HAVING (Ex: clientes com mais de 0 pedido)
SELECT
c.idCliente,
CONCAT(c.pNome, ' ', c.Sobrenome) AS NomeCliente,
COUNT(p.idPedido) AS TotalPedidos
FROM Cliente c
JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
GROUP BY c.idCliente, c.pNome, c.Sobrenome
HAVING COUNT(p.idPedido) > 0;

-- 10. JOIN múltiplos com filtro (Produtos e vendedores com quantidade acima de 30)
SELECT
p.Descricao AS Produto,
vt.Nome_fantasia AS Vendedor,
pv.Quantidade
FROM Produto_terceiro pv
JOIN Produto p ON pv.Produto_idProduto = p.idProduto
JOIN Vendedor_terceiro vt ON pv.Terceiro_vendedor_idTerceiro_vendedor = vt.idTerceiro_vendedor
WHERE pv.Quantidade > 30;

-- 11. Lista de pedidos com status 'entregue' e suas datas de entrega
SELECT
idPedido, Status_do_pedido, VFrete
FROM Pedido
WHERE Status_do_pedido = 'Pago';

-- 12. Produtos que não estão associados a nenhum fornecedor
SELECT p.idProduto, p.Descricao
FROM Produto p
LEFT JOIN Produto_fornecedor pf ON pf.Produto_idProduto = p.idProduto
WHERE pf.Fornecedor_idFornecedor IS NULL;

-- 13. Estoques com quantidade total de itens armazenados
SELECT
e.idEstoque, e.Local,
SUM(pe.Quantidade) AS TotalItens
FROM Estoque e
JOIN Produto_estoque pe ON e.idEstoque = pe.Estoque_idEstoque
GROUP BY e.idEstoque, e.Local;


-- 14. Valor total gasto por cada cliente em pedidos
SELECT
c.idCliente,
CONCAT(c.pNome, ' ', c.Sobrenome) AS Nome,
SUM(pp.Quantidade * pr.Valor) AS TotalGasto
FROM Cliente c
JOIN Pedido p ON p.Cliente_idCliente = c.idCliente
JOIN Produto_pedido pp ON pp.Pedido_idPedido = p.idPedido
JOIN Produto pr ON pr.idProduto = pp.Produto_idProduto
GROUP BY c.idCliente, c.pNome, c.Sobrenome;

-- 15. Produtos mais vendidos (maiores quantidades em pedidos)
SELECT
pr.Descricao,
SUM(pp.Quantidade) AS QuantidadeTotal
FROM Produto pr
JOIN Produto_pedido pp ON pr.idProduto = pp.Produto_idProduto
GROUP BY pr.idProduto, pr.Descricao
ORDER BY QuantidadeTotal DESC;

-- 16. Clientes que não realizaram nenhum pedido
SELECT
c.idCliente,
CONCAT(c.pNome, ' ', c.Sobrenome) AS Nome
FROM Cliente c
LEFT JOIN Pedido p ON p.Cliente_idCliente = c.idCliente
WHERE p.idPedido IS NULL;

-- 17. Produtos vendidos por um vendedor
SELECT
p.idProduto, p.Descricao,
COUNT(DISTINCT pv.Terceiro_vendedor_idTerceiro_vendedor) AS TotalVendedores
FROM Produto p
JOIN Produto_terceiro pv ON p.idProduto = pv.Produto_idProduto
GROUP BY p.idProduto, p.Descricao
HAVING COUNT(DISTINCT pv.Terceiro_vendedor_idTerceiro_vendedor) = 1;


-- 18. Lista de clientes PF e seus respectivos CPFs
SELECT
c.idCliente,
CONCAT(c.pNome, ' ', c.Sobrenome) AS Nome,
pf.cpf
FROM Cliente c
JOIN ClientePF pf ON pf.Cliente_idCliente = c.idCliente;

-- 19. Lista de clientes PJ e seus CNPJs
SELECT
c.idCliente,
CONCAT(c.pNome, ' ', c.Sobrenome) AS Nome,
pj.cnpj
FROM Cliente c
JOIN ClientePJ pj ON pj.Cliente_idCliente = c.idCliente;

-- 20. Produtos com menor estoque disponível
SELECT
p.idProduto, p.Descricao,
MIN(pe.Quantidade) AS MenorQuantidade
FROM Produto p
JOIN Produto_estoque pe ON pe.Produto_idProduto = p.idProduto
GROUP BY p.idProduto, p.Descricao
ORDER BY MenorQuantidade ASC;