select count(*) from francis.flickr


drop table if exists flickr_sorted;
CREATE TABLE flickr_sorted
(
    CtyRes integer,
    IntID integer,
    UserID Varchar(100),
    NumCtyPix integer,
    TotNumPix integer,
    RgyrKM float,
    CtyID varchar[],
    NumPixCtyID varchar[],
    CtyID2 varchar[],
    NumPlacPix varchar[],
    EntCtyPix float,
    EntNumPlCty float
    
);
select * from flickr_sorted;

SELECT *
FROM flickr3
WHERE user_id = 12307601@N04 IN
    (     SELECT user_id
          FROM flickr3
          GROUP BY user_id
          HAVING COUNT(*) > 5
    )
ORDER BY user_id
  

select user_id, count(*) from flickr3 group by user_id
limit 10

select count(*) from francis.flickr_sorted_usa2

insert into flickr_distinct_user as (select flickr3.pic_id, flickr3.user_id, flickr3.time, flickr3.longitude, flickr3.latitude, flickr3.country, flickr_distinct_user.ctyres, flickr_distinct_user.numctypix, flickr_distinct_user.totnumpix)

insert into flickr_distinct_user 
as (select flickr3.pic_id, flickr3.user_id, flickr3.time, flickr3.longitude, flickr3.latitude, flickr3.country, flickr_distinct_user.ctyres, flickr_distinct_user.numctypix, flickr_distinct_user.totnumpix 
    from francis.flickr3 as a and francis.flickr_distinct_user as b 
   where a.user_id=b.user)

create table francis.join as
 (select a.pic_id::bigint, a.user_id, a.time, a.longitude, a.latitude, a.country, b.ctyres, b.numctypix, b.totnumpix 
    from francis.flickr3 as a, francis.flickr_sorted_usa2 as b 
    where a.user_id=b.userid)


select * from francis.join
where user_id = '10006374@N03'
order by user_id
limit 10;

select * from francis.join
order by user_id
limit 10;

select time
from francis.join
where time > '2010-08-06 03:18:17.0' and time < '2011-08-06 03:18:17.0'
order by time
limit 100;

select *
from francis.join
where time > '2010-08-06 03:18:17.0' and time < '2011-08-06 03:18:17.0' AND country = '85' or country = '71'
order by time
limit 10;


create table francis.join22 as
 (select * from francis.join as a 
    where a.time > '2010-08-06 03:18:17.0' and a.time < '2011-08-06 03:18:17.0' AND a.country = '85') limit 100;
    
    
select distinct user_id from francis.join2222

create table francis.uk_and_spain as
 (select * from francis.join as a 
    where a.country = '206' or a.country = '187') 
select * from francis.uk_and_spain;

select distinct user_id
 from francis.uk_and_spain

create table francis.uk_before_spain as
 (select * from francis.uk_and_spain as a 
    where a.time > '2007-01-01 00:00:00.0' and a.time < '2009-12-31 23:59:59.0' AND a.country = '206' AND NOT a.country = '187'); 

