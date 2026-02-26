-- RFM Customer Segmentation
-- Segments customers by Recency, Frequency, Monetary value
-- Author: Monika Kwiatkowska 
-- Date: February 2026

WITH customer_rfm AS (
    SELECT 
        customer_id,
        -- Recency: days since last order
        JULIANDAY((SELECT MAX(order_purchase_timestamp) FROM orders)) - 
            JULIANDAY(MAX(order_purchase_timestamp)) as recency_days,
        -- Frequency: number of orders
        COUNT(order_id) as frequency,
        -- Monetary: total spent
        SUM(total_payment) as monetary
    FROM orders
    GROUP BY customer_id
),
rfm_scores AS (
    SELECT 
        customer_id,
        recency_days,
        frequency,
        monetary,
        -- Assign scores 1-5 (5 is best)
        -- For recency: lower days = better = higher score
        CASE 
            WHEN recency_days <= 30 THEN 5
            WHEN recency_days <= 60 THEN 4
            WHEN recency_days <= 90 THEN 3
            WHEN recency_days <= 180 THEN 2
            ELSE 1
        END as r_score,
        -- For frequency: more orders = better
        CASE 
            WHEN frequency >= 5 THEN 5
            WHEN frequency >= 4 THEN 4
            WHEN frequency >= 3 THEN 3
            WHEN frequency >= 2 THEN 2
            ELSE 1
        END as f_score,
        -- For monetary: higher spend = better
        CASE 
            WHEN monetary >= 1000 THEN 5
            WHEN monetary >= 500 THEN 4
            WHEN monetary >= 200 THEN 3
            WHEN monetary >= 100 THEN 2
            ELSE 1
        END as m_score
    FROM customer_rfm
)
SELECT 
    -- Create customer segments
    CASE 
        WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Champions'
        WHEN r_score >= 3 AND f_score >= 3 AND m_score >= 3 THEN 'Loyal Customers'
        WHEN r_score >= 4 AND m_score >= 3 THEN 'Recent High-Value'
        WHEN r_score >= 4 THEN 'Recent Customers'
        WHEN r_score <= 2 AND f_score >= 3 THEN 'At Risk'
        WHEN r_score <= 2 AND m_score >= 3 THEN 'Lost High-Value'
        WHEN r_score <= 2 THEN 'Lost Customers'
        ELSE 'Regular Customers'
    END as customer_segment,
    COUNT(*) as num_customers,
    ROUND(AVG(monetary), 2) as avg_value,
    ROUND(SUM(monetary), 2) as total_value
FROM rfm_scores
GROUP BY customer_segment
ORDER BY total_value DESC;

-- Key Insight: 80.6% of customers have churned (Lost segments)
-- Business Impact: Critical need for retention and win-back campaigns
-- Urgent Action: Focus on Recent High-Value (2,535 customers)
