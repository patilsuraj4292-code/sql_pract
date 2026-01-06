--query to print top 5 cities with highest spends and their percentage contribution of total credit card spends
with total_spent_cte as (
select sum(cast(amount as bigint))as total_spent
from credit_card_transcations)
select top 5 city,sum(amount) as expense,total_spent,cast((sum(amount)*1.0 /total_spent) * 100 as decimal(5,2)) as percentage_contribution
from credit_card_transcations,total_spent_cte
group by city,total_spent
order by expense desc
