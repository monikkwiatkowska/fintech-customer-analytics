-- Payment Method Analysis
-- Revenue breakdown and distribution by payment type
-- Fintech focus: Understanding payment preferences
-- Author: Monika Kwiatkowska 
-- Date: February 2026

SELECT 
    payment_method,
    COUNT(*) as num_orders,
    ROUND(SUM(total_payment), 2) as total_revenue,
    ROUND(AVG(total_payment), 2) as avg_order_value,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM orders), 2) as pct_of_orders
FROM orders
GROUP BY payment_method
ORDER BY total_revenue DESC;

-- Key Insight: Credit card dominates payment methods
-- Business Impact: Optimize payment page for most popular methods
-- Fintech Application: Payment method preferences inform checkout design
