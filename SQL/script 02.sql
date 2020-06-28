# criar banco de dados
CREATE DATABASE curso_sql;

# Deve fazer antes de usar  o banco
USE curso_sql; 

# dentro dos parenteses definimos os campos
# criar a chave primária 

CREATE TABLE funcionarios
(
	id int unsigned not null auto_increment,
    nome varchar(45)  not null,
    salario double not null default '0' , # se não for informado o salario o mysql incluir '0'
    departamento varchar(45) not null,
	PRIMARY KEY (id)
);


CREATE TABLE salarios 
(
	faixa varchar(45),
    inicio double not null,
    fim double not null,
    PRIMARY KEY (faixa)
);



CREATE TABLE veiculo 
(
	id int unsigned not null auto_increment,
    funcionario_id  int unsigned default null, # este campo tem que TIPO E PROPRIEDADE iguais ao id da tabela funcinario
    veiculo  varchar(10) not null default ' ', 
    placa varchar(10) not null default '', # default ' ' significa sem placa
	PRIMARY KEY (id),
    CONSTRAINT fk_veiculo_funcionarios FOREIGN KEY (funcionario_id ) REFERENCES funcionarios (id)
    # apelido após o comando CONSTRAINT
);

# comando ALTER TABALE
/*
	Ateraçaõ na tabela funcionarios
		campo 'nome' para nome_func
        varchar(45) para varchar(50)
*/

ALTER TABLE funcionarios CHANGE COLUMN nome nome_func varchar(50) not null;
# desfazer as alterações
ALTER TABLE funcionarios CHANGE COLUMN nome_func nome varchar(45) not null;

# comando DROP 

DROP TABLE  salarios;

# criar INDICES

CREATE INDEX departamento ON funcionarios (departamento);
CREATE INDEX nomes ON funcionarios (nome(6)); # escolho a quantidade de caracteres 
