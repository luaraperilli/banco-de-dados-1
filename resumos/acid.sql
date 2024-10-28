-- Conceitos Básicos Sobre Transação e Propriedades ACID
-- Transação é uma operação lógica
BEGIN;
UPDATE funcionario
SET nome = 'Maria João'
WHERE codigo = 1; -- Sem a confirmação do commit o comando não é realizado

BEGIN;
UPDATE funcionario
SET nome = 'Maria João'
WHERE codigo = 1; 
COMMIT; -- Commit confirma a transação que foi iniciada

-- A - Atomicidade: uma transação deve ser atômica, ou seja, deve ser completada em sua totalidade ou não ser realizada. Se qualquer parte da transação falhar (seja de hardware, do próprio banco, etc), todas as operações anteriores dentro dessa transação devem ser revertidas.
-- Exemplo: Imagine que uma transação envolva transferir dinheiro de uma conta para outra. A atomicidade garante que, se a transferência de dinheiro da primeira conta falhar, o valor não será subtraído da conta original, evitando perda de dados.

-- C - Consistência: uma transação deve levar o banco de dados de um estado consistente para outro estado igualmente consistente. Ou seja, as regras e restrições definidas no banco de dados (como chaves estrangeiras, regras de negócio, etc.) devem ser respeitadas antes e após a transação.
-- Exemplo: Se um banco de dados exige que o saldo de uma conta bancária nunca seja negativo, a propriedade de consistência assegura que, após qualquer transação, essa regra seja cumprida.

-- I - Isolamento: o isolamento garante que as transações concorrentes (transações que ocorrem simultaneamente) não interfiram entre si. O resultado de uma transação em andamento não deve ser visível para outras até que seja totalmente concluída.
-- Exemplo: Se duas pessoas estão tentando transferir dinheiro de uma mesma conta ao mesmo tempo, o isolamento assegura que cada transação será tratada de forma independente, e os valores finais serão consistentes.

-- D - Durabilidade: a durabilidade garante que, uma vez que uma transação tenha sido confirmada (committed), suas alterações são persistentes, mesmo em caso de falha no sistema (como uma queda de energia ou erro de hardware). Ou seja, não é necessário salvar as edições feitas no sistema manualmente, o banco se encarrega disso.
-- Exemplo: Se você faz uma compra e o banco confirma a transação, a propriedade de durabilidade garante que o valor debitado não será perdido mesmo que o sistema falhe logo após a confirmação.
