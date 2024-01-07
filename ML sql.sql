/* 1) ---Find the number of corona patients who faced shortness of breath.*/
select count(*)as totalpatients
from corona
where Shortness_of_breath ='True' and corona = 'positive';

/* 2)--Find the number of negative corona patients who have fever and sore_throat. */
select count(*)as totalpatients
from corona
where corona = 'negative' and fever = 'true' and sore_throat = 'true';

/* 3)--Group the data by month and rank the number of positive cases.*/
UPDATE corona
SET test_date = DATE_FORMAT(STR_TO_DATE(test_date, '%d-%m-%Y'), '%Y-%m-%d')
where ind_id > 0;

select monthname(test_date)as months ,count(*) as positivecase,dense_rank() over( order by count(*) desc )as rnk
from corona
where corona = 'positive'
group by months;

/* 4)--Find the female negative corona patients who faced cough and headache.*/
select count(*)as totalfemale
from corona
where sex ='female' and corona = 'negative' and cough_symptoms = 'true' and headache = 'true';

/* 5)--How many elderly corona patients have faced breathing problems?*/
select count(*)as totalelder
from corona
where sex = 'none' and Shortness_of_breath = 'true' and corona = 'positive';

/* 6)--Which three symptoms were more common among COVID positive patients?*/
with ctecough as(

select count(*)as totalcough
from corona
where corona='positive' and cough_symptoms='true'),

ctefever as(
select count(*)as totalfever
from corona
where corona='positive' and fever='true'),

ctesore as(
select count(*)as totalsore
from corona
where corona='positive' and sore_throat='true'),

ctebreath as(
select count(*)as totalbreath
from corona
where corona='positive' and shortness_of_breath='true'),

cteheadache as(
select count(*)as totalheadache
from corona
where corona='positive' and headache='true'
)

select * from ctecough,ctefever,ctesore,ctebreath,cteheadache;

/* 7)-- Which symptom was less common among COVID negative people?*/
with ctecough as(

select count(*)as totalcough
from corona
where corona='positive' and cough_symptoms='true'),

ctefever as(
select count(*)as totalfever
from corona
where corona='positive' and fever='true'),

ctesore as(
select count(*)as totalsore
from corona
where corona='positive' and sore_throat='true'),

ctebreath as(
select count(*)as totalbreath
from corona
where corona='positive' and shortness_of_breath='true'),

cteheadache as(
select count(*)as totalheadache
from corona
where corona='positive' and headache='true'
)

select * from ctecough,ctefever,ctesore,ctebreath,cteheadache;

/* 8)--What are the most common symptoms among COVID positive males whose known contact was abroad? */
with ctecough as(

select count(*)as totalcough
from corona
where corona='positive' and cough_symptoms='true' and sex='male' and known_contact='abroad' ),

ctefever as(
select count(*)as totalfever
from corona
where corona='positive' and fever='true' and sex='male' and known_contact='abroad'),

ctesore as(
select count(*)as totalsore
from corona
where corona='positive' and sore_throat='true' and sex='male' and known_contact='abroad'),

ctebreath as(
select count(*)as totalbreath
from corona
where corona='positive' and shortness_of_breath='true' and sex='male' and known_contact='abroad'),

cteheadache as(
select count(*)as totalheadache
from corona
where corona='positive' and headache='true' and sex='male' and known_contact='abroad'
)

select * from ctecough,ctefever,ctesore,ctebreath,cteheadache;









