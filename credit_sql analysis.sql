SELECT * FROM credit_card_approval.cleaned_data;

/*Group the customers based on their income type and find the average of their annual income.*/

select Type_Income, Avg(Annual_income) from cleaned_data
group by Type_Income;

/*Find the female owners of cars and property.*/

select Ind_ID, Gender ,Car_Owner from cleaned_data
where Gender = 'F' and Car_Owner = 'Y';

select Ind_ID, Gender ,Propert_Owner from cleaned_data
where Gender = 'F' and Propert_Owner = 'Y';

select Ind_ID, Gender, Car_Owner, Propert_Owner from cleaned_data
where gender = 'F' and Car_Owner = 'Y' and Propert_Owner = 'Y';

/*Find the male customers who are staying with their families.*/

select Ind_ID, Gender, Housing_type from cleaned_data
where Gender = 'M' and Housing_type = 'With parents';

/*Please list the top five people having the highest income.*/

select Ind_Id, Annual_income from cleaned_data 
order by  Annual_income desc limit 5;
 
 /*How many married people are having bad credit?*/
 
 select Ind_ID, Marital_Status, label from cleaned_data
 where Marital_status = 'Married' and label = '0';
 
 /*What is the highest education level and what is the total count?*/
 
 with  edu_level as(select Ind_ID,
 case when Education = 'Lower secondary' Then 'Primary'
 when Education = 'Secondary / secondary special' Then 'Secondary'
 when Education = 'Incomplete higher' Then 'Upper_Secondary'
 when Education = 'Higher education' Then 'Upper_Intermediate'
 Else 'Higher education'
 End as Education_level
  from cleaned_data)
select count(Education_level) from edu_level
 where Education_level = 'Higher Education';
 
 /*Between married males and females, who is having more bad credit? */
 
 SELECT Gender, COUNT(*) AS bad_credit_count
FROM cleaned_data
WHERE Marital_status = 'Married' AND label = 0
GROUP BY Gender;

