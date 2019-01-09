use testyuhao;
CREATE TABLE Bike (

    tripDuration int NOT NULL,
    startTime datetime,
    stopTime datetime,
    startStationId int NOT NULL,
    startStationName varchar(255) NOT NULL,
    startStationLatitude float NOT NULL,
    startStationLongitude float NOT NULL,
    endStationId int NOT NULL,
    endStationName varchar(255) NOT NULL,
    endStationLatitude float NOT NULL,
    endStationLongitude float NOT NULL,
    bikeid int NOT NULL,
    userType varchar(255) NOT NULL,
    birthYear int,
    gender int NOT NULL

);
#按天分的总用量
#select date_format(startTime,'%d') as datedata, count(date_format(startTime,'%d')) from Bike_Test where startTime>"开始时间" and startTime<="结束时间" group by datedata;
select date_format(startTime,'%d') as datedata, count(date_format(startTime,'%d')) from Bike_Test where startTime>"2013-06-01" and startTime<="2013-06-02" group by datedata;
#按周几分的总用量
#select date_format(startTime,'%W') as datedata, count(date_format(startTime,'%W')) from Bike_Test where startTime>"开始时间" and startTime<="结束时间" group by datedata;
select date_format(startTime,'%W') as datedata, count(date_format(startTime,'%W')) from Bike_Test where startTime>"2013-06-01" and startTime<="2013-06-02" group by datedata;
#按小时的总用量
#select date_format(startTime,'%H') as datedata, count(date_format(startTime,'%H')) from Bike_Test where startTime>"开始时间" and startTime<="结束时间" group by datedata;
select date_format(startTime,'%H') as datedata, count(date_format(startTime,'%H')) from Bike_Test where startTime>"2013-06-01" and startTime<="2013-06-02" group by datedata;

/*
select count(tripDuration),'0~10' as 'duration' from Bike_Test where tripDuration>0 and tripDuration<=600 and startTime>"开始时间" and startTime<="结束时间"
      union select count(tripDuration),'10~20' as 'duration' from Bike_Test where tripDuration>600 and tripDuration<=1200 and startTime>"开始时间" and startTime<="结束时间"
      union select count(tripDuration),'20~30' as 'duration' from Bike_Test where tripDuration>1200 and tripDuration<=1800 and startTime>"开始时间" and startTime<="结束时间"
      union select count(tripDuration),'30~40' as 'duration' from Bike_Test where tripDuration>1800 and tripDuration<=2400 and startTime>"开始时间" and startTime<="结束时间"
      union select count(tripDuration),'40~50' as 'duration' from Bike_Test where tripDuration>2400 and tripDuration<=3000 and startTime>"开始时间" and startTime<="结束时间"
      union select count(tripDuration),'50~60' as 'duration' from Bike_Test where tripDuration>3000 and tripDuration<=3600 and startTime>"开始时间" and startTime<="结束时间"
        union select count(tripDuration),'>60' as 'duration' from Bike_Test where tripDuration>3600 and startTime>"开始时间" and startTime<="结束时间";
*/    
select count(tripDuration),'0~10' as 'duration' from Bike_Test where tripDuration>0 and tripDuration<=600 and startTime>"2013-06-01" and startTime<="2013-06-02"
      union select count(tripDuration),'10~20' as 'duration' from Bike_Test where tripDuration>600 and tripDuration<=1200 and startTime>"2013-06-01" and startTime<="2013-06-02"
      union select count(tripDuration),'20~30' as 'duration' from Bike_Test where tripDuration>1200 and tripDuration<=1800 and startTime>"2013-06-01" and startTime<="2013-06-02"
      union select count(tripDuration),'30~40' as 'duration' from Bike_Test where tripDuration>1800 and tripDuration<=2400 and startTime>"2013-06-01" and startTime<="2013-06-02"
      union select count(tripDuration),'40~50' as 'duration' from Bike_Test where tripDuration>2400 and tripDuration<=3000 and startTime>"2013-06-01" and startTime<="2013-06-02"
      union select count(tripDuration),'50~60' as 'duration' from Bike_Test where tripDuration>3000 and tripDuration<=3600 and startTime>"2013-06-01" and startTime<="2013-06-02"
      union select count(tripDuration),'>60' as 'duration' from Bike_Test where tripDuration>3600 and startTime>"2013-06-01" and startTime<="2013-06-02";

