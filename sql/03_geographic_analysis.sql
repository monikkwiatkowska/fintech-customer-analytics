-- Geographic Performance Analysis
-- Top 10 customer states by revenue
-- Author: Monika Kwiatkowska 
-- Date: February 2026

SELECT 
    customer_state,
    COUNT(DISTINCT customer_id) as num_customers,
    COUNT(*) as num_orders,
    ROUND(SUM(total_payment), 2) as total_revenue,
    ROUND(AVG(total_payment), 2) as avg_order_value
FROM orders
GROUP BY customer_state
ORDER BY total_revenue DESC
LIMIT 10;

-- Key Insight: Revenue concentrated in top states
-- Business Impact: Focus marketing spend on high-performing regions
-- Growth Opportunity: Expand in underserved geographic markets
