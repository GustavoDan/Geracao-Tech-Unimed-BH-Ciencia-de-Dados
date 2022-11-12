CREATE DATABASE Oficina;
USE Oficina;

CREATE TABLE Endereco (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cep CHAR(8) NOT NULL,
  estado VARCHAR(45) NOT NULL,
  cidade VARCHAR(45) NOT NULL,
  bairro VARCHAR(45) NOT NULL,
  rua VARCHAR(45) NOT NULL,
  numero VARCHAR(45) NOT NULL,
  complemento VARCHAR(45)
);

CREATE TABLE Cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cpf CHAR(11) NOT NULL,
    nome VARCHAR(45) NOT NULL,
    telefone CHAR(11),
    Endereco_id INT NOT NULL,
    UNIQUE (cpf),
    FOREIGN KEY (Endereco_id)
        REFERENCES Endereco (id)
);

CREATE TABLE Veiculo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    chassi CHAR(17) NOT NULL,
    modelo VARCHAR(45) NOT NULL,
    fabricante VARCHAR(45) NOT NULL,
    anoFabricacao CHAR(4) NOT NULL,
    Cliente_id INT NOT NULL,
    UNIQUE (chassi),
    FOREIGN KEY (Cliente_id)
        REFERENCES Cliente (id)
);

CREATE TABLE Status (
    id INT PRIMARY KEY AUTO_INCREMENT,
    status VARCHAR(45) NOT NULL,
    UNIQUE (status)
);

CREATE TABLE OrdemDeServico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    dataEmissao DATE NOT NULL,
    dataConclusao DATE,
    valor DECIMAL(11 , 2),
    Veiculo_id INT NOT NULL,
    Status_id INT NOT NULL,
    FOREIGN KEY (Veiculo_id)
        REFERENCES Veiculo (id),
    FOREIGN KEY (Status_id)
        REFERENCES Status (id)
);

CREATE TABLE Peca (
    id INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(45) NOT NULL,
    fabricante VARCHAR(45) NOT NULL,
    descricao VARCHAR(45) NOT NULL,
    valor DECIMAL(11 , 2) NOT NULL
);

CREATE TABLE Servico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descricao TEXT NOT NULL,
    valor DECIMAL(11 , 2) NOT NULL
);

CREATE TABLE Especialidade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    especialidade VARCHAR(45) NOT NULL,
    UNIQUE (especialidade)
);

CREATE TABLE Mecanico (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    Endereco_id INT NOT NULL,
    Especialidade_id INT NOT NULL,
    FOREIGN KEY (Endereco_id)
        REFERENCES Endereco (id),
    FOREIGN KEY (Especialidade_id)
        REFERENCES Especialidade (id)
);

CREATE TABLE ODSServicos (
    OrdemDeServico_id INT NOT NULL,
    Servico_id INT NOT NULL,
    clienteAutorizou TINYINT,
    descricaoEspecifica TEXT,
    PRIMARY KEY (OrdemDeServico_id , Servico_id),
    FOREIGN KEY (OrdemDeServico_id)
        REFERENCES OrdemDeServico (id),
    FOREIGN KEY (Servico_id)
        REFERENCES Servico (id)
);

CREATE TABLE ODSPecas (
    OrdemDeServico_id INT NOT NULL,
    Peca_id INT NOT NULL,
    PRIMARY KEY (OrdemDeServico_id , Peca_id),
    FOREIGN KEY (OrdemDeServico_id)
        REFERENCES OrdemDeServico (id),
    FOREIGN KEY (Peca_id)
        REFERENCES Peca (id)
);

CREATE TABLE EquipeDeMecanicos (
    OrdemDeServico_id INT NOT NULL,
    Mecanico_codigo INT NOT NULL,
    PRIMARY KEY (OrdemDeServico_id , Mecanico_codigo),
    FOREIGN KEY (OrdemDeServico_id)
        REFERENCES OrdemDeServico (id),
    FOREIGN KEY (Mecanico_codigo)
        REFERENCES Mecanico (codigo)
);