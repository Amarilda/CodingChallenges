/*SQL Murder Mystery
https://mystery.knightlab.com/

You vaguely remember that the crime was a ​murder​ that occurred sometime on ​Jan.15,2018​ 
and that it took place in ​SQL City​. 
Start by retrieving the corresponding crime scene report from the police department’s database.*/

select description from crime_scene_report 
where city = 'SQL City' 
and type = 'murder' 
and date = '20180115';	

/* Security footage shows that there were 2 witnesses. 
The first witness lives at the last house on "Northwestern Dr". 
The second witness, named Annabel, lives somewhere on "Franklin Ave".*/

--1st
select id, name from person
where address_street_name = 'Northwestern Dr' 
and address_number in 
--max house number  
(select max(address_number) 
from person
where address_street_name = 'Northwestern Dr')
union
--2nd
select id, name from person   
where address_street_name = 'Franklin Ave' and name like '%Annabel%'; 

/* 14887 Morty Schapiro, 16371 Annabel Miller*/

select * from interview
where person_id in ('14887', '16371')

/*I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. 
The membership number on the bag started with "48Z". Only gold members have those bags. 
The man got into a car with a plate that included "H42W".

I saw the murder happen, and I recognized the killer from my gym 
when I was working out last week on January the 9th.*/


select * from get_fit_now_member 
--Only gold members have those bags
where membership_status = 'gold' 
--The membership number on the bag started with "48Z"
and id like '48Z%'
--The man got into a car with a plate that included "H42W"
and person_id in (select id from person
where license_id in 
(SELECT id from drivers_license 
where plate_number like  '%H42W%' and gender = 'male' ))
-- Can be solved without without below
--I recognized the killer from my gym when I was working out last week on January the 9th
and id in (select membership_id from get_fit_now_check_in
where check_in_date = '20180109')

/*
Jeremy Bowers

Congrats, you found the murderer! But wait, there's more... 
If you think you're up for a challenge, 
try querying the interview transcript of the murderer to find the real villain behind this crime. 
If you feel especially confident in your SQL skills, 
try to complete this final step with no more than 2 queries. 
Use this same INSERT statement with your new suspect to check your answer.
*/
              
select * from interview     
where person_id = '67318';

/*
I was hired by a woman with a lot of money. 
I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
She has red hair and she drives a Tesla Model S. 
I know that she attended the SQL Symphony Concert 3 times in December 2017.
*/

select name from person
where license_id in 
(select id from drivers_license
--She's around 5'5" (65") or 5'7" (67")
where gender = 'female' 
and height between 65 and 67
--She drives a Tesla Model S
and car_make = 'Tesla' 
and car_model = 'Model S'
--She has red hair
--All Tesla Model Ss are driven by redheads!!! Redundant
and hair_color = 'red')
--she attended the SQL Symphony Concert 3 times in December 2017
and id in 
(select person_id from facebook_event_checkin
where event_name like '%SQL Symphony Concert%' 
and date >= 20171201 and 20171231 >= date
group by person_id
having count() >= 3)

/*
Congrats, you found the brains behind the murder! 
Everyone in SQL City hails you as the greatest SQL detective of all time. 
Time to break out the champagne!