SELECT * from produtos WHERE id in (SELECT id_produto FROM compras WHERE id_cliente = 2);