SHOW DATABASES ;
# create database for exercise
CREATE DATABASE sql_excecise;

SHOW DATABASES ;

USE sql_excecise;
/*
    Problema
    Gerenciar matriculas de alunos da Sofblue
    tabela1: informaçao sobre curso softblue
    curso (nome, tipo, preço, dado do instrutor)
    tabela2: Informações sobre os instrutor
    [nome telefone]
    tabela 3: informaçoes do aluno
    nome,endereço, email, curso_matricula,
    tabela4: compra PEDIDO
    curso, data, hora
 */
CREATE TABLE tipo
(
    id tinyint unsigned not null auto_increment,
    tipo varchar(50) not null,
    PRIMARY KEY (id)
);

CREATE TABLE  instrutor
(
    id tinyint unsigned not null auto_increment,
    nomeinstrutor varchar(40) not null,
    telefone char(9) not null,
    PRIMARY KEY (id)
);

CREATE TABLE cursos
(
    idcursos tinyint unsigned not null auto_increment,
    curso varchar(50) not null,
    tipocurso tinyint unsigned not null,
    instrutorcurso tinyint unsigned not null ,
    preco float unsigned not null,
    PRIMARY KEY (idcursos),
    CONSTRAINT fk_tipo_curso FOREIGN KEY (tipocurso) REFERENCES  tipo(id),
    CONSTRAINT fk_instrutor_curso FOREIGN KEY (instrutorcurso) REFERENCES instrutor(id)
);

CREATE TABLE aluno
(
  id_pedido tinyint unsigned not null auto_increment,
  nome_aluno varchar(15) not null,
  endereco varchar(40) not null,
  email varchar(50) not null,
  PRIMARY KEY (id_pedido)
);

CREATE TABLE pedido
(
    id_pedido tinyint unsigned not null auto_increment,
    aluno tinyint unsigned not null,
    datapedido date   not null,
    horapedito time not null,
    PRIMARY KEY (id_pedido)
);

CREATE TABLE  pedido_detalhe
(
  pedido_det  tinyint unsigned not null,
  curso_pedido tinyint unsigned not null,
  valor_pedido float unsigned not null,

  CONSTRAINT fk_pedido_det FOREIGN KEY (pedido_det) REFERENCES  pedido(id_pedido),
  CONSTRAINT fk_curso_pedido FOREIGN KEY (curso_pedido) REFERENCES cursos(idcursos)
  #CONSTRAINT fk_valor_pedido FOREIGN KEY (valor_pedido) REFERENCES cursos(preco) pensar como utilizar o preco
);

DROP TABLE pedido_detalhe;