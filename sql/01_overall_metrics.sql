-- Overall Business Metrics
-- Provides high-level KPIs for the e-commerce business
-- Author: Monika Kwiatkowska 
-- Date: February 2026

SELECT 
    COUNT(*) as total_orders,
    COUNT(DISTINCT customer_id) as total_customers,
    ROUND(SUM(total_payment), 2) as total_revenue,
    ROUND(AVG(total_payment), 2) as avg_order_value,
    ROUND(MIN(total_payment), 2) as min_order,
    ROUND(MAX(total_payment), 2) as max_order
FROM orders;

-- Key Insight: Provides baseline metrics for business health
-- Business Impact: Track KPIs over time for performance monitoring
