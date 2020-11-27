-- Selecting the database Assignment
use assignment;

-- Creating table bajaj1 containing the date, close price, 20dayMA and 50dayMA with Date as Primary Key

create table bajaj1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`,`close price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20dayMA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50dayMA`
FROM assignment.`bajaj`;

-- Creating table eicher1 containing the date, close price, 20dayMA and 50dayMA with Date as Primary Key

create table eicher1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20dayMA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50dayMA`
FROM Assignment.`eicher`;

-- Creating table hero1 containing the date, close price, 20dayMA and 50dayMA with Date as Primary Key

create table hero1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20dayMA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50dayMA`
FROM Assignment.`hero`;

-- Creating table infosys1 containing the date, close price, 20dayMA and 50dayMA with Date as Primary Key

create table infosys1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20dayMA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50dayMA`
FROM Assignment.`infosys`;

-- Creating table tcs1 containing the date, close price, 20dayMA and 50dayMA with Date as Primary Key

create table tcs1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20dayMA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50dayMA`
FROM Assignment.`tcs`;

-- Creating table tvs1 containing the date, close price, 20dayMA and 50dayMA with Date as Primary Key

create table tvs1(CONSTRAINT PK_date PRIMARY KEY (date))
as
SELECT str_to_date(date,"%d-%M-%Y") as `Date`, `close price`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 19 preceding and current row) as `20dayMA`,
avg(`close price`) over (order by str_to_date(date,"%d-%M-%Y") rows between 49 preceding and current row) as `50dayMA`
FROM Assignment.`tvs`;

-- Creating master_table containing the date and close price of all the six stocks

create table master_table as 
select b.date as `Date`, 
b.`Close Price` as `Bajaj`, 
tc.`Close Price` as `TCS`,
tv.`Close Price` as `TVS`,
i.`Close Price` as `Infosys`,
e.`Close Price` as `Eicher`,
h.`Close Price` as `Hero`
from bajaj1 b 
inner join tcs1 tc on tc.date = b.date
inner join tvs1 tv on tv.date = tc.date
inner join infosys1 i on i.date = tv.date
inner join eicher1 e on e.date = i.date
inner join hero1 h on h.date = e.date;

-- creating bajaj2 to generate buy and sell signal in column Signal

create table bajaj2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20dayMA` > `50dayMA` AND LAG(`20dayMA`) over() < LAG(`50dayMA`) over() THEN 'BUY'
		WHEN `20dayMA` < `50dayMA` AND LAG(`20dayMA`) over() > LAG(`50dayMA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM Assignment.bajaj1;

-- creating eicher2 to generate buy and sell signal in column Signal

create table eicher2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20dayMA` > `50dayMA` AND LAG(`20dayMA`) over() < LAG(`50dayMA`) over() THEN 'BUY'
		WHEN `20dayMA` < `50dayMA` AND LAG(`20dayMA`) over() > LAG(`50dayMA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM Assignment.eicher1;

-- creating hero2 to generate buy and sell signal in column Signal

create table hero2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20dayMA` > `50dayMA` AND LAG(`20dayMA`) over() < LAG(`50dayMA`) over() THEN 'BUY'
		WHEN `20dayMA` < `50dayMA` AND LAG(`20dayMA`) over() > LAG(`50dayMA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM Assignment.hero1;

-- creating infosys2 to generate buy and sell signal in column Signal

create table infosys2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20dayMA` > `50dayMA` AND LAG(`20dayMA`) over() < LAG(`50dayMA`) over() THEN 'BUY'
		WHEN `20dayMA` < `50dayMA` AND LAG(`20dayMA`) over() > LAG(`50dayMA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM Assignment.infosys1;

-- creating tcs2 to generate buy and sell signal in column Signal

create table tcs2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20dayMA` > `50dayMA` AND LAG(`20dayMA`) over() < LAG(`50dayMA`) over() THEN 'BUY'
		WHEN `20dayMA` < `50dayMA` AND LAG(`20dayMA`) over() > LAG(`50dayMA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM Assignment.tcs1;

-- creating tvs2 to generate buy and sell signal in column Signal

create table tvs2 as 
SELECT `Date`, `Close Price`,
case 
        WHEN `20dayMA` > `50dayMA` AND LAG(`20dayMA`) over() < LAG(`50dayMA`) over() THEN 'BUY'
		WHEN `20dayMA` < `50dayMA` AND LAG(`20dayMA`) over() > LAG(`50dayMA`) over() THEN 'SELL'
		ELSE 'HOLD' 
end as `Signal`
FROM Assignment.tvs1;

-- Creating a User defined function that takes the date as input 
-- and returns the signal for that particular day (Buy/Sell/Hold) for the Bajaj stock


delimiter $$
create function myfunc ( dt varchar(10) )
returns varchar(4)
deterministic
begin
declare r varchar(4);
select `Signal` into r from bajaj2 where date=STR_TO_DATE(dt, "%Y-%m-%d");
return r;
end$$ 
delimiter ;

-- using function for particular dates

select myfunc('2015-08-24');
select myfunc('2015-10-19');
select myfuct('2015-12-11');