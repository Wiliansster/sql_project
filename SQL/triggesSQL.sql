USE curso_sql;

#strored procedures
CREATE TABLE pedidos
(
	id int unsigned not null auto_increment,
    descricao varchar(100) not null,
	valor double not null default '0',
    pago varchar(3) not null default 'Não',
    PRIMARY KEY (id)
);

INSERT INTO pedidos (descricao, valor) VALUES ('TV', 3000);
INSERT INTO pedidos (descricao, valor) VALUES ('Geladeira', 1400);
INSERT INTO pedidos (descricao, valor) VALUES ('DVD player', 300 );

SELECT * FROM pedidos;

/*
	Criar um strored procedures para limpar a tabela pedido com os valores que não foram pagos
*/

/*após o stored procedures posso chamar a tabela pedidos que ela ainda está lá,
para utilizar o stored procedure, basta chamar a função CALL
*/
SELECT * FROM pedidos;
CALL limpa_pedidos(); # è necessario utilizar a safe update porque está atualizar toda a tabela
SELECT * FROM pedidos;

# Quero que todos os dias ao meia noite se utilize a limpa_pedidos

# Trigges
CREATE TABLE estoque
(
	id int unsigned not null auto_increment,
    descricao varchar(50) not null,
    quantidade int not null,
    PRIMARY KEY(id)
);

CREATE TRIGGER gatilho_limpa_pedidos
BEFORE INSERT 
ON  estoque
FOR EACH ROW
CALL limpa_pedidos();

SELECT * FROM pedidos;

INSERT INTO pedidos (descricao, valor) VALUES ('TV', 3000);
INSERT INTO pedidos (descricao, valor) VALUES ('Geladeira', 1400);
INSERT INTO pedidos (descricao, valor) VALUES ('DVD player', 300 );
SELECT * FROM pedidos;

INSERT INTO estoque (descricao, quantidade) VALUE ('Fogão',5);
# fazer um select na tabela pedidos ( não tem nada)
SELECT * FROM pedidos;

SELECT * FROM estoque;

# inserir novamente e fazer uma atualizaçaõ de pagamento para geladeira
INSERT INTO pedidos (descricao, valor) VALUES ('TV', 3000);
INSERT INTO pedidos (descricao, valor) VALUES ('Geladeira', 1400);
INSERT INTO pedidos (descricao, valor) VALUES ('DVD player', 300 );

UPDATE pedidos SET pago = 'Sim' WHERE id = 8;

# inserir outro produto
INSERT INTO estoque (descricao, quantidade) VALUE ('Forno',3);

SELECT * FROM pedidos;

SELECT * FROM estoque;