CREATE OR REPLACE VIEW vw_top5_lacos_mais_vendidos AS
SELECT mo.nome AS modelo_nome, SUM(ip.quantidade) AS total_vendido
FROM item_pedido ip
JOIN produto p ON ip.produto_id = p.id
JOIN modelo mo ON p.modelo_id = mo.id
JOIN pedido pe ON ip.pedido_id = pe.id
WHERE pe.data_pedido >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY mo.nome
ORDER BY total_vendido DESC
LIMIT 5;

SELECT * FROM vw_top5_lacos_mais_vendidos;


CREATE OR REPLACE VIEW vw_total_vendas_6_meses AS
SELECT DATE_FORMAT(pe.data_pedido, '%Y-%m') AS mes_ano,
       SUM(pe.total) AS total_vendas
FROM pedido pe
WHERE pe.data_pedido >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY mes_ano
ORDER BY mes_ano;

SELECT * FROM vw_total_vendas_6_meses;


CREATE OR REPLACE VIEW vw_novos_clientes_6_meses AS
SELECT DATE_FORMAT(p.data_pedido, '%Y-%m') AS mes_ano,
       COUNT(DISTINCT p.usuario_id) AS novos_clientes
FROM pedido p
JOIN (
  SELECT usuario_id, MIN(data_pedido) AS primeiro_pedido
  FROM pedido
  GROUP BY usuario_id
) primeiro ON p.usuario_id = primeiro.usuario_id AND p.data_pedido = primeiro.primeiro_pedido
WHERE p.data_pedido >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY mes_ano
ORDER BY mes_ano;

SELECT * FROM vw_novos_clientes_6_meses;


CREATE OR REPLACE VIEW vw_clientes_recompra_6_meses AS
SELECT DATE_FORMAT(p.data_pedido, '%Y-%m') AS mes_ano,
       COUNT(DISTINCT p.usuario_id) AS clientes_recompraram
FROM pedido p
JOIN (
  SELECT usuario_id, COUNT(*) AS total_compras
  FROM pedido
  WHERE data_pedido >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
  GROUP BY usuario_id
  HAVING total_compras > 1
) clientes ON p.usuario_id = clientes.usuario_id
WHERE p.data_pedido >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY mes_ano
ORDER BY mes_ano;

SELECT * FROM vw_clientes_recompra_6_meses;

CREATE OR REPLACE VIEW vw_formas_pagamento_6_meses AS
SELECT DATE_FORMAT(pe.data_pedido, '%Y-%m') AS mes_ano,
       pe.forma_pagamento,
       COUNT(*) AS total_forma
FROM pedido pe
WHERE pe.data_pedido >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY mes_ano, pe.forma_pagamento
ORDER BY mes_ano;

SELECT * FROM vw_formas_pagamento_6_meses;


CREATE OR REPLACE VIEW vw_total_pedidos_6_meses AS
SELECT DATE_FORMAT(pe.data_pedido, '%Y-%m') AS mes_ano,
       sp.nome AS status_nome,
       COUNT(*) AS total_pedidos
FROM pedido pe
JOIN status_pedido sp ON pe.status_pedido_id = sp.id
WHERE pe.data_pedido >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY mes_ano, sp.nome
ORDER BY mes_ano;

SELECT * FROM vw_total_pedidos_6_meses;
