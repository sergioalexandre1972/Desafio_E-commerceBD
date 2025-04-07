create database ecommercerefinado;
use ecommercerefinado;
show tables;

-- Tabela Cliente


CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    pNome VARCHAR(100),
    NomeInicial VARCHAR(10),
    Sobrenome VARCHAR(100),
    CPF CHAR(11),
    endereco VARCHAR(100),
    DataDeNascimento DATE,
    CONSTRAINT Identificacao_UNIQUE UNIQUE (CPF)
);

alter table Cliente auto_increment=1;


-- ClientePF
CREATE TABLE ClientePF (
    cpf VARCHAR(11) PRIMARY KEY,
    Cliente_idCliente INT UNIQUE,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

-- ClientePJ
CREATE TABLE ClientePJ (
    Cliente_idCliente INT PRIMARY KEY,
    RazaoSocial VARCHAR(45),
    NomeFantasia VARCHAR(45) UNIQUE,
    CNPJ VARCHAR(15) UNIQUE,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);


-- Entrega
CREATE TABLE Entrega (
    idEntrega INT PRIMARY KEY AUTO_INCREMENT,
    Status_da_Entrega ENUM('Em Processamento', 'Enviado', 'A Caminho', 'Entregue') default 'Em Processamento',
    Codigo_de_Rastreio VARCHAR(15)
);

alter table Entrega auto_increment=1;


-- Pedido
CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    Status_do_pedido ENUM('Pendente', 'Pago', 'Enviado', 'Cancelado'),
    descricao VARCHAR(45),
    VFrete FLOAT,
    Cliente_idCliente INT,
    Entrega_idEntrega INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (Entrega_idEntrega) REFERENCES Entrega(idEntrega)
);

alter table Pedido auto_increment=1;


-- Produto
CREATE TABLE Produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    Categoria ENUM('Brinquedos', 'Móveis', 'Vestuario', 'Eletrônicos', 'Alimentos') not null,
    Descricao VARCHAR(100),
    Tamanho VARCHAR(10),
    Valor VARCHAR(45)
);

alter table Produto auto_increment=1;

-- Produto_Pedido
CREATE TABLE Produto_pedido (
    Produto_idProduto INT,
    Pedido_idPedido INT,
    Quantidade VARCHAR(45),
    Pstatus ENUM('Disponível', 'Indisponível'),
    PRIMARY KEY (Produto_idProduto, Pedido_idPedido),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);

-- Pagamento
CREATE TABLE Pagamento (
    idPagamento INT PRIMARY KEY AUTO_INCREMENT,
    Tipo_de_Pagamento ENUM('Dinheiro', 'Cartão', 'PIX'),
    Valor FLOAT,
    Numero_do_Cartao VARCHAR(45),
    Bandeira_do_Cartao VARCHAR(45),
    Pedido_idPedido INT,
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);


alter table Pagamento auto_increment=1;


-- Estoque
CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY AUTO_INCREMENT,
    Local VARCHAR(45)
);

alter table Estoque auto_increment=1;

-- Produto_em_estoque
CREATE TABLE Produto_estoque (
    Estoque_idEstoque INT,
    Produto_idProduto INT,
    Quantidade INT,
    PRIMARY KEY (Estoque_idEstoque, Produto_idProduto),
    FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- Fornecedor

CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
    Razao_Social VARCHAR(45),
    CNPJ VARCHAR(45),
    Fornecedorcod VARCHAR(45)
);


alter table Fornecedor auto_increment=1;

-- Produto_fornecedor
CREATE TABLE Produto_fornecedor (
    Fornecedor_idFornecedor INT,
    Produto_idProduto INT,
    PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
    FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

-- Vendedor_terceiro
CREATE TABLE Vendedor_terceiro (
    idTerceiro_vendedor INT PRIMARY KEY AUTO_INCREMENT,
    Razao_Social VARCHAR(45),
    Nome_fantasia VARCHAR(45),
    Endereco VARCHAR(45),
    Localidade VARCHAR(45),
    CONSTRAINT Razao_Social_UNIQUE UNIQUE (Razao_Social)
);
 
select * from Vendedor_terceiro;
alter table Vendedor_terceiro auto_increment=1;


-- Prod_vendedor_terceiro
CREATE TABLE Produto_terceiro (
    Terceiro_vendedor_idTerceiro_vendedor INT,
    Produto_idProduto INT,
    Quantidade INT,
    PRIMARY KEY (Terceiro_vendedor_idTerceiro_vendedor, Produto_idProduto),
    FOREIGN KEY (Terceiro_vendedor_idTerceiro_vendedor) REFERENCES Vendedor_terceiro(idTerceiro_vendedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);