var mysql = require('mysql');
var config = require('./config.json');
var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
  });
exports.handler =  (event, context, callback) => {
  //prevent timeout from waiting event loop
  context.callbackWaitsForEmptyEventLoop = false;
  
  let num_of_query = event.select_num_of_rows;
  let min_num_query = event.min_num_row;
  let max_num_query = event.max_num_row;
  let stationinfo = event.stationinfo;
  let divide_by = event.divide_by;
  let startDate = event.startDate;
  let endDate = event.endDate;
  let type = event.type;
  let timeline = event.timeline;
  let startStationId = event.startStationId;
  let endStationId = event.endStationId;

  var query;
  
  if(num_of_query != null) {
    
    query = 'SELECT * from Bike LIMIT ' + num_of_query;
    
  } else if(min_num_query != null && max_num_query != null) {
    
    var mid_num_query = Math.floor((parseInt(min_num_query) + parseInt(max_num_query))/2);
  
    query = 'SELECT * from Bike LIMIT ' + mid_num_query;
    
  } else if(stationinfo != null) {
    
    query = 'SELECT * FROM station_location';
    
  } else if(divide_by != null) {
    
    if(divide_by == 'day') {
      
      query = "select date_format(startTime,'%Y-%m-%d') as datedata, count(date_format(startTime,'%Y-%m-%d')) as count from Bike group by datedata";
      
    } else if(divide_by == 'week') {
      
      query = "select date_format(startTime,'%W') as datedata, count(date_format(startTime,'%W')) from Bike group by datedata";
      
    } else if(divide_by == 'hour') {
      
      query = "select date_format(startTime,'%H') as datedata, count(date_format(startTime,'%H')) from Bike group by datedata";

      
    }
    
  } else if(startDate != null && endDate != null && type == 'time') {
    
      query = "select count(tripDuration) as countTripDuration,'0~10' as 'duration' from Bike where tripDuration>0 and tripDuration<=600 and startTime > ";
      query = query + "'" + startDate + "'";
      query = query + " and startTime <= " + "'" + endDate + "'";
      query = query + " union select count(tripDuration),'10~20' as 'duration' from Bike where tripDuration>600 and tripDuration<=1200 and startTime > ";
      query = query + "'" + startDate + "'";
      query = query + " and startTime <= " + "'" + endDate + "'";
      query = query + " union select count(tripDuration),'20~30' as 'duration' from Bike where tripDuration>1200 and tripDuration<=1800 and startTime >";
      query = query + "'" + startDate + "'";
      query = query + " and startTime <= " + "'" + endDate + "'";
      query = query + " union select count(tripDuration),'30~40' as 'duration' from Bike where tripDuration>1800 and tripDuration<=2400 and startTime >";
      query = query + "'" + startDate + "'";
      query = query + " and startTime <= " + "'" + endDate + "'";
      query = query + " union select count(tripDuration),'40~50' as 'duration' from Bike where tripDuration>2400 and tripDuration<=3000 and startTime >";
      query = query + "'" + startDate + "'";
      query = query + " and startTime <= " + "'" + endDate + "'";
      query = query + " union select count(tripDuration),'50~60' as 'duration' from Bike where tripDuration>3000 and tripDuration<=3600 and startTime > ";
      query = query + "'" + startDate + "'";
      query = query + " and startTime <= " + "'" + endDate + "'";
      query = query + " union select count(tripDuration),'>60' as 'duration' from Bike where tripDuration>3600 and startTime >";
      query = query + "'" + startDate + "'";
      query = query + " and startTime <= " + "'" + endDate + "'";
    
      console.log(query);
      
  } else if(startDate != null && endDate != null && type == 'age') {
    
      query = "select sum(tripDuration) as countTripD, count(userType) as countUTP,'12~21' as 'age' from Bike where birthYear > (2017 - 21) and birthYear <= (2017 - 12) and startTime>";
      query = query + "'" + startDate + "'";
      query = query + " and startTime <= " + "'" + endDate + "'";
      query = query + " union select sum(tripDuration), count(userType),'21~35' as 'age' from Bike where birthYear > (2017 - 35) and birthYear <= (2017 - 21) and startTime> ";
      query = query + "'" + startDate + "'";
      query = query + " and startTime <= " + "'" + endDate + "'";
      
      query = query + " union select sum(tripDuration), count(userType),'35~55' as 'age' from Bike where birthYear > (2017 - 55) and birthYear <= (2017 - 35) and startTime> ";
      query = query + "'" + startDate + "'";
      query = query + " and startTime <= " + "'" + endDate + "'";
      
      query = query + " union select sum(tripDuration), count(userType),'55~75' as 'age' from Bike where birthYear > (2017 - 75) and birthYear <= (2017 - 55) and startTime> ";
      query = query + "'" + startDate + "'";
      query = query + " and startTime <= " + "'" + endDate + "'";
      
      query = query + " union select sum(tripDuration), count(userType),'>75' as 'age' from Bike where birthYear > (2017 - 75) and birthYear!=0 and startTime> ";
      query = query + "'" + startDate + "'";
      query = query + " and startTime <= " + "'" + endDate + "'";
     
    
    
  } else if(startDate != null && endDate != null && type == 'gender') {
    
    query = "select gender,sum(tripDuration) as sumtrip from Bike where gender!=0 and startTime> " + "'" + startDate + "'" + " and startTime<=" + "'" + endDate + "'" + "group by gender";

  } else if(startDate != null && endDate != null && type == 'usertype') {
    
    query = "select userType,sum(tripDuration) as sumtrip from Bike where startTime > " + "'" + startDate + "'" + " and startTime <= " + "'" + endDate + "'" + "group by userType";

  } else if(startDate != null && endDate != null && type == 'hotstation') {
    
    query = "select startStationName,count(startStationName) as Mostpopular from Bike where startTime>" + "'" + startDate + "'" + " and startTime <= " +"'" + endDate + "'" + "group by startStationName ORDER BY count(startStationName) DESC limit 10";

  } else if(startDate != null && endDate != null && type == 'hotpath') {
    
    query = "select startStationId,endStationId,count(tripDuration) as routeusage from Bike where startStationId!=endStationId and startTime> " + "'" + startDate + "'" + " and startTime<= " +  "'" + endDate + "'" + "group by startStationId,endStationId order by count(TripDuration) DESC limit 10";

    console.log(query);


  } else if( type == 'kmeans') {
    
    query = "select distinct(startStationId),startStationName,startStationLatitude,startStationLongitude,stationType from Bike join station_hour_trips on Bike.startStationId=station_hour_trips.stationId";
    
    
    
  } else if( timeline  != null) {
    
    query = "SELECT summary, temperature, windspeed FROM Weather WHERE date = " + "'" + timeline + "'";
    console.log(query);

  } else if(startDate != null && endDate != null && type == "in_out") {
    
    query = "select startStationName as stationName, startStationId as stationId, startStationLatitude as stationLatitude, startStationLongitude as stationLongitude, "
    query = query + " borrowAmount, returnAmount from (SELECT startStationName, startStationId, startStationLatitude, startStationLongitude, COUNT(startStationName) AS borrowAmount FROM Bike"
    query = query + " WHERE startTime <=" + "'" + endDate + "'"  + "and startTime >= " + "'" + startDate + "'";
    query = query + " GROUP BY startStationName) as t1 ";
    query = query + " left outer join (SELECT endStationName, endStationId, endStationLatitude, endStationLongitude,";
    query = query + " COUNT(endStationName) AS returnAmount ";
    query = query + " FROM Bike";
    query = query + " WHERE startTime <= " + "'" + endDate + "'" + "and startTime >= " + "'" + startDate + "'";
    query = query + " GROUP BY endStationName) as t2 ";
    query = query + " on t1.startStationId = t2.endStationId ";
    query = query + " union select endStationName as stationName, endStationId as stationId, endStationLatitude as stationLatitude, endStationLongitude as stationLongitude,borrowAmount, returnAmount ";
    query = query + " from (SELECT startStationName, startStationId, startStationLatitude, ";
    query = query + " startStationLongitude, COUNT(startStationName) AS borrowAmount FROM Bike";
    query = query + " WHERE startTime <= " + "'" + endDate + "'" + "and startTime >= " + "'" + startDate + "'";
    query = query + " GROUP BY startStationName) as t3 ";
    query = query + " right outer join (SELECT endStationName, endStationId, endStationLatitude, endStationLongitude,";
    query = query + " COUNT(endStationName) AS returnAmount";
    query = query + " FROM Bike";
    query = query + " WHERE startTime <= " + "'" + endDate + "'" + "and startTime >= " + "'" + startDate + "'";
    query = query + " GROUP BY endStationName) as t4 on t3.startStationId = t4.endStationId  order by borrowAmount desc, returnAmount desc";
    
  } else if(startDate != null && endDate != null && startStationId != null) {
    
    query = "SELECT endStationName, COUNT(*) AS rankreturn ";
    query = query + " FROM Bike ";
    query = query + " WHERE startTime <= " + "'" + endDate + "'";
    query = query + " and startTime >= " + "'" + startDate + "'";
    query = query + " and startStationId = " + startStationId;
    query = query + " GROUP BY endStationName ";
    query = query + " ORDER BY rankreturn desc ";
    
    
    console.log(1);
   
    
    
  } else if(startDate != null && endDate != null && endStationId != null) {
    
    query = "SELECT startStationName, COUNT(*) AS rankborrow "
    query = query + " FROM Bike ";
    query = query + " WHERE startTime <=  " + "'" + endDate + "'";
    query = query + " and startTime >= " + "'" + startDate + "'";
    query = query + " and endStationId = " + endStationId;
    query = query + " GROUP BY startStationName ";
    query = query + " ORDER BY rankborrow desc ";
    


  }
  
  
    pool.getConnection(function(err, connection) {

        // Use the connection
        
        if(query != null) {
          
          connection.query(query, function (error, results, fields) {
        // And done with the connection.
        connection.release();
        // Handle error after the release.
        if (error) callback(error);
        else callback(null, results);});
    
          
        }
      
  
  });
};