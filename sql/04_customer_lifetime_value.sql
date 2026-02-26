-- Customer Lifetime Value (CLV) Analysis
-- Identifies highest-value customers for retention focus
-- Author: Monika Kwiatkowska 
-- Date: February 2026

SELECT 
    customer_id,
    customer_state,
    COUNT(DISTINCT order_id) as num_orders,
    ROUND(SUM(total_payment), 2) as total_spent,
    ROUND(AVG(total_payment), 2) as avg_order_value,
    MIN(order_purchase_timestamp) as first_order,
    MAX(order_purchase_timestamp) as last_order,
    JULIANDAY(MAX(order_purchase_timestamp)) - JULIANDAY(MIN(order_purchase_timestamp)) as lifespan_days
FROM orders
GROUP BY customer_id, customer_state
ORDER BY total_spent DESC
LIMIT 20;

-- Key Insight: Top customers drive disproportionate revenue
-- Business Impact: VIP treatment for high-value customers
-- Retention Strategy: Prevent churn in top 20% of customers
