-- Top 5 laços mais vendidos
CREATE OR REPLACE VIEW kpi_top5_lacos AS
SELECT 
    m.nome AS modelo,
    COUNT(*) AS quantidade_vendida
FROM 
    item_pedido ip
JOIN produto p ON ip.produto_id = p.id
JOIN modelo m ON p.modelo_id = m.id
GROUP BY m.nome
ORDER BY quantidade_vendida DESC
LIMIT 5;

-- Clientes que compraram mais de uma vez
CREATE OR REPLACE VIEW kpi_clientes_fieis AS
SELECT 
    u.id AS usuario_id,
    u.nome,
    COUNT(DISTINCT p.id) AS vezes_comprou
FROM 
    pedido p
JOIN usuario u ON p.usuario_id = u.id
GROUP BY u.id, u.nome
HAVING vezes_comprou > 1;

-- Clientes novos neste mês
CREATE OR REPLACE VIEW kpi_clientes_novos AS
SELECT 
    COUNT(*) AS total_clientes_novos
FROM 
    usuario
WHERE 
    MONTH(data_cadastro) = MONTH(CURRENT_DATE()) AND
    YEAR(data_cadastro) = YEAR(CURRENT_DATE());

-- Forma de pagamento mais usada
CREATE OR REPLACE VIEW kpi_forma_pagamento_popular AS
SELECT 
    forma_pagamento,
    COUNT(*) AS quantidade
FROM 
    pedido
GROUP BY forma_pagamento
ORDER BY quantidade DESC
LIMIT 1;

-- Total vendido (pedidos pagos)
CREATE OR REPLACE VIEW kpi_total_vendas AS
SELECT 
    IFNULL(SUM(total), 0) AS total_vendido
FROM 
    pedido
WHERE 
    status_pagamento_id = (SELECT id FROM status_pagamento WHERE nome = 'Pago');

-- Total vendido no mês atual
CREATE OR REPLACE VIEW kpi_total_vendas_mes_atual AS
SELECT 
    IFNULL(SUM(total), 0) AS total_vendido_mes
FROM 
    pedido
WHERE 
    MONTH(data_pedido) = MONTH(CURRENT_DATE())
  AND YEAR(data_pedido) = YEAR(CURRENT_DATE())
  AND status_pagamento_id = (SELECT id FROM status_pagamento WHERE nome = 'Pago');


CREATE OR REPLACE VIEW kpi_comparativo_total_vendas AS
SELECT
  COALESCE(SUM(CASE 
    WHEN MONTH(data_pedido) = MONTH(CURDATE()) 
     AND YEAR(data_pedido) = YEAR(CURDATE()) 
    THEN total END), 0) AS total_atual,
  
  COALESCE(SUM(CASE 
    WHEN MONTH(data_pedido) = MONTH(CURDATE() - INTERVAL 1 MONTH) 
     AND YEAR(data_pedido) = YEAR(CURDATE() - INTERVAL 1 MONTH) 
    THEN total END), 0) AS total_anterior
FROM pedido;

select * from kpi_comparativo_total_vendas;

CREATE OR REPLACE VIEW kpi_comparativo_total_vendas AS
SELECT
  COALESCE(SUM(CASE 
    WHEN MONTH(data_pedido) = MONTH(CURDATE()) AND YEAR(data_pedido) = YEAR(CURDATE())
    THEN total END), 0) AS total_atual,

  COALESCE(SUM(CASE 
    WHEN MONTH(data_pedido) = MONTH(CURDATE() - INTERVAL 1 MONTH) AND YEAR(data_pedido) = YEAR(CURDATE() - INTERVAL 1 MONTH)
    THEN total END), 0) AS total_anterior
FROM pedido
WHERE status_pagamento_id = (SELECT id FROM status_pagamento WHERE nome = 'Pago');

CREATE OR REPLACE VIEW kpi_comparativo_clientes_novos AS
SELECT
  COALESCE(SUM(CASE 
    WHEN MONTH(data_cadastro) = MONTH(CURDATE()) AND YEAR(data_cadastro) = YEAR(CURDATE())
    THEN 1 END), 0) AS novos_atual,

  COALESCE(SUM(CASE 
    WHEN MONTH(data_cadastro) = MONTH(CURDATE() - INTERVAL 1 MONTH) AND YEAR(data_cadastro) = YEAR(CURDATE() - INTERVAL 1 MONTH)
    THEN 1 END), 0) AS novos_anterior
FROM usuario;

CREATE OR REPLACE VIEW kpi_comparativo_clientes_recompra AS
SELECT
  (
    SELECT COUNT(*) FROM (
      SELECT usuario_id FROM pedido
      WHERE MONTH(data_pedido) = MONTH(CURDATE()) AND YEAR(data_pedido) = YEAR(CURDATE())
      GROUP BY usuario_id
      HAVING COUNT(*) > 1
    ) AS sub_atual
  ) AS recompra_atual,

  (
    SELECT COUNT(*) FROM (
      SELECT usuario_id FROM pedido
      WHERE MONTH(data_pedido) = MONTH(CURDATE() - INTERVAL 1 MONTH)
        AND YEAR(data_pedido) = YEAR(CURDATE() - INTERVAL 1 MONTH)
      GROUP BY usuario_id
      HAVING COUNT(*) > 1
    ) AS sub_anterior
  ) AS recompra_anterior;

CREATE OR REPLACE VIEW kpi_comparativo_forma_pagamento AS
SELECT
  (SELECT forma_pagamento
   FROM pedido
   WHERE MONTH(data_pedido) = MONTH(CURDATE()) AND YEAR(data_pedido) = YEAR(CURDATE())
   GROUP BY forma_pagamento
   ORDER BY COUNT(*) DESC
   LIMIT 1) AS mais_usado_atual,

  (SELECT forma_pagamento
   FROM pedido
   WHERE MONTH(data_pedido) = MONTH(CURDATE() - INTERVAL 1 MONTH)
     AND YEAR(data_pedido) = YEAR(CURDATE() - INTERVAL 1 MONTH)
   GROUP BY forma_pagamento
   ORDER BY COUNT(*) DESC
   LIMIT 1) AS mais_usado_anterior;
