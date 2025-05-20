USE bancobd22025;
CREATE VIEW vw_clientesOrdenados AS
SELECT 
    cliente.nome, cliente.cpf
FROM
    cliente
ORDER BY cliente.nome; 
-- fim
SELECT 
    *
FROM
    vw_clientesOrdenados;
CREATE VIEW vw_totalFinanceiro AS 
SELECT 
    SUM(conta.saldo) "Total Financeiro"
FROM
    conta; 
    -- fim
    CREATE VIEW vw_ AS
SELECT 
    cliente.nome, 
    conta.idCONTA, conta.tipo, 
    conta.saldo
FROM
    cliente
        INNER JOIN
    contavinculada ON contavinculada.CLIENTE_idCLIENTE = cliente.idCLIENTE
        INNER JOIN
    conta ON contavinculada.CONTA_idCONTA = conta.idCONTA;
