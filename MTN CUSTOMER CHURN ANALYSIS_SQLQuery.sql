select * 
from MTN_Data..mtn_customer_churn

-- DATA SUMMARIZATION
-- showing the popularity of the devices
select [MTN Device], count(distinct [Customer ID]) as [Number of Devices]
from MTN_Data..mtn_customer_churn
group by [MTN Device]
order by [Number of Devices]

-- showing the breakdown of the customer base by gender
select gender, count(distinct [Customer ID]) as [Customers by Gender]
from MTN_Data..mtn_customer_churn
group by gender

-- showing the number of customers in each state
select state, count(distinct [Customer ID]) as [Number of Customers]
from MTN_Data..mtn_customer_churn
group by State
order by [Number of Customers] desc

-- showing the overall customer satisfaction rates
select [Customer Review] as [Rating], count([Customer Review]) as [Overall Customer Review]
from MTN_Data..mtn_customer_churn
group by [Customer Review]
order by [Overall Customer Review] desc

-- showing the summary of customer satisfaction rates for each device
select [Customer Review] as [Rating], count([Customer Review]) as [Customer Review for 4G Router]
from MTN_Data..mtn_customer_churn
where [MTN Device] = '4G Router'
group by [Customer Review]

select [Customer Review] as [Rating], count([Customer Review]) as [Customer Review for 5G Broadband Router]
from MTN_Data..mtn_customer_churn
where [MTN Device] = '5G Broadband Router'
group by [Customer Review]

select [Customer Review] as [Rating], count([Customer Review]) as [Customer Review for Broadband Mifi]
from MTN_Data..mtn_customer_churn
where [MTN Device] = 'Broadband Mifi'
group by [Customer Review]

select [Customer Review] as [Rating], count([Customer Review]) as [Customer Review for Mobile SIM Card]
from MTN_Data..mtn_customer_churn
where [MTN Device] = 'Mobile SIM Card'
group by [Customer Review]


-- CUSTOMER CHURN ANALYSIS
-- showing the overall churn status in Q1 2025
select case
	when [Customer Churn Status] = 'Yes' then 'Inactive'
	when [Customer Churn Status] = 'No' then 'Active'
	end as [Customer Churn Status], 
count([Customer Churn Status])
from MTN_Data..mtn_customer_churn
group by [Customer Churn Status]

-- showing the device with the highest level of churning
select [MTN Device], count([MTN Device]) as [Number of Inactive Customers]
from MTN_Data..mtn_customer_churn
where [Customer Churn Status] = 'Yes'
group by [MTN Device]
order by count([MTN Device]) desc

-- showing the overall reasons for customer churning
select [Reasons for Churn], count([Reasons for Churn])
from MTN_Data..mtn_customer_churn
where [Customer Churn Status] = 'Yes'
group by [Reasons for Churn]
order by count([Reasons for Churn]) desc

-- discovering the reasons for customer churning for the individual devices
select [Reasons for Churn] as [Reasons for Churn MSC], count([Reasons for Churn])
from MTN_Data..mtn_customer_churn
where [Customer Churn Status] = 'Yes' and [MTN Device] = 'Mobile SIM Card'
group by [Reasons for Churn]
order by count([Reasons for Churn]) desc

select [Reasons for Churn] as [Reasons for Churn 4GR], count([Reasons for Churn])
from MTN_Data..mtn_customer_churn
where [Customer Churn Status] = 'Yes' and [MTN Device] = '4G Router'
group by [Reasons for Churn]
order by count([Reasons for Churn]) desc

select [Reasons for Churn] as [Reasons for Churn 5GBR], count([Reasons for Churn])
from MTN_Data..mtn_customer_churn
where [Customer Churn Status] = 'Yes' and [MTN Device] = '5G Broadband Router'
group by [Reasons for Churn]
order by count([Reasons for Churn]) desc

select [Reasons for Churn] as [Reasons for Churn BM], count([Reasons for Churn])
from MTN_Data..mtn_customer_churn
where [Customer Churn Status] = 'Yes' and [MTN Device] = 'Broadband Mifi'
group by [Reasons for Churn]
order by count([Reasons for Churn]) desc

