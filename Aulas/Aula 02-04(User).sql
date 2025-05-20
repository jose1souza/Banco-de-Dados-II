CREATE DATABASE jose;
USE jose;

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(50),
    cpf_usuario VARCHAR(50)
);

INSERT INTO usuario (id_usuario,nome_usuario,cpf_usuario) VALUES ('1','José','146.792.746-50');
INSERT INTO usuario (id_usuario,nome_usuario,cpf_usuario) VALUES ('2','Dupla_Imaginaria','146.792.746-51');
INSERT INTO usuario (id_usuario,nome_usuario,cpf_usuario) VALUES ('3','Gestor','146.792.746-52');

SELECT * FROM usuario;

CREATE USER jose@10.0.24.13 IDENTIFIED BY '1234567812345678';
GRANT SELECT ON usuario TO jose@10.0.24.13;
GRANT INSERT ON usuario TO jose@10.0.24.13;

CREATE USER fabio@ipdofabio IDENTIFIED BY '1234567812345678';
GRANT SELECT ON usuario TO fabio@ipdofabio;

CREATE USER gestor@ipdogestor IDENTIFIED BY '1234567812345678';
GRANT INSERT ON usuario TO gestor@ipdogestor;
GRANT UPDATE ON usuario TO gestor@ipdogestor;
GRANT DELETE ON usuario TO gestor@ipdogestor;
