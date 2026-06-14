select * from counterfeit_transactions;

-- 1 Total number of transactions
select count(*) As total_tranction from counterfeit_transactions;

-- 2. Total sales amount
select sum(total_amount) as sales_amount from counterfeit_transactions;

-- 3. Average transaction value
select avg(total_amount) as avg_transaction from counterfeit_transactions;


-- 4. Number of counterfeit transactions
select count(*) as counterfeit_transaction from counterfeit_transactions where involves_counterfeit = TRUE;


-- 5. Transactions by payment method
select payment_method, count(*) as transcations from counterfeit_transactions group by payment_method order by transcations desc;

-- 6. Top 10 locations with highest counterfeit activity
select customer_location,count(*) as counterfeity from counterfeit_transactions where involves_counterfeit = TRUE group by customer_location order by counterfeity desc; 

-- 7. Average transaction amount by location
select customer_location,avg(total_amount) as avg_transcation from counterfeit_transactions group by customer_location order by avg_transcation desc; 


-- 8. Refund requests analysis
select refund_requested ,count(*) as transcation from  counterfeit_transactions group by refund_requested ;


--  9. Monthly transaction trend
SELECT
DATE_TRUNC('month', transaction_date) AS month,
COUNT(*) AS transactions,
SUM(total_amount) AS revenue
FROM counterfeit_transactions
GROUP BY month
ORDER BY month;