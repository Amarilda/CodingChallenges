
/* 175. Combine Two Tables
Write a SQL query for a report that provides the following information for each person in the Person table, 
regardless if there is an address for each of those people:*/

select FirstName, LastName, City, State
from Address
right join Person
on Person.PersonId = Address.PersonId

/*181. Employees Earning More Than Their Managers

Given the Employee table, 
write a SQL query that finds out employees who earn more than their managers. 
For the above table, Joe is the only employee who earns more than his manager.*/

select EM.Name as Employee
from Employee EM
left join Employee MBA
on EM.ManagerId = MBA.Id
where EM.Salary > MBA.Salary

/* 182. Duplicate Emails
Write a SQL query to find all duplicate emails in a table named Person.*/

select email
from Person
group by email
having count(*)>1
-- having count(email)>1 works as well

/* 183. Customers Who Never Order

Suppose that a website contains two tables, the Customers table and the Orders table. 
Write a SQL query to find all customers who never order anything. */

select Name as "Customers"
from Customers
where Customers.id not in (select CustomerId from Orders)


/*595. Big Countries

A country is big 
		if it has an area of bigger than 3 million square km 
		or a population of more than 25 million.
Write a SQL solution to output big countries' name, population and area.*/

select name, population, area
from World
where population >25000000 or area >3000000;

/* 620. Not Boring Movies

X city opened a new cinema, many people would like to go to this cinema. 
The cinema also gives out a poster indicating the movies’ ratings and descriptions.
Please write a SQL query to output movies with an odd numbered ID and a description that is not 'boring'. 
Order the result by rating. */

select *
from cinema
where id%2 = 1
and NOT description = 'boring'
order by rating desc




