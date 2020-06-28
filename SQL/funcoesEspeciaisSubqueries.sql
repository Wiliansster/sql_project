USE  curso_sql;
SELECT * FROM funcionarios;

SELECT  COUNT(*) FROM funcionarios;
SELECT COUNT(*) FROM funcionarios WHERE salario > 1600;

# Quantas pessoas ganham mais de 1600 e trabalha no setro jurídico

SELECT COUNT(*) FROM funcionarios WHERE salario >1600 AND departamento = 'Jurídico';
SELECT * FROM  funcionarios WHERE salario > 1600 AND departamento = 'Jurídico';

SELECT SUM(salario) FROM funcionarios;
# salarios só dos programadores TI
SELECT SUM(salario) FROM funcionarios WHERE departamento = 'TI';
SELECT AVG(salario) FROM funcionarios;

SELECT AVG(salario) FROM funcionarios WHERE departamento = 'TI';
SELECT MAX(salario) FROM funcionarios;
SELECT MAX(salario) FROM funcionarios WHERE departamento = 'TI';
SELECT MIN(salario) FROM funcionarios WHERE departamento = 'TI';

# Listar todos os departamentos 
SELECT departamento FROM funcionarios; # o problema é que aparece campos reptidos
SELECT DISTINCT(departamento) FROM funcionarios;

# Ordenar
SELECT * FROM funcionarios;
SELECT * FROM funcionarios ORDER BY nome;
# Ordenar ordem decrescente
SELECT * FROM funcionarios ORDER BY nome DESC;

SELECT * FROM funcionarios ORDER BY salario;
SELECT * FROM funcionarios ORDER BY departamento;

# ordenar por departento e para o setor Jurídico por orden salarial
SELECT * FROM funcionarios ORDER BY departamento, salario;
SELECT * FROM funcionarios ORDER BY departamento, salario DESC;
SELECT * FROM funcionarios ORDER BY departamento DESC, salario DESC;

# PAGINAÇÃO
SELECT * FROM funcionarios;
# Mostrar apenas 2 registro
SELECT * FROM funcionarios LIMIT 2;
# Mostrar apenas 2 registro e o pular o primeiro
SELECT * FROM funcionarios LIMIT 2  OFFSET 1;
SELECT * FROM funcionarios LIMIT 1,2;

# Função agrupamento
SELECT  AVG(salario) FROM funcionarios; # media de todos os departamentos
SELECT AVG(salario) FROM funcionarios WHERE departamento = 'TI';
SELECT AVG(salario) FROM funcionarios WHERE departamento = 	'Jurídico';
# fazer o que foi feito acima, de uma única vez
SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento;
# contar os funcionario por departamento
SELECT departamento, COUNT(*) FROM funcionarios GROUP BY departamento;

# se quiser que apareça somente quem tem salario médio acima de 2000
SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000;


# subqueries
# Mostrar os nomes dos funcionarios dos departamento que tem média salaria acima de 2000
SELECT departamento, AVG (salario) FROM funcionarios GROUP BY departamento;
SELECT nome FROM funcionarios WHERE departamento = 'Jurídico';

SELECT nome FROM funcionarios WHERE departamento IN ( SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1600);

# Atenção problema com a funçao agrupamento
SELECT nome FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000; 
/*
	Funçoes de agrupamento, faz os calculo mas só lista o primeiro elemento, Geralmente, se manda listar o CAMPO em que se está agrupar
*/
SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000; 

# Para aparece o nome tem que ser feito uma subquareies
SELECT nome FROM funcionarios
WHERE departamento IN 
(
	SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000
);


