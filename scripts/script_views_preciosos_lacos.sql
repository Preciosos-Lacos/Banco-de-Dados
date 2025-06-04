-- View para total de vendas semanal no último mês
CREATE OR REPLACE VIEW kpi_vendas_semanal AS
SELECT
    YEARWEEK(p.data_pedido, 1) as ano_semana, -- 1 makes week start on Monday
    CONCAT(
        DATE_FORMAT(DATE_SUB(STR_TO_DATE(CONCAT(YEARWEEK(p.data_pedido, 1), ' Monday'), '%X%V %W'), INTERVAL WEEKDAY(STR_TO_DATE(CONCAT(YEARWEEK(p.data_pedido, 1), ' Monday'), '%X%V %W')) DAY), '%d/%m'),
        ' - ',
        DATE_FORMAT(DATE_ADD(DATE_SUB(STR_TO_DATE(CONCAT(YEARWEEK(p.data_pedido, 1), ' Monday'), '%X%V %W'), INTERVAL WEEKDAY(STR_TO_DATE(CONCAT(YEARWEEK(p.data_pedido, 1), ' Monday'), '%X%V %W')) DAY), INTERVAL 6 DAY), '%d/%m')
    ) AS periodo_semana,
    SUM(pp.quantidade * pr.preco_final) AS total_vendas
FROM pedido p
JOIN item_pedido pp ON p.id = pp.pedido_id
JOIN produto pr ON pp.produto_id = pr.id
WHERE p.data_pedido >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY ano_semana
ORDER BY ano_semana ASC;

-- View para novos clientes por semestre
CREATE OR REPLACE VIEW kpi_clientes_novos_semestral AS
SELECT
    YEAR(data_cadastro) as ano,
    CEIL(MONTH(data_cadastro) / 6) as semestre, -- 1 for Jan-Jun, 2 for Jul-Dec
    COUNT(id) AS novos_clientes
FROM usuario
GROUP BY ano, semestre
ORDER BY ano ASC, semestre ASC;

select*from kpi_clientes_novos_semestral ;

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