-- analysing churning behaviour with respect to customer age-groups
-- ages 16 - 35
select [Reasons for Churn] as [Reasons for Churn, Ages 16-35], count([Reasons for Churn])
from
	(select age, [Data Usage], [Total Revenue], [Reasons for Churn]
	from
		(select age, [Data Usage], [Total Revenue], [Reasons for Churn]
		from MTN_Data..mtn_customer_churn
		where [Customer Churn Status] = 'Yes') as derived_table1
	where age between 16 and 35) as derived_table2
group by [Reasons for Churn]
order by count([Reasons for Churn]) desc

-- ages 36 - 55
select [Reasons for Churn] as [Reasons for Churn, Ages 36-55], count([Reasons for Churn])
from
	(select age, [Data Usage], [Total Revenue], [Reasons for Churn]
	from
		(select age, [Data Usage], [Total Revenue], [Reasons for Churn]
		from MTN_Data..mtn_customer_churn
		where [Customer Churn Status] = 'Yes') as derived_table1
	where age between 35 and 55) as derived_table2
group by [Reasons for Churn]
order by count([Reasons for Churn]) desc

-- ages 56 and above
select [Reasons for Churn] as [Reasons for Churn, Ages 56 above], count([Reasons for Churn])
from
	(select age, [Data Usage], [Total Revenue], [Reasons for Churn]
	from
		(select age, [Data Usage], [Total Revenue], [Reasons for Churn]
		from MTN_Data..mtn_customer_churn
		where [Customer Churn Status] = 'Yes') as derived_table1
	where age >= 56) as derived_table2
group by [Reasons for Churn]
order by count([Reasons for Churn]) desc

-- showing the devices which are most affected by each of the reasons for customer churning
-- High Call Tarriffss
select [MTN Device], count([MTN Device]) as [Number of Devices]
from
	(select [Reasons for Churn], age, [Total Revenue], [Data Usage], [Customer Tenure in months], [MTN Device]
	from MTN_Data..mtn_customer_churn
	where [Reasons for Churn] = 'High call tarriffs') as derived_table
group by [MTN Device]
-- Mobile sim card is most affected by high call tarriffs. 

-- Better Offers from Competitors
select [MTN Device], count([MTN Device]) as [Number of Devices]
from
	(select [Reasons for Churn], age, [Total Revenue], [Data Usage], [Customer Tenure in months], [MTN Device]
	from MTN_Data..mtn_customer_churn
	where [Reasons for Churn] = 'Better Offers from Competitors') as derived_table
group by [MTN Device]
-- 4G router and mobile sim cards are most affected by better offers from competitors

-- Poor Network
select [MTN Device], count([MTN Device]) as [Number of Devices]
from
	(select [Reasons for Churn], age, [Total Revenue], [Data Usage], [Customer Tenure in months], [MTN Device]
	from MTN_Data..mtn_customer_churn
	where [Reasons for Churn] = 'poor network') as derived_table
group by [MTN Device]
-- 5G broadband router is most affected by poor network

-- Costly data plans
select [MTN Device], count([MTN Device]) as [Number of Devices]
from
	(select [Reasons for Churn], age, [Total Revenue], [Data Usage], [Customer Tenure in months], [MTN Device]
	from MTN_Data..mtn_customer_churn
	where [Reasons for Churn] = 'costly data plans') as derived_table
group by [MTN Device]
-- mobile sim cards are most affected by costly data plans

-- Poor customer service
select [MTN Device], count([MTN Device]) as [Number of Devices]
from
	(select [Reasons for Churn], age, [Total Revenue], [Data Usage], [Customer Tenure in months], [MTN Device]
	from MTN_Data..mtn_customer_churn
	where [Reasons for Churn] = 'poor customer service') as derived_table
group by [MTN Device]
-- mobile sim cards are most affected by poor customer service

-- Fast data consumption
select [MTN Device], count([MTN Device]) as [Number of Devices]
from
	(select [Reasons for Churn], age, [Total Revenue], [Data Usage], [Customer Tenure in months], [MTN Device]
	from MTN_Data..mtn_customer_churn
	where [Reasons for Churn] = 'fast data consumption') as derived_table
group by [MTN Device]
-- mobile sim cards are most affected by poor customer service

-- Relocation
select [MTN Device], count([MTN Device]) as [Number of Devices]
from
	(select [Reasons for Churn], age, [Total Revenue], [Data Usage], [Customer Tenure in months], [MTN Device]
	from MTN_Data..mtn_customer_churn
	where [Reasons for Churn] = 'relocation') as derived_table
group by [MTN Device]
-- mobile sim cards are most affected by relocation  