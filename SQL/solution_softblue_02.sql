CREATE DATABASE sol_sql_softblue;

USE sol_sql_softblue;

# This table belongs tipe of course offer by Softblue
CREATE TABLE tipo (
    codigo INT UNSIGNED NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    PRIMARY KEY (codigo)
);

# This table has information about teacher
CREATE TABLE instrutor (
    codigo_instrutor INT UNSIGNED NOT NULL AUTO_INCREMENT,
    instrutor VARCHAR(50) NOT NULL,
    telefone CHAR(9) NOT NULL,
    PRIMARY KEY (codigo_instrutor)
);

# That table belongs information about course
CREATE TABLE curso(
    codigo_curso INT UNSIGNED NOT NULL AUTO_INCREMENT,
    curso VARCHAR(50) NOT NULL,
    tipo_curso INT UNSIGNED NOT NULL,
    instrutor_curso INT UNSIGNED NOT NULL,
    valor DOUBLE NOT NULL,
    PRIMARY KEY (codigo_curso),
    CONSTRAINT fk_tipo_curso FOREIGN KEY (tipo_curso) REFERENCES tipo (codigo),
    CONSTRAINT fk_instrutor_curso FOREIGN KEY (instrutor_curso) REFERENCES instrutor (codigo_instrutor)
);

CREATE TABLE aluno (
  codigo_aluno  INT UNSIGNED NOT NULL AUTO_INCREMENT,
  aluno_name VARCHAR(30) NOT NULL,
  endereco VARCHAR(40) NOT NULL,
  email_aluno VARCHAR(15)  NOT NULL,
  PRIMARY KEY (codigo_aluno)
);

CREATE TABLE pedido (
  codigo_pedido INT UNSIGNED NOT NULL AUTO_INCREMENT,
  aluno INT UNSIGNED NOT NULL,
  data  DATE,
  hora TIMESTAMP,
  PRIMARY KEY (codigo_pedido),
  CONSTRAINT fk_aluno  FOREIGN KEY (aluno) REFERENCES aluno (codigo_aluno)
);

CREATE TABLE pedido_detalhe (
  pedido INT UNSIGNED NOT NULL,
  curso INT UNSIGNED NOT NULL,
  valor DOUBLE UNSIGNED NOT NULL,
  PRIMARY KEY (pedido, curso),
  FOREIGN KEY (pedido) REFERENCES pedido (codigo_pedido),
  FOREIGN  KEY (curso) REFERENCES pedido (codigo_pedido)
);