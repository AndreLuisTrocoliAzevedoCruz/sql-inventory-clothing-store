-- Tabelas principais
CREATE TABLE Categoria (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Produto (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_categoria INT REFERENCES Categoria(id),
    tamanho VARCHAR(10),
    cor VARCHAR(30),
    preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE Loja (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200)
);

CREATE TABLE Estoque (
    id SERIAL PRIMARY KEY,
    id_produto INT REFERENCES Produto(id),
    id_loja INT REFERENCES Loja(id),
    quantidade INT NOT NULL DEFAULT 0
);

CREATE TABLE Usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    role VARCHAR(20) CHECK (role IN ('admin','gerente','vendedor'))
);

CREATE TABLE Venda (
    id SERIAL PRIMARY KEY,
    id_loja INT REFERENCES Loja(id),
    id_usuario INT REFERENCES Usuario(id),
    data TIMESTAMP DEFAULT NOW(),
    total DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE ItemVenda (
    id SERIAL PRIMARY KEY,
    id_venda INT REFERENCES Venda(id),
    id_produto INT REFERENCES Produto(id),
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL
);

CREATE TABLE Movimentacao (
    id SERIAL PRIMARY KEY,
    id_produto INT REFERENCES Produto(id),
    id_loja INT REFERENCES Loja(id),
    tipo VARCHAR(20) CHECK (tipo IN ('entrada','saida','transferencia')),
    quantidade INT NOT NULL,
    data TIMESTAMP DEFAULT NOW()
);