/*
select sum(tripDuration), count(userType),'12~21' as 'age' from Bike_Test where birthYear > (2017 - 21) and birthYear <= (2017 - 12) and startTime>"开始时间" and startTime<="结束时间"
      union select sum(tripDuration), count(userType),'21~35' as 'age' from Bike_Test where birthYear > (2017 - 35) and birthYear <= (2017 - 21) and startTime>"开始时间" and startTime<="结束时间"
      union select sum(tripDuration), count(userType),'35~55' as 'age' from Bike_Test where birthYear > (2017 - 55) and birthYear <= (2017 - 35) and startTime>"开始时间" and startTime<="结束时间"
      union select sum(tripDuration), count(userType),'55~75' as 'age' from Bike_Test where birthYear > (2017 - 75) and birthYear <= (2017 - 55) and startTime>"开始时间" and startTime<="结束时间"
      union select sum(tripDuration), count(userType),'>75' as 'age' from Bike_Test where birthYear > (2017 - 75) and birthYear!=0 and startTime>"开始时间" and startTime<="结束时间";
*/
select sum(tripDuration), count(userType),'12~21' as 'age' from Bike_Test where birthYear > (2017 - 21) and birthYear <= (2017 - 12) and startTime>"2013-06-01" and startTime<="2013-06-02"
      union select sum(tripDuration), count(userType),'21~35' as 'age' from Bike_Test where birthYear > (2017 - 35) and birthYear <= (2017 - 21) and startTime>"2013-06-01" and startTime<="2013-06-02"
      union select sum(tripDuration), count(userType),'35~55' as 'age' from Bike_Test where birthYear > (2017 - 55) and birthYear <= (2017 - 35) and startTime>"2013-06-01" and startTime<="2013-06-02"
      union select sum(tripDuration), count(userType),'55~75' as 'age' from Bike_Test where birthYear > (2017 - 75) and birthYear <= (2017 - 55) and startTime>"2013-06-01" and startTime<="2013-06-02"
      union select sum(tripDuration), count(userType),'>75' as 'age' from Bike_Test where birthYear > (2017 - 75) and birthYear!=0 and startTime>"2013-06-01" and startTime<="2013-06-02";

#select gender,sum(tripDuration) from Bike_Test where gender!=0 and startTime>"开始时间" and startTime<="结束时间" group by gender;
select gender,sum(tripDuration) from Bike_Test where gender!=0 and startTime>"2013-06-01" and startTime<="2013-06-02" group by gender;
#按照用户类型分
#select userType,sum(tripDuration) from Bike_Test where startTime>"开始时间" and startTime<="结束时间" group by userType;
select userType,sum(tripDuration) from Bike_Test where startTime>"2013-06-01" and startTime<="2013-06-02" group by userType;
##热门站点
#select startStationName,count(startStationName) as Mostpopular from Bike_Test where startTime>"开始时间" and startTime<="结束时间" group by startStationName ORDER BY count(startStationName) DESC limit 10;
select startStationName,count(startStationName) as Mostpopular from Bike_Test where startTime>"2013-06-01" and startTime<="2013-06-02" group by startStationName ORDER BY count(startStationName) DESC limit 10;
##热门路径
#select startStationId,endStationId,count(tripDuration) as routeusage from Bike_Test where startStationId!=endStationId and startTime>"开始时间" and startTime<="结束时间" group by startStationId,endStationId order by count(TripDuration) DESC limit 10;
select startStationId,endStationId,count(tripDuration) as routeusage from Bike_Test where startStationId!=endStationId and startTime>"2013-06-01" and startTime<="2013-06-02" group by startStationId,endStationId order by count(TripDuration) DESC limit 10;
-- data preprocessing
UPDATE Bike SET birthYear = 0 WHERE birthYear IS NULL; ---将birthyear Null替换为0
UPDATE Bike SET birthYear = 0 WHERE birthYear="NULL"; ---将birthyear Null替换为0
UPDATE Bike SET startTime = str_to_date(startTime, '"%Y-%m-%d %H:%i:%s"');  ---替换string为datetime格式
DELETE FROM Bike WHERE startStationId = endStationId AND tripDuration < 120;  ---去除出发和到达站点相同，且行驶时间小于两分钟的行程
CREATE INDEX startTimeidx ON Bike(startTime);
CREATE INDEX stopTimeidx ON Bike(stopTime);

-----------------------------------------------------------------------PAGE2热力图总图 API1
--输入：时间，如2017-06-01 10:00:00需转换为   2017-06-01 10:00:00 <= startTime <= 2017-06-01 10：59：59
--输出：

select startStationName as stationName, startStationId as stationId, startStationLatitude as stationLatitude, startStationLongitude as stationLongitude,
         borrowAmount, returnAmount
from (SELECT startStationName, startStationId, startStationLatitude,
         startStationLongitude, COUNT(startStationName) AS borrowAmount
            FROM Bike
            WHERE startTime <= "2017-03-01 10:59:59" and startTime >= "2017-03-01 10:00:00"
            GROUP BY startStationName) as t1
left outer join (SELECT endStationName, endStationId, endStationLatitude, endStationLongitude,
               COUNT(endStationName) AS returnAmount
                  FROM Bike
                  WHERE startTime <= "2017-03-01 10:59:59" and startTime >= "2017-03-01 10:00:00"
                  GROUP BY endStationName) as t2
