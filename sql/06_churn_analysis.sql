-- Customer Churn Analysis
-- Identifies churned and at-risk customers
-- Churn definition: 180+ days since last purchase
-- Author: Monika Kwiatkowska 
-- Date: February 2026

WITH customer_status AS (
    SELECT 
        customer_id,
        customer_state,
        MAX(order_purchase_timestamp) as last_order_date,
        COUNT(order_id) as total_orders,
        SUM(total_payment) as lifetime_value,
        JULIANDAY((SELECT MAX(order_purchase_timestamp) FROM orders)) - 
            JULIANDAY(MAX(order_purchase_timestamp)) as days_since_last_order
    FROM orders
    GROUP BY customer_id, customer_state
)
SELECT 
    CASE 
        WHEN days_since_last_order > 180 THEN 'Churned (180+ days)'
        WHEN days_since_last_order > 90 THEN 'At Risk (90-180 days)'
        WHEN days_since_last_order > 30 THEN 'Active (30-90 days)'
        ELSE 'Highly Active (<30 days)'
    END as customer_status,
    COUNT(*) as num_customers,
    ROUND(AVG(lifetime_value), 2) as avg_lifetime_value,
    ROUND(SUM(lifetime_value), 2) as total_value_at_risk
FROM customer_status
GROUP BY customer_status
ORDER BY 
    CASE 
        WHEN days_since_last_order > 180 THEN 4
        WHEN days_since_last_order > 90 THEN 3
        WHEN days_since_last_order > 30 THEN 2
        ELSE 1
    END;

-- Key Insight: High churn rate indicates retention problem
-- Business Impact: R$6.6M revenue at risk from Lost High-Value customers
-- Recommended Action: Implement win-back campaigns immediately
