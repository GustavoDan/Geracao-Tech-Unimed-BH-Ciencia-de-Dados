USE ecommerce;

INSERT INTO Fornecedor VALUES (NULL, 'Fornecedor 1', 12345678912345),
							  (NULL, 'Fornecedor 2', 64512378978945),
							  (NULL, 'Fornecedor 3', 12365498712312);

INSERT INTO TerceiroVendedor VALUES (NULL, 'Vendedor 1', 'Bairro 1'),
									(NULL, 'Vendedor 2', 'Bairro 2'),
							  		(NULL, 'Vendedor 3', 'Bairro 3');

INSERT INTO Estoque VALUES (NULL, 'Bairro 1'),
						   (NULL, 'Bairro 2'),
						   (NULL, 'Bairro 3');

INSERT INTO Produto VALUES (NULL, 'Categoria 1', NULL, 15.99),
						   (NULL, 'Categoria 2', 'Descrição 1', 13.19),
						   (NULL, 'Categoria 3', NULL, 50.30);

INSERT INTO ForneceProduto VALUES (1, 1),
								  (2, 2),
							  	  (3, 3);

INSERT INTO VendedorProduto VALUES (1, 1, 20),
							  	   (2, 2, 30),
							  	   (3, 3, 5);

INSERT INTO EstoqueProduto VALUES (1, 3, 10),
							  	  (2, 1, 100),
							  	  (3, 2, 50);

INSERT INTO Entrega VALUES (NULL, 'Aguardando pagamento', NULL, 134.40),
						   (NULL, 'Em trânsito', 'ojn231ob3ln32n', 45.40),
						   (NULL, 'Entregue', 'hoo32n32on3non', 1.40);

INSERT INTO Cliente VALUES (NULL, 'Marcos', '12345678910', 'Estado 1, Cidade 1, Bairro 1, Rua 1'),
						   (NULL, 'Supermercado', '12345678910111', 'Estado 2, Cidade 20, Bairro 1, Rua 1'),
						   (NULL, 'Maria', '01987654321', 'Estado 1, Cidade 2, Bairro 1, Rua 1');

INSERT INTO Cartao VALUES (NULL, 'Marcos', '1234567891011121', '022025', 1),
						  (NULL, 'Maria', '1211101987654321', '052029', 3),
						  (NULL, 'João', '4563217890121235', '012023', 1);

INSERT INTO Pagamento VALUES (NULL, 'Dinheiro', 15, 'Pago', 'asdsa231dfas', NULL),
							 (NULL, 'Cartao', 0, 'Em processamento', NULL, 1),
							 (NULL, 'Cartao', 50, 'Recusado', NULL, 3);

INSERT INTO Pedido VALUES (NULL, 'Finalizado', NULL, 1, 2, 1),
						  (NULL, 'Aguardando pagamento', NULL, 1, 1, 3),
						  (NULL, 'Aguardando pagamento', NULL, 3, 3, 2);

INSERT INTO ProdutoPedido VALUES (1, 1, 10),
							  	 (2, 2, 15),
							  	 (3, 3, 5);

SELECT * FROM cartao;
SELECT * FROM cliente;
SELECT * FROM entrega;
SELECT * FROM estoque;
SELECT * FROM estoqueproduto;
SELECT * FROM fornecedor;
SELECT * FROM forneceproduto;
SELECT * FROM pagamento;
SELECT * FROM pedido;
SELECT * FROM produto;
SELECT * FROM produtopedido;
SELECT * FROM terceirovendedor;
SELECT * FROM vendedorproduto;

SELECT * FROM cliente c, pedido p WHERE c.id = p.idCliente;
SELECT nome, identificacao, endereco, status, descricao FROM cliente c, pedido p WHERE c.id = p.idCliente ORDER BY endereco DESC;

SELECT 
    c.id AS Cliente_id,
    c.nome AS Cliente_nome,
    COUNT(p.id) AS Numero_de_pedidos
FROM
    cliente c
        LEFT OUTER JOIN
    pedido p ON c.id = p.idCliente
GROUP BY c.id;