on t1.startStationId = t2.endStationId 
union
select endStationName as stationName, endStationId as stationId, endStationLatitude as stationLatitude, endStationLongitude as stationLongitude,
         borrowAmount, returnAmount
from (SELECT startStationName, startStationId, startStationLatitude,
         startStationLongitude, COUNT(startStationName) AS borrowAmount
            FROM Bike
            WHERE startTime <= "2017-03-01 10:59:59" and startTime >= "2017-03-01 10:00:00"
            GROUP BY startStationName) as t3
right outer join (SELECT endStationName, endStationId, endStationLatitude, endStationLongitude,
               COUNT(endStationName) AS returnAmount
                  FROM Bike
                  WHERE startTime <= "2017-03-01 10:59:59" and startTime >= "2017-03-01 10:00:00"
                  GROUP BY endStationName) as t4
on t3.startStationId = t4.endStationId 
order by borrowAmount desc, returnAmount desc;





----------------------------------------------------------------------------------- PAGE2热力图某站点数据  API2
--输入为时间，站点id
--输出为两个数[a,b]，其中a为借车量，b为还车量
select count(*) AS count from Bike 
where startTime <= "2017-03-01 10:59:59" and startTime >= "2017-03-01 10:00:00" and startStationId = 72
union
select count(*) as count from Bike 
where startTime <= "2017-03-01 10:59:59" and startTime >= "2017-03-01 10:00:00" and endStationId = 72;
----------------------------------------------------------------------------------- PAGE2热力图某站点天气数据  API3
--天气，输入为时间2013-06-01 01:00:00整点，站点Id
--输出为天气总览，温度，风速
SELECT summary, temperature, windspeed FROM Weather WHERE date = "2017-06-01 08:00:00";

--------------------------------------------------------------------------------------PAGE4 小时站点使用情况  API4
--输入：时间，如2017-06-01 10:00:00需转换为   2017-06-01 10:00:00 <= startTime <= 2017-06-01 10：59：59
--输出：

select startStationName as stationName, startStationId as stationId, startStationLatitude as stationLatitude, startStationLongitude as stationLongitude,
         borrowAmount, returnAmount
from (SELECT startStationName, startStationId, startStationLatitude,
         startStationLongitude, COUNT(startStationName) AS borrowAmount
            FROM Bike
            WHERE startTime <= "2017-03-01 10:59:59" and startTime >= "2017-03-01 10:00:00"
            GROUP BY startStationName) as t1
left outer join (SELECT endStationName, endStationId, endStationLatitude, endStationLongitude,
               COUNT(endStationName) AS returnAmount
                  FROM Bike
                  WHERE startTime <= "2017-03-01 10:59:59" and startTime >= "2017-03-01 10:00:00"
                  GROUP BY endStationName) as t2
on t1.startStationId = t2.endStationId 
union
select endStationName as stationName, endStationId as stationId, endStationLatitude as stationLatitude, endStationLongitude as stationLongitude,
         borrowAmount, returnAmount
from (SELECT startStationName, startStationId, startStationLatitude,
         startStationLongitude, COUNT(startStationName) AS borrowAmount
            FROM Bike
            WHERE startTime <= "2017-03-01 10:59:59" and startTime >= "2017-03-01 10:00:00"
            GROUP BY startStationName) as t3
right outer join (SELECT endStationName, endStationId, endStationLatitude, endStationLongitude,
               COUNT(endStationName) AS returnAmount
                  FROM Bike
                  WHERE startTime <= "2017-03-01 10:59:59" and startTime >= "2017-03-01 10:00:00"
                  GROUP BY endStationName) as t4
on t3.startStationId = t4.endStationId 
order by borrowAmount desc, returnAmount desc;

--- 输入：时间，站点id
---   输出2： 两张表： 表1 startStationName, endStationName，rankreturn
---                           表2 endStationName, startStationName， rankborrow
---               需合成为stationName, endStationName(表一的), rankereturn, startStationName(表二的), rankborrow
---               目的是为了得到以某站点借车点，还车站点的车数量的排序，以及以某站点为还车点，借车站点的车的数量的排序
----------------------------------------------------------------------------------------------------------------API5
SELECT endStationName, COUNT(*) AS rankreturn
FROM Bike
WHERE startTime <= "2017-06-01 10:59:59" and startTime >= "2017-06-01 10:00:00" and startStationId = 123
GROUP BY endStationName
ORDER BY rankreturn desc;

----------------------------------------------------------------------------------------------------------------API6
SELECT startStationName, COUNT(*) AS rankborrow
FROM Bike
WHERE startTime <= "2017-03-01 10:59:59" and startTime >= "2017-03-01 10:00:00" and endStationId = 72
GROUP BY startStationName
ORDER BY rankborrow desc;


----------------------------------------------------------------------------------------------------------------



