USE curso_sql;


SELECT * FROM funcionarios;
SELECT  * FROM veiculo;

SELECT * FROM funcionarios INNER JOIN veiculo ON  funcionario_id = id; # erro pq nas duas tabelas tem o campo id
SELECT * FROM funcionarios INNER JOIN veiculo ON  funcionario_id = funcionarios.id;
# criando apelidos

SELECT * FROM funcionarios f INNER JOIN veiculo  v ON  v.funcionario_id = f .id;

SELECT * FROM funcionarios f LEFT JOIN veiculo v ON  v.funcionario_id = f .id;

SELECT * FROM funcionarios f RIGHT JOIN veiculo v ON  v.funcionario_id = f .id;

INSERT INTO veiculo (funcionario_id, veiculo, placa) VALUE (null, "Moto", "SB-0003");
SELECT * FROM veiculo;

# excluir um valor repetido
DELETE FROM veiculo WHERE id = 4;

# full join - sem duplicar os registros
SELECT * FROM funcionarios f LEFT JOIN veiculo v ON  v.funcionario_id = f .id
UNION
SELECT * FROM funcionarios f RIGHT JOIN veiculo v ON  v.funcionario_id = f .id;

# full all tras os registro duplicados
SELECT * FROM funcionarios f LEFT JOIN veiculo v ON  v.funcionario_id = f .id
UNION ALL
SELECT * FROM funcionarios f RIGHT JOIN veiculo v ON  v.funcionario_id = f .id;

# eque join
DROP TABLE cpfs;

CREATE TABLE cpfs
(
	id int unsigned not null,
    cpf varchar(14) not null,
    PRIMARY KEY (id),
    CONSTRAINT fk_cpf FOREIGN KEY (id)  REFERENCES funcionarios(id)
 );
 
 INSERT INTO cpfs (id, cpf) VALUES ( 1, '111.111.111-1');
 INSERT INTO cpfs (id, cpf) VALUES (2 , '222.222.222-2 ');
 INSERT INTO cpfs (id, cpf) VALUES (3, '333.333.333-3 ');
 INSERT INTO cpfs (id, cpf) VALUES (6, '666.666.666-6 ');
 
 SELECT * FROM  cpfs;
 
 SELECT * FROM funcionarios INNER JOIN cpfs ON funcionarios.id = cpfs.id;
 SELECT * FROM funcionarios INNER JOIN cpfs USING(id); # equal join
 
 # self join - relaciomente com ela mesma
 
 CREATE TABLE clientes
 (
	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    quem_indicou int unsigned,
    PRIMARY KEY (id),
    CONSTRAINT fk_quem_indicou FOREIGN KEY (quem_indicou) REFERENCES clientes (id)
 );
 
INSERT INTO clientes (id, nome, quem_indicou) VALUE(1, 'André ',NULL );
INSERT INTO clientes (id, nome, quem_indicou) VALUE(2, 'Samuel ',1 );
INSERT INTO clientes (id, nome, quem_indicou) VALUE(3, 'Carlos ',2 );
INSERT INTO clientes (id, nome, quem_indicou) VALUE(4, 'Rafael ', 1);

SELECT * FROM clientes;

# criar um relacionamento da tabela com ela mesma para INDICAR O NOME DE QUEM INDICOU SEM TER QUE DUPLICAR OS ID
SELECT a.nome,b.nome FROM clientes a  JOIN clientes b ON a.quem_indicou = b.id;
# apelido no campo
SELECT a.nome AS CLIENTE ,b.nome AS 'QUEM INDICOU' FROM clientes a  JOIN clientes b ON a.quem_indicou = b.id;

SELECT a.quem_indicou, a.nome AS CLIENTE ,b.nome AS 'QUEM INDICOU' FROM clientes a  JOIN clientes b ON a.quem_indicou = b.id;

# relacionamento triplo

SELECT * FROM funcionarios  
INNER JOIN veiculo  ON   funcionario_id = funcionarios.id 
INNER JOIN cpfs ON cpfs.id =  funcionarios.id  ;

SELECT * FROM funcionarios f INNER JOIN veiculo v ON  v.funcionario_id = f.id INNER JOIN cpfs ON cpfs.id =  f.id  ;

# visões - VIEW

CREATE VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 1700;
# invocar um view
SELECT * FROM  funcionarios_a;
UPDATE funcionarios SET salario = 1500 WHERE id = 3;
# atualizo a view - fabio não aparece
SELECT * FROM  funcionarios_a;

# excluir view
DROP VIEW funcionarios_a;
 
CREATE VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 3000;
SELECT * FROM funcionarios_a;

 