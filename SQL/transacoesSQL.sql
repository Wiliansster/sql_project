USE  curso_sql;

# mecanismo de armazenamto
SHOW ENGINES;
# O formato InnoDB é o único no MySQL que se pode fazer transações

CREATE TABLE contas_bancarias
(
	id int unsigned not null auto_increment,
    titular varchar(45) not null,
    saldo double not null,
    PRIMARY KEY(id)    
) engine = InnoDB;

INSERT INTO contas_bancarias (titular, saldo) VALUES ('André',1000);
INSERT INTO contas_bancarias (titular, saldo) VALUES ('Carlos',2000);

SELECT * FROM contas_bancarias;

# transferir 100 da conta do Andre para a conta do Carlos
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
# o problema de fazer de forma é que se por algum motivo a transação no for realizada se perde  100
start transaction;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
rollback; # este comando cancela a transaçaõ
SELECT * FROM contas_bancarias;

start transaction;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
commit; # este comando confirma a transaçaõ
SELECT * FROM contas_bancarias;




