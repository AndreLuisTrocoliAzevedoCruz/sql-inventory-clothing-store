-- Categorias
INSERT INTO Categoria (nome) VALUES ('Camisetas'), ('Calças'), ('Roupas íntimas'), ('Acessórios');

-- Produtos
INSERT INTO Produto (nome, id_categoria, tamanho, cor, preco) VALUES
('Camiseta Polo', 1, 'M', 'Azul', 79.90),
('Calça Jeans', 2, '42', 'Preto', 120.00),
('Cueca Box', 3, 'G', 'Branca', 25.00),
('Boné Aba Reta', 4, NULL, 'Vermelho', 60.00);

-- Lojas
INSERT INTO Loja (nome, endereco) VALUES
('Loja Centro', 'Av. Principal, 123'),
('Loja Shopping', 'Rua das Flores, 45');

-- Usuários
INSERT INTO Usuario (nome, role) VALUES
('Carlos Silva', 'admin'),
('Maria Souza', 'gerente'),
('João Pereira', 'vendedor');

-- Estoques iniciais
INSERT INTO Estoque (id_produto, id_loja, quantidade) VALUES
(1, 1, 20),
(2, 1, 15),
(3, 1, 50),
(4, 2, 30);

-- Movimentações iniciais
INSERT INTO Movimentacao (id_produto, id_loja, tipo, quantidade) VALUES
(1, 1, 'entrada', 20),
(2, 1, 'entrada', 15),
(3, 1, 'entrada', 50),
(4, 2, 'entrada', 30);
