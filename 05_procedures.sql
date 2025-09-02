-- Procedure para registrar venda completa
CREATE OR REPLACE FUNCTION registrar_venda(p_id_loja INT, p_id_usuario INT, p_itens JSON)
RETURNS VOID AS $$
DECLARE
    v_venda_id INT;
    v_item JSON;
BEGIN
    INSERT INTO Venda (id_loja, id_usuario) VALUES (p_id_loja, p_id_usuario) RETURNING id INTO v_venda_id;

    FOR v_item IN SELECT * FROM json_array_elements(p_itens)
    LOOP
        INSERT INTO ItemVenda (id_venda, id_produto, quantidade, preco_unitario)
        VALUES (
            v_venda_id,
            (v_item->>'id_produto')::INT,
            (v_item->>'quantidade')::INT,
            (v_item->>'preco_unitario')::DECIMAL
        );
    END LOOP;
END;
$$ LANGUAGE plpgsql;
