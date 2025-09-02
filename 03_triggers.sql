-- Atualiza estoque automaticamente ao inserir item em venda
CREATE OR REPLACE FUNCTION atualizar_estoque_venda()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Estoque
    SET quantidade = quantidade - NEW.quantidade
    WHERE id_produto = NEW.id_produto
      AND id_loja = (SELECT id_loja FROM Venda WHERE id = NEW.id_venda);

    INSERT INTO Movimentacao (id_produto, id_loja, tipo, quantidade)
    VALUES (NEW.id_produto, (SELECT id_loja FROM Venda WHERE id = NEW.id_venda), 'saida', NEW.quantidade);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tg_atualizar_estoque_venda
AFTER INSERT ON ItemVenda
FOR EACH ROW
EXECUTE FUNCTION atualizar_estoque_venda();
