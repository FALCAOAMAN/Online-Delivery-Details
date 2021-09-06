use Hackathon;

select * from OnlineOrders;
select * from OnlineOrders where rating not in ('NEW','Opening Soon','Temporarily Closed') and Restaurant like '%ID_2882%' ;

--Average Time to deliver a particular food
create view avg_time as 
select distinct Cuisines ,avg(delivery_time) as avg_delivery_time ,avg(Average_cost) as avg_cost from OnlineOrders
where rating not in ('NEW','Opening Soon','Temporarily Closed') 
group by cuisines 
--order by 2 desc,3 desc;

--Differnt Cuisines delivered and average time from a particular restaurant
create view same_location as
select  restaurant ,cuisines,avg(delivery_time) as avg_delivery_time from OnlineOrders
 where rating not in ('NEW','Opening Soon','Temporarily Closed')
group by restaurant,Cuisines
--order by 1,3 desc;

--Highest Rating to a restaurant at a particular location and a particular cuisine
create view highest_rating as
select restaurant,location,Cuisines,delivery_time,rating from (
select restaurant,location,cuisines,delivery_time ,rating,DENSE_RANK() 
over(partition by restaurant order by rating desc) as rnk from OnlineOrders 
where rating not in ('NEW','Opening Soon','Temporarily Closed') ) a 
where a.rnk =1 
--order by 5 desc;







