CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE Fornecedor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(45) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    UNIQUE (cnpj)
);

CREATE TABLE TerceiroVendedor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    razaoSocial VARCHAR(45) NOT NULL,
    localVendedor VARCHAR(45) NOT NULL,
    unique (razaoSocial)
);

CREATE TABLE Estoque (
    id INT PRIMARY KEY AUTO_INCREMENT,
    localEstoque VARCHAR(45) NOT NULL
);

CREATE TABLE Produto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(45) NOT NULL,
    descricao TEXT,
    valor DECIMAL(11 , 2) NOT NULL
);

CREATE TABLE ForneceProduto (
    idFornecedor INT,
    idProduto INT,
    PRIMARY KEY (idFornecedor, idProduto),
    FOREIGN KEY (idFornecedor)
        REFERENCES Fornecedor (id),
    FOREIGN KEY (idProduto)
        REFERENCES Produto (id)
);

CREATE TABLE VendedorProduto (
    idVendedor INT,
    idProduto INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (idVendedor , idProduto),
    FOREIGN KEY (idVendedor)
        REFERENCES TerceiroVendedor (id),
    FOREIGN KEY (idProduto)
        REFERENCES Produto (id)
);

CREATE TABLE EstoqueProduto (
    idEstoque INT,
    idProduto INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (idEstoque , idProduto),
    FOREIGN KEY (idEstoque)
        REFERENCES Estoque (id),
    FOREIGN KEY (idProduto)
        REFERENCES Produto (id)
);

CREATE TABLE Entrega (
    id INT PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(45) NOT NULL,
    codRastreio VARCHAR(45),
    valorFrete DECIMAL(11 , 2)
);

CREATE TABLE Cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    identificacao VARCHAR(14) NOT NULL,
    endereco VARCHAR(45) NOT NULL,
    UNIQUE (identificacao)
);

CREATE TABLE Cartao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nomeProprietarioCartao VARCHAR(45) NOT NULL,
    numeroCartao CHAR(16) NOT NULL,
    validadeCartao CHAR(6) NOT NULL,
    idCliente INT NOT NULL,
    FOREIGN KEY (idCliente)
        REFERENCES Cliente (id)
);

CREATE TABLE Pagamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    forma VARCHAR(45) NOT NULL,
    porcentagemDesconto INT,
    status VARCHAR(45) NOT NULL,
    recibo VARCHAR(45),
    idCartao INT,
    FOREIGN KEY (idCartao)
        REFERENCES Cartao (id)
);

CREATE TABLE Pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(45) NOT NULL,
    descricao TEXT,
    idCliente INT NOT NULL,
    idEntrega INT,
    idPagamento INT,
    FOREIGN KEY (idCliente)
        REFERENCES Cliente (id),
    FOREIGN KEY (idEntrega)
        REFERENCES Entrega (id),
    FOREIGN KEY (idPagamento)
        REFERENCES Pagamento (id)
);

CREATE TABLE ProdutoPedido (
    idPedido INT,
    idProduto INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (idPedido , idProduto),
    FOREIGN KEY (idPedido)
        REFERENCES Pedido (id),
    FOREIGN KEY (idProduto)
        REFERENCES Produto (id)
);