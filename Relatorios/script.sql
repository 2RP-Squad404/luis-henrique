%hive

-- Query combinada para PURCHASES e CAMPAIGNS
SELECT
    p.client_id,
    ROUND(SUM(p.price * p.amount * p.discount_applied), 2) AS total_price,
    MAX(p.purchase_location) AS most_purchase_location,
    DATE_FORMAT(MIN(p.purchase_datetime), 'yyyy-MM-dd HH:mm') AS first_purchase,
    DATE_FORMAT(MAX(p.purchase_datetime), 'yyyy-MM-dd HH:mm') AS last_purchase,
    COALESCE(MAX(c.most_campaign), 0) AS most_campaign,
    COALESCE(MAX(c.quantity_error), 0) AS quantity_error
FROM 
    purchases p
LEFT JOIN (
    SELECT 
        client_id, 
        SUM(CASE WHEN return_status != 'error' THEN 1 ELSE 0 END) AS most_campaign,
        SUM(CASE WHEN return_status = 'error' THEN 1 ELSE 0 END) AS quantity_error
    FROM 
        campaigns
    GROUP BY 
        client_id
) c
ON p.client_id = c.client_id
GROUP BY 
    p.client_id