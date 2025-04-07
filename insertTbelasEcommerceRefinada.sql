INSERT INTO Cliente (idCliente, pNome, NomeInicial, Sobrenome, CPF, endereco, DatadeNascimento) 
	VALUES(1, 'João', 'A', 'Silva', '12345678901', 'Rua A, 123', '1980-05-15'),
		  (2, 'Maria', 'B', 'Oliveira', '98765432100', 'Rua B, 456', '1990-11-20'),
		  (3, 'Carlos', 'C', 'Souza', '11122233344', 'Rua C, 789', '1985-03-10'),
	      (4, 'Ana', 'D', 'Costa', '55566677788', 'Rua D, 101', '1992-08-22'),
		  (5, 'Pedro', 'E', 'Almeida', '99988877766', 'Rua E, 303', '1987-12-12'),
		  (6, 'Fernanda', 'F', 'Martins', '44455566677', 'Rua F, 505', '1995-07-07'),
		  (7, 'Lucas', 'G', 'Lima', '33322211100', 'Rua G, 707', '1991-04-04');

-- Tabela: ClientePF
INSERT INTO ClientePF (cpf, Cliente_idCliente) 
	   VALUES('12345678901', 1),
			 ('98765432100', 2),
			 ('11122233344', 3),
			 ('55566677788', 4),
			 ('99988877766', 5),
			 ('44455566677', 6),
			 ('33322211100', 7);

-- Tabela: ClientePJ

INSERT INTO ClientePJ (RazaoSocial, NomeFantasia, CNPJ, Cliente_idCliente) 
       VALUES('Móveis Elegantes LTDA', 'MoveLar', '11222333000199', 1),
		     ('Brinquedos Sorriso SA', 'Sorriso Kids', '22334455000188', 2),
			 ('VesteBem Co.', 'ModaFácil', '33445566000177', 3),
			 ('TechZone', 'EletronicTech', '44556677000166', 4),
			 ('Delícias da Terra', 'Delícias', '55667788000155', 5),
			 ('Gourmet Brasil', 'GourmetBr', '66778899000144', 6),
			 ('Eletrônicos 10', 'E10', '77889900011233', 7);

-- Tabela: Fornecedor
INSERT INTO Fornecedor (idFornecedor, Razao_Social, CNPJ, Fornecedorcod) 
	   VALUES(1, 'Moveis e Estilo', '778899000112', 'Fornecedor A'),
			 (2, 'Brinquedos Felizes', '998877665544', 'Fornecedor B'),
			 (3, 'Moda Fashion', '111222333444', 'Fornecedor C'),
			 (4, 'Tech Imports', '222333444555', 'Fornecedor D'),
			 (5, 'Alimentos Brasil', '333444555666', 'Fornecedor E'),
			 (6, 'Gourmet e Cia', '444555666777', 'Fornecedor F'),
			 (7, 'Eletrônicos do Sul', '555666777888', 'Fornecedor G');

-- Tabela: Vendedor Terceiro
INSERT INTO Vendedor_terceiro (idTerceiro_vendedor, Razao_Social, Nome_fantasia, Endereço, Localidade) 
	   VALUES(1, 'Vendas Rápidas LTDA', 'VendeJá', 'Av. Brasil, 1000', 'São Paulo'),
			 (2, 'Loja Feliz', 'FelizCompra', 'Rua das Flores, 234', 'Rio de Janeiro'),
			 (3, 'Top Moda', 'ModaTop', 'Av. do Estilo, 45', 'Curitiba'),
			 (4, 'EletroTudo', 'TudoEletrônico', 'Rua Nova, 89', 'Belo Horizonte'),
			 (5, 'Brinca e Aprende', 'Brincando', 'Av. Criança, 77', 'Salvador'),
			 (6, 'Mundo Gourmet', 'GourmetMundo', 'Rua Saborosa, 101', 'Porto Alegre'),
			 (7, 'Casa Móveis', 'LarIdeal', 'Av. Casa Feliz, 202', 'Fortaleza');

-- Tabela: Produto
INSERT INTO Produto (idProduto, Categoria, Descricao, Valor) 
	   VALUES(1, 'Móveis', 'Sofá 3 lugares retrátil', '1500.00'),
			 (2, 'Brinquedos', 'Boneca articulada com acessórios', '120.00'),
	       	 (3, 'Vestuário', 'Jaqueta jeans feminina', '200.00'),
			 (4, 'Eletrônicos', 'Smartphone 128GB', '1800.00'),
			 (5, 'Alimentos', 'Kit gourmet com temperos artesanais', '75.00'),
			 (6, 'Eletrônicos', 'Smartwatch com monitor cardíaco', '350.00'),
			 (7, 'Vestuário', 'Tênis esportivo masculino', '250.00');
