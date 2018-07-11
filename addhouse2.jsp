<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="index.css">
</head>

<body bgcolor="wheat">
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAsw-iXkE2waBHq3XqrVGzuasP4K4GqCyo&callback=myMap"></script>
<div id="form">
	<center>
	<h3>Place yourself on the map.......</h3></center>
	<form action=housedataupload.jsp>
		<fieldset><legend><b>Location</b></legend>
		<table>
			<tr><td><label>Country</label></td><td><label><%HttpSession locationdata=request.getSession(); String l1=(String)locationdata.getAttribute("country");  out.print(l1);%></label></td></tr>
			<tr><td><label>State</label></td><td><label><%String l2=(String)locationdata.getAttribute("state");  out.print(l2);%></label></td></tr>
			<tr><td><label>City/Village</label></td><td><label><%String l3=(String)locationdata.getAttribute("city");  out.print(l3);%></label></td></tr>
			<tr><td><label>Locality</label></td><td><label><%String l4=(String)locationdata.getAttribute("locality");  out.print(l4);%></label></td></tr>
		</table>
		</fieldset><br>
		<article><em>All set.....<br> Point your location in the map.....</em></article>
		
		<label>Latitude:</label><input type="text" name="lat" id ="lat">
		<label>Longitude:</label><input type="text" name="lng" id ="lng">
		
		<fieldset><legend>Availibilty</legend>
			<div class="form-group">       
      <div class="col-sm-offset-1 col-sm-10">
        <div class="radio" style="float:left"> 
			<label>BHK:</label>
          <label><input type="radio" name="bhk" value="1BHK">1BHK</label>
          <label><input type="radio" name="bhk" value="2BHK">2BHK</label>
          <label><input type="radio" name="bhk" value="3BHK">3BHK</label>
        </div>
      </div>
    </div>
    <label>Charges:</label><input type="number" name="price" id ="prices"><label>Per/month</label>>
		
		<input type="submit" value="UPLOAD">
	</form>
</div>



    <div id="map"></div>
    <script>
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          mapTypeID:google.maps.MapTypeId.ROADMAP,
          zoom: 14,
        });
        var geocoder = new google.maps.Geocoder();
		geocodeAddress(geocoder, map);
		var marker;
          
          function placeMarker(location) {
        	    if ( marker ) {
        	      marker.setPosition(location);
        	    } else {
        	      marker = new google.maps.Marker({
        	        position: location,
        	        map: map
        	      });
        	    }
        	  }
          
          google.maps.event.addListener(map, 'click', function(event) {
        	    placeMarker(event.latLng);
        	    var lat=marker.getPosition().lat();
        	    var lng=marker.getPosition().lng();
        	    //	alert(posn);
        	    document.getElementById('lat').value = lat;
        	    document.getElementById('lng').value = lng;
        	  });
          
      
      }

      function geocodeAddress(geocoder, resultsMap) {
        var address = "<%	String ctry=(String)locationdata.getAttribute("country");  out.print(ctry);%>"+","
        					+"<%String state=(String)locationdata.getAttribute("state");  out.print(state);%>"+","
        					+"<%String city=(String)locationdata.getAttribute("city");  out.print(city);%>"+","
        					+"<%String locality=(String)locationdata.getAttribute("locality");  out.print(locality);%>";
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
          } else {
            alert('Unable to Locate: ' + status);
          }
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAsw-iXkE2waBHq3XqrVGzuasP4K4GqCyo&callback=initMap">
    </script>

</body>
</html>
