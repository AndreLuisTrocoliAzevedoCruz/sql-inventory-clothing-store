-- Produtos com seus estoques
CREATE OR REPLACE VIEW view_produtos_estoque AS
SELECT p.nome AS produto, l.nome AS loja, e.quantidade
FROM Estoque e
JOIN Produto p ON e.id_produto = p.id
JOIN Loja l ON e.id_loja = l.id;

-- Top produtos vendidos
CREATE OR REPLACE VIEW view_top_vendas AS
SELECT p.nome, SUM(iv.quantidade) AS total_vendido
FROM ItemVenda iv
JOIN Produto p ON iv.id_produto = p.id
GROUP BY p.nome
ORDER BY total_vendido DESC;
