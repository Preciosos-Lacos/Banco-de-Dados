-- View: Total de Vendas (Atual vs. Anterior)
CREATE OR REPLACE VIEW kpi_comparativo_total_vendas AS
SELECT
    COALESCE(SUM(CASE 
        WHEN MONTH(data_pedido) = MONTH(CURRENT_DATE()) 
         AND YEAR(data_pedido) = YEAR(CURRENT_DATE()) 
        THEN total 
    END), 0) AS total_atual,
    COALESCE(SUM(CASE 
        WHEN MONTH(data_pedido) = MONTH(CURRENT_DATE() - INTERVAL 1 MONTH) 
         AND YEAR(data_pedido) = YEAR(CURRENT_DATE() - INTERVAL 1 MONTH) 
        THEN total 
    END), 0) AS total_anterior
FROM pedido;

-- View: Clientes Novos (Atual vs. Anterior)
CREATE OR REPLACE VIEW kpi_comparativo_clientes_novos AS
SELECT
    COALESCE(COUNT(CASE 
        WHEN MONTH(data_cadastro) = MONTH(CURRENT_DATE()) 
         AND YEAR(data_cadastro) = YEAR(CURRENT_DATE()) 
        THEN id 
    END), 0) AS novos_atual,
    COALESCE(COUNT(CASE 
        WHEN MONTH(data_cadastro) = MONTH(CURRENT_DATE() - INTERVAL 1 MONTH) 
         AND YEAR(data_cadastro) = YEAR(CURRENT_DATE() - INTERVAL 1 MONTH) 
        THEN id 
    END), 0) AS novos_anterior
FROM usuario;

-- View: Clientes com Recompra (Atual vs. Anterior)
CREATE OR REPLACE VIEW kpi_comparativo_clientes_recompra AS
SELECT
    COALESCE(COUNT(DISTINCT CASE
        WHEN MONTH(p.data_pedido) = MONTH(CURRENT_DATE()) 
         AND YEAR(p.data_pedido) = YEAR(CURRENT_DATE()) 
         AND u.qtd_pedidos > 1 
        THEN p.usuario_id
    END), 0) AS recompra_atual,
    COALESCE(COUNT(DISTINCT CASE
        WHEN MONTH(p.data_pedido) = MONTH(CURRENT_DATE() - INTERVAL 1 MONTH) 
         AND YEAR(p.data_pedido) = YEAR(CURRENT_DATE() - INTERVAL 1 MONTH) 
         AND u.qtd_pedidos > 1 
        THEN p.usuario_id
    END), 0) AS recompra_anterior
FROM pedido p
JOIN (
    SELECT usuario_id, COUNT(*) AS qtd_pedidos
    FROM pedido
    GROUP BY usuario_id
) u ON p.usuario_id = u.usuario_id;

-- View: Forma de Pagamento Mais Usada (Somente mês atual)
CREATE OR REPLACE VIEW kpi_forma_pagamento_popular AS
SELECT 
    forma_pagamento,
    COUNT(*) AS quantidade
FROM pedido
WHERE MONTH(data_pedido) = MONTH(CURRENT_DATE())
  AND YEAR(data_pedido) = YEAR(CURRENT_DATE())
GROUP BY forma_pagamento
ORDER BY quantidade DESC
LIMIT 1;

-- View: Top 3 Formas de Pagamento com Comparativo Mensal
CREATE OR REPLACE VIEW kpi_top3_forma_pagamento_comparativo AS
SELECT
  atual.forma_pagamento,
  atual.total AS qtd_atual,
  COALESCE(anterior.total, 0) AS qtd_anterior,
  CASE
    WHEN COALESCE(anterior.total, 0) = 0 THEN 100
    ELSE ROUND(((atual.total - anterior.total) / anterior.total) * 100, 2)
  END AS crescimento_percentual
FROM
  (
    SELECT forma_pagamento, COUNT(*) AS total
    FROM pedido
    WHERE MONTH(data_pedido) = MONTH(CURRENT_DATE())
      AND YEAR(data_pedido) = YEAR(CURRENT_DATE())
    GROUP BY forma_pagamento
    ORDER BY total DESC
    LIMIT 3
  ) AS atual
LEFT JOIN
  (
    SELECT forma_pagamento, COUNT(*) AS total
    FROM pedido
    WHERE MONTH(data_pedido) = MONTH(CURRENT_DATE() - INTERVAL 1 MONTH)
      AND YEAR(data_pedido) = YEAR(CURRENT_DATE() - INTERVAL 1 MONTH)
    GROUP BY forma_pagamento
  ) AS anterior ON atual.forma_pagamento = anterior.forma_pagamento;

-- View: Top 5 Laços Mais Vendidos (Somente mês atual)
CREATE OR REPLACE VIEW kpi_top5_lacos_comparativo AS
SELECT
  m.id AS modelo_id,
  m.nome AS modelo,
  COALESCE(SUM(ip.quantidade), 0) AS quantidade_atual
FROM modelo m
LEFT JOIN produto p ON p.modelo_id = m.id
LEFT JOIN item_pedido ip ON ip.produto_id = p.id
LEFT JOIN pedido ped ON ped.id = ip.pedido_id
WHERE MONTH(ped.data_pedido) = MONTH(CURRENT_DATE())
  AND YEAR(ped.data_pedido) = YEAR(CURRENT_DATE())
GROUP BY m.id, m.nome
ORDER BY quantidade_atual DESC
LIMIT 5;
