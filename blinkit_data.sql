use blinkitdb;
rename table `blinkit grocery data` TO `blinkit_data`;
SELECT *from blinkit_data;
select count(*) from blinkit_data;
UPDATE blinkit_data
SET `Item Fat Content` =
CASE
    WHEN `Item Fat Content` IN ('LF', 'low fat') THEN 'Low Fat'
    WHEN `Item Fat Content` = 'reg' THEN 'Regular'
    ELSE `Item Fat Content`
END;
select distinct(`Item Fat Content`) from blinkit_data;
select sum(`Sales`) as Total_sales from blinkit_data;
select cast(sum(`Sales`)/1000000 as decimal(10,2)) as Total_Sales_million from blinkit_data ;
 select cast(avg(`Sales`) as decimal(10,0)) as AVG_SALES from blinkit_data;
 SELECT COUNT(*) AS NO_OF_ITEMS FROM BLINKIT_DATA;
select count(`Sales`) from blinkit_data where `Item Fat Content`='Low Fat';
SELECT* FROM BLINKIT_DATA;
SELECT cast(AVG(`Rating`) as decimal(10,2)) as average_rating from blinkit_data;
#granular requirement
select `Item Fat Content`,
cast(sum(`Sales`)/1000 as decimal(10,2)) AS `Total sales in thousands`,
cast(avg(`Sales`) as decimal(10,2)) AS `Avg sales`,
cast(avg(`Rating`) as decimal(10,1)) as `Avg rating`,
count(`Sales`) as `no_of_items`,
CONCAT(ROUND(SUM(`Sales`)/1000,2),' K') AS TOTAL_SALES
from blinkit_data 
group by `Item Fat Content` 
order by `Item Fat Content` ASC ;

select `Item Type`,
cast(sum(`Sales`) as decimal(10,2)) as `Total sales`,
cast(avg(`Sales`) as decimal(10,2)) AS `Avg sales`,
cast(avg(`Rating`) as decimal(10,1)) as `Avg rating`,
count(`Sales`) as `no_of_items`
from blinkit_data 
group by `Item Type` 
order by `Total sales` desc LIMIT 5;

select `Outlet Location Type`,`Item Fat Content`,SUM(`Sales`) 
from blinkit_data
group by `Outlet Location Type`,`Item Fat Content`
order by `Outlet Location Type` asc  ;

SELECT 
`Outlet Location Type`,
ROUND(SUM(CASE WHEN `Item Fat Content` = 'Low Fat' THEN `Sales` ELSE 0 END), 2) AS Low_Fat,
ROUND(SUM(CASE WHEN `Item Fat Content` = 'Regular' THEN `Sales` ELSE 0 END), 2) AS Regular
FROM blinkit_data
GROUP BY `Outlet Location Type`
ORDER BY `Outlet Location Type`;

select `Outlet Establishment Year`,
cast(sum(`Sales`) as decimal(10,2)) as Total_sales
from blinkit_data group by `Outlet Establishment Year` 
order by `Outlet Establishment Year` ASC;

SELECT `Outlet Size`,cast(sum(`Sales`) as decimal(10,2)) as Total_Sales,
cast((sum(`Sales`)*100 /sum(sum(`Sales`)) over()) as decimal(10,2))as Sales_Percentage
from blinkit_data
group by`Outlet Size`
order by Sales_Percentage desc;

select `Outlet Location Type`,cast(sum(`Sales`) as decimal(10,0)) as Total_sales
from blinkit_data 
group by `Outlet Location Type` 
order by `Outlet Location Type` ;

select `Outlet Type`,cast(sum(`Sales`) as decimal(10,0)) as Total_sales
from blinkit_data 
group by `Outlet Type` 
order by `Outlet Type` ;














