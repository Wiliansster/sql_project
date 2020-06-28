USE curso_sql;

INSERT INTO funcionarios (id, nome,  departamento) VALUE(1,'Fernado',  'TI');

SELECT * FROM funcionarios;

# atualizar
UPDATE funcionarios SET salario =  1500 WHERE id = 1;

INSERT INTO funcionarios ( nome, salario, departamento) VALUE('Guilherme', 2500,'Jurídico');

SELECT * FROM funcionarios;

INSERT INTO funcionarios (nome, salario, departamento) VALUE ('Fábio', 1700, 'TI');

SELECT * FROM funcionarios;

INSERT INTO funcionarios (nome, salario, departamento) VALUE ('José', 1700, 'Market');
INSERT INTO funcionarios (nome, salario, departamento) VALUE ('Izabela', 2200, 'Jurídico');

SELECT nome, salario, FROM funcionarios f WHERE f.salario > 2000;

SELECT * FROM funcionarios;

# excluir uma informaçao repetida

DELETE funcionarios FROM funcionarios WHERE id = 4;
SELECT * FROM funcionarios;
SELECT * FROM funcionarios WHERE salario > 2000;
SELECT * FROM funcionarios WHERE nome = 'José';
SELECT * FROM funcionarios WHERE id = 3;

# atualizar o salario


UPDATE funcionarios SET salario = salario * 1.1;
# não funciona no Mysql workbech

UPDATE funcionarios SET salario = salario * 1.1 WHERE  id = 1;

# soluçaõ para o Mysql workbench

SET SQL_SAFE_UPDATES = 0;
UPDATE funcionarios SET salario = salario * 1.1;
SELECT * FROM   funcionarios;

SET SQL_SAFE_UPDATES = 1; # Abilita o proteção

# formatar os dados para duas casas decimais

UPDATE funcionarios SET salario = ROUND(salario * 1.1,2);
SELECT * FROM funcionarios;

# EXLUIR  LINHA

DELETE FROM funcionarios WHERE id = 5;
SELECT * FROM funcionarios;

# Tabela veiculos

INSERT INTO veiculo (funcionario_id, veiculo, placa) VALUE (1, 'Carro', 'SB-0001');
SELECT * FROM veiculo;
INSERT INTO veiculo (funcionario_id, veiculo, placa) VALUE (1, 'Carro', 'SB-0002');
SELECT * FROM veiculo;

UPDATE veiculo SET funcionario_id = 6 WHERE id = 2;
SELECT * FROM veiculo;

# TABELA SALARIO

SHOW TABLES;

INSERT INTO salarios (faixa, inicio,fim) VALUE ('Analista Jr',1000,2000);
INSERT INTO salarios (faixa, inicio,fim) VALUE ('Analista Pleno',2000,4000);
SELECT * FROM salarios;

SELECT nome, salario  FROM funcionarios f WHERE f.salario > 2000;

# apelido para campo

SELECT nome AS 'Funcionario' , salario FROM funcionarios f WHERE f.salario > 2000; 
SELECT nome AS 'Funcionário' , salario AS 'Ordenado' FROM funcionarios f WHERE f.salario > 2000; 

# Union table
SELECT * FROM funcionarios WHERE nome = 'Guilherme';
SELECT * FROM funcionarios WHERE id = 6;


SELECT * FROM funcionarios WHERE nome = 'Guilherme' 
UNION
SELECT * FROM funcionarios WHERE id = 6;

# UNION ALL
SELECT * FROM funcionarios WHERE nome = 'Guilherme' 
UNION  
SELECT * FROM funcionarios WHERE nome = 'Guilherme';

SELECT * FROM funcionarios WHERE nome = 'Guilherme' 
UNION  ALL
SELECT * FROM funcionarios WHERE nome = 'Guilherme';


SELECT * 
FROM funcionarios
ORDER BY nome DESC
LIMIT 3;

SELECT * 
FROM funcionarios
ORDER BY nome, salario DESC ; 

SELECT * 
FROM funcionarios
WHERE nome = 'Izabela'
ORDER BY salario ASC ; 

SELECT  
id,
nome,
salario,
departamento,
ROUND(sqrt(salario) + salario/4 ,2) AS salario_square 
FROM funcionarios;


