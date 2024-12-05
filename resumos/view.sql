-- Views
-- Maneira de manipular dados de uma ou mais tabelas base
-- Pode-se fazer operações DML pela VIEW
-- Pode ser uma tabela virtual

-- Visão atualizada: modificações na tabela base muda na visão. Significa que a visão reflete automaticamente as alterações feitas na tabela base.

-- Visão atualizável: modificações na visão muda a tabela base. Significa que você pode usar a visão para alterar a tabela base. Requisitos para ser atualizável:
-- Deve conter todos os atributos necessários para identificar e atualizar registros, incluindo a chave primária.
-- Não pode conter junções (JOIN).
-- Não pode usar funções de agregação (SUM, AVG, etc.) nem cláusulas como GROUP BY ou HAVING.
-- Deve haver relação 1:1 entre os registros da visão e da tabela base.

-- Visão Materializada:
-- Os dados são armazenados fisicamente no banco e não refletem automaticamente alterações na tabela base.
-- É necessário usar o comando REFRESH MATERIALIZED VIEW para atualizar os dados. Útil para melhorar desempenho em consultas complexas, evitando recalcular os dados sempre

-- Estrutura da view
CREATE VIEW nomedaview AS (SELECT especificacaodoselect);

-- Elabore uma view que contenha todos os funcionários do departamento de código 100
CREATE VIEW fdept100 AS (SELECT * FROM funcionario WHERE coddept = 100);

-- Para view materializada
DROP MATERIALIZED VIEW;
REFRESH MATERIALIZED VIEW;
WITH NO DATA; -- View criada mas não populada, evitando gargalos em horários em que o sistema está sendo muito utilizado. View pode ser populada posteriormente.
