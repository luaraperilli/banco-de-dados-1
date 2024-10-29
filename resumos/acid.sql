-- Conceitos Básicos Sobre Transação:
-- Transação é uma operação lógica, ou seja, qualquer cálculo lógico é considerado uma operação. O programador (projetista do banco) deve definir quais operações básicas representam uma operação lógica.

BEGIN;
UPDATE funcionario
SET nome = 'Maria João'
WHERE codigo = 1; -- Sem a confirmação do commit o comando não é realizado

BEGIN;
UPDATE funcionario
SET nome = 'Maria João'
WHERE codigo = 1; 
COMMIT; -- Commit confirma a transação que foi iniciada

ROLLBACK; -- Cancela as operações realizadas e finaliza a transação 
END; -- Finaliza um transação

-- Propriedades ACID:
-- A - Atomicidade: uma transação deve ser atômica, ou seja, deve ser completada em sua totalidade ou não ser realizada. Se qualquer parte da transação falhar (seja de hardware, do próprio banco, etc), todas as operações anteriores dentro dessa transação devem ser revertidas.
-- Exemplo: Imagine que uma transação envolva transferir dinheiro de uma conta para outra. A atomicidade garante que, se a transferência de dinheiro da primeira conta falhar, o valor não será subtraído da conta original, evitando perda de dados.

-- C - Consistência: uma transação deve levar o banco de dados de um estado consistente para outro estado igualmente consistente. Ou seja, as regras e restrições definidas no banco de dados (como chaves estrangeiras, regras de negócio, etc.) devem ser respeitadas antes e após a transação.
-- Exemplo: Se um banco de dados exige que o saldo de uma conta bancária nunca seja negativo, a propriedade de consistência assegura que, após qualquer transação, essa regra seja cumprida.

-- I - Isolamento: o isolamento garante que as transações concorrentes (transações que ocorrem simultaneamente) não interfiram entre si. O resultado de uma transação em andamento não deve ser visível para outras até que seja totalmente concluída.
-- Exemplo: Se duas pessoas estão tentando transferir dinheiro de uma mesma conta ao mesmo tempo, o isolamento assegura que cada transação será tratada de forma independente, e os valores finais serão consistentes.

-- D - Durabilidade: a durabilidade garante que, uma vez que uma transação tenha sido confirmada (committed), suas alterações são persistentes, mesmo em caso de falha no sistema (como uma queda de energia ou erro de hardware). Ou seja, não é necessário salvar as edições feitas no sistema manualmente, o banco se encarrega disso.
-- Exemplo: Se você faz uma compra e o banco confirma a transação, a propriedade de durabilidade garante que o valor debitado não será perdido mesmo que o sistema falhe logo após a confirmação.

-- Estados de uma transação:
-- 1. Ativa
-- Estado inicial de uma transação. Neste estado, a transação está sendo executada e todas as operações (leitura/escrita) estão ocorrendo. 
-- A transação permanece ativa enquanto nenhuma operação falha.

-- 2. Parcialmente Confirmada 
-- A transação atinge esse estado quando todas as operações foram realizadas com sucesso.
-- Significa que a transação está pronta para ser concluída, mas o commit ainda não foi realizado.
-- Caso ocorra um erro neste ponto, a transação pode ser revertida.

-- 3. Confirmada
-- Após a execução do commit, a transação é confirmada, tornando suas alterações permanentes no banco de dados.
-- Esse é o estado final para uma transação bem-sucedida.
-- Após a confirmação, as mudanças realizadas pela transação tornam-se visíveis para outras transações.

-- 4. Abortada
-- Se ocorrer um erro durante a execução das operações (quando a transação ainda está no estado Ativa), ela é abortada.
-- Neste estado, todas as mudanças realizadas pela transação são descartadas (rollback).
-- A transação pode ser reiniciada ou cancelada.

-- 5. Falha  
-- Esse estado é atingido se algum erro ocorre após a transação estar parcialmente confirmada.
-- Em caso de falha, um rollback é necessário para retornar o banco de dados ao estado anterior ao início da transação.
-- A transação pode ser abortada a partir deste estado.

-- 6. Rollback
-- Rollback é o processo de desfazer todas as operações realizadas pela transação.
-- O rollback ocorre quando a transação falha ou é abortada, garantindo a consistência do banco de dados.
