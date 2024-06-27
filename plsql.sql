--INSERE_PROJETO
SELECT* FROM BRH.PROJETO;

CREATE OR REPLACE PROCEDURE brh.insere_projeto
(
p_NOME in BRH.PROJETO.NOME%type,
p_RESPONSAVEL in BRH.PROJETO.RESPONSAVEL%type
)
IS
BEGIN
    INSERT INTO
        BRH.PROJETO (NOME, RESPONSAVEL, INICIO)
    VALUES
        (p_NOME, p_RESPONSAVEL,SYSDATE);
    COMMIT;
END;

EXECUTE BRH.INSERE_PROJETO ('INSERE','V123');



--Validar novo projeto
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE brh.insere_projeto
(
p_NOME in BRH.PROJETO.NOME%type,
p_RESPONSAVEL in BRH.PROJETO.RESPONSAVEL%type
)
IS
BEGIN
    IF LENGTH(P_NOME) >= 2 THEN
        INSERT INTO BRH.PROJETO(NOME, RESPONSAVEL, INICIO)
        VALUES (P_NOME,P_RESPONSAVEL, SYSDATE);       
    ELSE
    dbms_output.put_line('Nome de projeto inv�lido! Deve ter dois ou mais caracteres.');
    END IF;
END;



-- CRIAR FUNCAO CALCULA_IDADE
CREATE OR REPLACE FUNCTION BRH.calcular_idade
    (p_DATA IN DATE)
    RETURN NUMBER
IS
    p_IDADE NUMBER;
BEGIN
    p_IDADE := TRUNC(MONTHS_BETWEEN(SYSDATE, p_DATA) / 12);
    RETURN p_IDADE;
END calcular_idade;

SELECT BRH.calcular_idade('12/10/2000') FROM DUAL



--Criar fun��o finaliza_projeto
CREATE OR REPLACE FUNCTION BRH.finaliza_projeto
    (p_id IN BRH.PROJETO.ID%TYPE)
    RETURN 
    BRH.PROJETO.FIM%TYPE
IS
    p_FINALIZACAO BRH.PROJETO.FIM%TYPE;
BEGIN
    UPDATE BRH.PROJETO SET BRH.PROJETO.FIM = SYSDATE WHERE ID = p_ID;
    RETURN p_FINALIZACAO;
END finaliza_projeto;

















