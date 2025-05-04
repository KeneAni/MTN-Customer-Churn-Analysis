The dataset presents comprehensive raw data about the churning behavior of MTN customers in the first quarter of 2025. It shows data regarding four MTN devices: mobile SIM card, 4G router, 5G broadband router and broadband MIFI. The purpose of the analysis was to understand the reasons for churning and provide recommendations which will encourage repeat purchases. 
The data contained 17 fields and 974 records. 
I began by summarizing the data by outlining the following:
1.	The popularity of each of the four MTN devices
2.	The breakdown of the customer base by gender
3.	The number of customers in each state
4.	The overall customer satisfaction rates
5.	The customer satisfaction rates for each of the devices

The findings show that the mobile SIM card leads as the most popular device from MTN Nigeria in Q1 2025 and the recorded customers of the company were nearly equally distributed between males and females. Bauchi, Kogi and Osun states recorded the highest number of customers with 20 customers from each state and the overall satisfaction rates were medium as a majority of the customers rated the MTN devices to be “very good”.

Outlining these parameters presents a concise summary of the data and gives an overall picture of the dataset.

CHURNING ANALYSIS

In order to discover the reasons for customer churning and present reasonable recommendations to curb it, I went through the following analysis questions: 

1.	What is the overall customer churn status in Q1 2025?

The analysis showed that a total of 284 customers had the status of “inactive”, whereas 690 customers still maintained an “active” status. This corresponds to an overall customer churn rate of 29.16% for the first quarter of 2025.

2.	What are the reasons for customer churning?

From the data, all the customers who became inactive within the first quarter of 2025 reported one of the following as their reasons for churning: 
•	High call tariffs
•	Better offers from competitors
•	Poor network
•	Costly data plans
•	Poor customer service
•	Fast data consumption 
•	Relocation

The reasons are arranged in their order of frequency with high call tariffs being the most predominant reason why customers have churned within Q1 2025 and relocation to other areas being the least predominant. 

3.	What is the customer churning status for each of the MTN devices?

In order to determine any other unlikely factors in customer churning behavior, I analyzed to find out the device whose users are most likely to leave the company. The analysis revealed that, of the four devices, the mobile SIM card recorded the highest number of inactive customers, followed by the 4G router, the 5G broadband router and finally the broadband MIFI. 
This implicates that users of the mobile SIM cards are most likely to leave the company while the users of the broadband MIFI are most likely to stay.

4.	What are the factors driving customer churning for each of the MTN devices?

By asking this question, I tried to streamline the seven noted reasons for customer churning by the individual devices in order to determine what factors or reasons the users of a particular device are most influenced or affected by. 
From analyzing the data using functional SQL queries, it was discovered that 
•	The users of the mobile SIM cards were most influenced by high call tariffs and costly data plans and least influenced by poor network and poor customer service 
•	The users of the 4G router are most likely to be swayed by better offers from competitors, poor network and high call tariffs while relocation and fast data consumption rates played an unsignificant role in their decision making. 
•	The users of the 5G broadband router showed identical behavior with those of the 4G router, with poor network, better offers from competitors and high call tariffs being their most influencing factors while relocation and fast data consumption were less impactful to them. 
•	For the users of the broadband MIFI, high call tariffs and better offers from competitors were their most driving factors and poor customer service and relocation were most unlikely to drive churning. 
This analysis provides valuable information and can be guide in making directed and targeted efforts towards users of particular products or devices. 

5.	Which of the driving factors of customer churning are most likely to affect specific age groups of customers?

By evaluating this question, I made an attempt to uncover a relationship between the age range of a customer and his/her likely reason for churning. In order to achieve this, I arranged the customers into three distinct age groups and ran SQL queries to determine what factors each of them is most affected and driven by. 
The evaluation showed that: 
•	Customers aged 16-35 are mostly driven to churn by poor customer service, high call tariffs and better offers from competitors. On the other hand, they are least affected by poor network and relocation. 
•	Customers aged 36-55 are most influenced by poor network, better offers from competitors and high call tariffs. 
•	Customers aged 55 and above are most affected by better offers from competitors and high call tariffs.

RECOMMENDATIONS

1.	In order to generally improve on the rate of customer churning and encourage customer retention and repeat purchases, efforts should be made towards: 
a.	Reviewing the tariffs on calls
b.	Finding out the details and terms of the better offers being made by competitors and matching or exceeding them. 
c.	Improving the quality of network. 
d.	Reviewing the costs of data plans. 
e.	Improving the quality of customer service and engagement. 
2.	Targeted efforts should be made towards restricting churning of the users of mobile SIM cards by reviewed call tariffs, reviewed data plans and improved customer service. 
3.	Targeted efforts should be made towards restricting churning of the users of the 4G router and 5G broadband router by providing better offers than the competition and improving on the quality of network. 
4.	Targeted efforts should be made towards restricting churning of broadband MIFI users by providing better offers than the competition and reviewing the tariffs on calls. 
5.	Better customer service should be prioritized when dealing with young customers, improved network services when dealing with middle aged customers and unmatched benefits when dealing with older customers.
