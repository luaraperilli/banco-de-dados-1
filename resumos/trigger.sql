-- Trigger ou Gatilhos
-- Comando executado pelo sistema como um efeito colateral de uma modificação no banco de dados
-- É um bloco de comandos

-- Estrutura do trigger
CREATE TRIGGER nometrigger 
tempotrigger<AFTER, BEFORE> 
eventotrigger<INSERT, UPDATE, DELETE> 
ON tabela 
FOR EACH tipotrigger<FOR EACH ROW, STATEMENT>
'triggercomandos';

-- Exemplo 1: Vamos inserir um funcionário e ele não pode ganhar mais que o gerente. Toda vez que inserir um funcionário é preciso validar se ele vai ganhar menos que o gerente. Isso pode ser feito com trigger. Mas o disparo deve ser feito antes da operação de inserção, pois ele verá qual é o funcionário, verá o salário do gerente dele e comparará. Se for menor que o salário do funcionário a operação será cancelada. Gatilho deve ser feito ANTES da operação

-- Exemplo 2: Atributo que conta a quantidade de funcionários num departamento. A cada inserção de funcionários a quantidade é atualizada. Nesse caso, o gatilho será implementado DEPOIS da operação de inserção

-- Operadores NEW e OLD possibilitam acessar os valores das colunas da tabela alvo do comando SQL antes (BEFORE) ou depois (AFTER) da alteração que dispara o trigger 
-- NEW: Representa os valores novos da linha em uma operação. Ele está disponível em operações que inserem ou atualizam dados (INSERT e UPDATE)
-- OLD: Representa os valores anteriores da linha em uma operação. Ele está disponível em operações que excluem ou atualizam dados (DELETE e UPDATE)

-- Criar um trigger para quando o professor de uma turma for alterado
-- OF professor = coluna da tabela turmas. Utilizar o OF só faz sentido no trigger de UPDATE
CREATE TRIGGER atualizaNroTurmas AFTER UPDATE ON turmas OF professor FOR EACH ROW
BEGIN
UPDATE professores SET nroTurmas = nroTurmas + 1 WHERE matricula = NEW.professor;
UPDATE professores SET nroTurmas = nroTurmas -1 WHERE matricula = OLD.professor;
END;

-- Gatilhos no Postgres
-- Sâo implementadas com PL/pgSQL

-- Estrutura do trigger no Postgres
CREATE TRIGGER nome
tempo (AFTER, BEFORE)
evento (INSERT, UPDATE, DELETE)
ON tabela
tipo (FOR EACH ROW, STATEMENT)
EXECUTE PROCEDURE nomedafuncao;

-- Função que contém a lógica do trigger não pode ter parâmetro de entrada nem de saída e deve retornar o trigger
-- CREATE OR REPLACE permite substituir a função caso ela seja executada errada. Permite que você substitua um objeto existente sem precisar primeiro apagá-lo explicitamente
CREATE OR REPLACE FUNCTION nomedafuncao() 
RETURNS TRIGGER
AS $$
-- Corpo da função
$$ LANGUAGE plpgsql

-- Variáveis especiais
-- TG_WHEN: AFTER ou BEFORE
-- TG_LEVEL: ROW ou STATEMENT
-- TG_OP: INSERT, DELETE ou UPDATE

-- Exemplo de trigger
CREATE OR REPLACE FUNCTION alteraqtde ()
RETURNS TRIGGER
AS $$
BEGIN
    if (TG_OP = INSERT) THEN
        UPDATE departamento SET qtdef = qtdef + 1
        WHERE codigo = NEW.dept;
    elseif (TG_OP = DELETE) THEN
        UPDATE departamento SET qtdef = qtdef -1
        WHERE codigo = OLD.dept;
    elseif ((TG_OP = UPDATE) AND (OLD.dept != NEW.dept)) THEN
        UPDATE departamento SET qtdef = qtdef -1 WHERE codigo = OLD.dept;    
        UPDATE departamento SET qtdef = qtdef +1 WHERE codigo = NEW.dept;    

CREATE TRIGGER trgalteraqtddein 
AFTER INSERT OR DELETE OR UPDATE 
ON funcinario 
FOR EACH ROW 
EXECUTE PROCEDURE alteraqtde();