-- Tabela: Produto_Fornecedor
INSERT INTO Produto_fornecedor (Fornecedor_idFornecedor, Produto_idProduto) 
       VALUES(1, 1),
			 (1, 2),
             (2, 3),
             (3, 4),
             (4, 5),
             (5, 6),
             (6, 7);

-- Tabela: Prod/Vendedor (terceiro)
INSERT INTO Produto_terceiro(Terceiro_vendedor_idTerceiro_vendedor, Produto_idProduto, Quantidade) 
       VALUES(1, 1, 50),
			 (2, 2, 30),
             (3, 3, 20),
             (4, 4, 40),
             (5, 5, 35),
             (6, 6, 25),
             (7, 7, 45);

-- Tabela: Estoque
INSERT INTO Estoque (idEstoque, Local) 
	   VALUES(1, 'Galpão Central'),
			 (2, 'Galpão Zona Norte'),
             (3, 'Galpão Sul'),
             (4, 'Depósito 1'),
             (5, 'Depósito 2'),
             (6, 'Depósito 3'),
             (7, 'Central de Logística');

-- Tabela: Produto_em_estoque
INSERT INTO Produto_estoque (Estoque_idEstoque, Produto_idProduto, Quantidade) 
       VALUES(1, 1, 200),
			 (2, 2, 150),
             (3, 3, 100),
             (4, 4, 80),
             (5, 5, 60),
             (6, 6, 50),
             (7, 7, 70);

-- Tabela: Entrega
INSERT INTO Entrega (idEntrega, Status_da_Entrega, Codigo_de_Rastreio) 
	   VALUES(1, 'Enviado', 'BR123456789'),
             (2, 'Entregue', 'BR987654321'),
             (3, 'Em Processamento', 'BR111213141'),
             (4, 'Em Processamento', 'BR515253545'), 
             (5, 'A Caminho', 'BR616263646'),
             (6, 'Em Processamento', 'BR717273747'),
             (7, 'A Caminho', 'BR818283848');


-- Tabela: Pedido
INSERT INTO Pedido (idPedido, Status_do_pedido, Descricao, VFrete, Cliente_idCliente, Entrega_idEntrega) 
       VALUES(1, 'Pago', 'Compra de sofá e tênis', 60.00, 1, 1),
  		     (2, 'Enviado', 'Boneca e smartwatch', 25.00, 2, 2),
		     (3, 'Pendente', 'Jaqueta jeans', 15.00, 3, 3),
			 (4, 'Cancelado', 'Smartphone cancelado', 0.00, 4, 4),
			 (5, 'Enviado', 'Kit gourmet', 20.00, 5, 5),
		 	 (6, 'Pago', 'Tênis e smartwatch', 35.00, 6, 6),
			 (7, 'Enviado', 'Jaqueta e boneca', 30.00, 7, 7);


-- Tabela: Produto/pedido
INSERT INTO Produto_pedido (Produto_idProduto, Pedido_idPedido, Quantidade, Pstatus) 
       VALUES(1, 1, 1, 'Disponivel'),
             (7, 1, 1, 'Disponivel'),
             (2, 2, 1, 'Disponivel'),
             (6, 2, 1, 'Indisponivel'),
             (3, 3, 1, 'Indisponivel'),
             (4, 4, 1, 'Disponivel'),
             (5, 5, 1, 'Disponivel');


-- Tabela: Pagamento
INSERT INTO Pagamento (idPagamento, Tipo_de_Pagamento, Valor, Numero_do_Cartao, Bandeira_do_Cartao, Pedido_idPedido) 
       VALUES(1, 'Cartão', 1750.00, '4111111111111111', 'Visa', 1),
			 (2, 'Pix', 470.00, NULL, NULL, 2),
			 (3, 'Dinheiro', 215.00, NULL, NULL, 3),
			 (4, 'Dinheiro', 1800.00, NULL, NULL, 4),
			 (5, 'Cartão', 75.00, '4222222222222', 'Mastercard', 5),
			 (6, 'Pix', 600.00, NULL, NULL, 6),
			 (7, 'Cartão', 320.00, '4333333333333', 'Elo', 7);


