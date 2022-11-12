USE Oficina;

INSERT INTO Endereco VALUES (NULL, '12345678', 'SP', 'Cidade 1', 'Bairro 1', 'Rua 1', '123', NULL),
							(NULL, '87654321', 'RJ', 'Cidade 2', 'Bairro 2', 'Rua 2', '456', 'Bloco B APT 120');

INSERT INTO Cliente VALUES (NULL, '12345678910', 'Janio', NULL, 1),
						   (NULL, '01987654321', 'Juscelino', '12345678910', 2);

INSERT INTO Veiculo VALUES (NULL, '12345678910111213', 'Model 1', 'Fabricante 1', 2020, 1),
						   (NULL, '31211101987654321', 'Model 2', 'Fabricante 2', 2018, 2);

INSERT INTO Status VALUES (NULL, 'Em análise'),
						  (NULL, 'Completa');

INSERT INTO OrdemDeServico VALUES (NULL, '2022-11-11', NULL, 123456.10, 1, 1),
								  (NULL, '2022-10-30', '2022-11-11', 452.54, 2, 2);

INSERT INTO Peca VALUES (NULL, 'Peca 1', 'Fabricante 3', 'Motor Model 1', 100000.0),
						(NULL, 'Peca 2', 'Fabricante 4', 'Pneu', 350.30);

INSERT INTO Servico VALUES (NULL, 'Troca de motor', 23456.10),
						   (NULL, 'Troca de pneu', 102.24);

INSERT INTO Especialidade VALUES (NULL, 'Especialidade 1'),
						   		 (NULL, 'Especialidade 2');

INSERT INTO Mecanico VALUES (NULL, 'Floriano', 1, 1),
						    (NULL, 'Deodoro', 2, 2);

INSERT INTO ODSServicos VALUES (1, 1, True, 'Trocar motor fundido.'),
						  	   (2, 2, NULL, NULL);

INSERT INTO ODSPecas VALUES (1, 1),
							(2, 2);

INSERT INTO EquipeDeMecanicos VALUES (1, 1),
									 (2, 2);

SELECT * FROM Endereco;
SELECT * FROM Cliente;
SELECT * FROM Veiculo;
SELECT * FROM Status;
SELECT * FROM OrdemDeServico;
SELECT * FROM Peca;
SELECT * FROM Servico;
SELECT * FROM Especialidade;
SELECT * FROM Mecanico;
SELECT * FROM ODSServicos;
SELECT * FROM ODSPecas;
SELECT * FROM EquipeDeMecanicos;

SELECT * FROM Cliente c, Veiculo v WHERE c.id = v.Cliente_id;
SELECT nome, chassi, modelo, fabricante, anoFabricacao FROM Cliente c, Veiculo v WHERE c.id = v.Cliente_id ORDER BY anoFabricacao ASC;

SELECT * FROM Cliente c, Veiculo v, OrdemDeServico o WHERE c.id = v.Cliente_id = o.Veiculo_id;

SELECT 
    c.nome AS Cliente_nome, SUM(o.valor) AS Total_gasto
FROM
    Cliente c
        INNER JOIN
    Veiculo v ON c.id = v.Cliente_id
        INNER JOIN
    OrdemDeServico o ON v.id = o.Veiculo_id
GROUP BY c.id;

INSERT INTO OrdemDeServico VALUES (NULL, '2022-11-11', NULL, 500.0, 2, 2);

SELECT 
    c.nome AS Cliente_nome, SUM(o.valor) AS Total_gasto
FROM
    Cliente c
        INNER JOIN
    Veiculo v ON c.id = v.Cliente_id
        INNER JOIN
    OrdemDeServico o ON v.id = o.Veiculo_id
GROUP BY c.id;