USE bancobd22025;
SELECT 
    *
FROM
    conta;
    -- espaço
SELECT 
    *
FROM
    cliente;
    -- espaço
SELECT 
    *
FROM
    contavinculada;
    -- espaço
SELECT 
    saldo
FROM
    conta
WHERE
    conta.tipo = 'Poupança';
    -- espaço
 START TRANSACTION;
UPDATE conta 
SET 
    saldo = saldo * 1.1
WHERE
    conta.tipo = 'Poupança';
 SELECT 
    saldo
FROM
    conta
WHERE
    conta.tipo = 'Poupança';
 COMMIT;
 -- espaço
SELECT 
    saldo
FROM
    conta
WHERE
    conta.tipo = 'Poupança';
    -- atividade 2
SELECT 
    *
FROM
    cliente
WHERE
    idCLIENTE > 31;
     -- espaço
START TRANSACTION;
INSERT INTO cliente(nome,cpf,rg,dataNascimento,telefone)VALUES ('Fábio', '456-456,444-56',NULL,'1989-03-01','35999744459'),
('Brian', '456-456,444-76',NULL,'1989-03-02','35999744458'),
('Ana', '456-456,444-36',NULL,'1989-03-05','35999744457');
COMMIT;
SELECT 
    *
FROM
    cliente
WHERE
    idCLIENTE > 31;
     -- atividade 3
DESCRIBE conta;
DESCRIBE contavinculada;
START TRANSACTION;
DELETE FROM contavinculada 
WHERE
    contavinculada.CONTA_idCONTA = 1;
    -- espaço
DELETE FROM conta 
WHERE
    conta.idCONTA = 1;
    -- espaço
SELECT 
    *
FROM
    contavinculada
WHERE
    contavinculada.CONTA_idCONTA = 1;
    -- espaço
SELECT 
    *
FROM
    conta
WHERE
    conta.idCONTA = 1;
COMMIT;
-- espaço
SELECT 
    *
FROM
    contavinculada
WHERE
    contavinculada.CONTA_idCONTA = 1;
    -- espaço
SELECT 
    *
FROM
    conta
WHERE
    conta.idCONTA = 1;
-- atividade 4





