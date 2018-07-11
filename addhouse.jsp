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
	 <div class="modal-body">
						  <form class="form-horizontal" action="houseplacer.jsp">
						    <div class="form-group">
						      <label class="control-label col-sm-2" for="country">Country:</label>
						      <div class="col-sm-6">
						        <input type="text" class="form-control" id="country" name="country">
						      </div>
						    </div>
						    <div class="form-group">
						      <label class="control-label col-sm-2" for="state">State:</label>
						      <div class="col-sm-6">          
						        <input type="text" class="form-control" id="state" name="state">
						      </div>
						    </div>
						    <div class="form-group">
						      <label class="control-label col-sm-2" for="city">City:</label>
						      <div class="col-sm-6">          
						        <input type="text" class="form-control" id="city" name="city">
						      </div>
						    </div>
						    <div class="form-group">
						      <label class="control-label col-sm-2" for="locality">Locality:</label>
						      <div class="col-sm-6">          
						        <input type="text" class="form-control" id="locality" name="locality">
						      </div>
						    </div>
						    
						    </div>
						    <div class="form-group">        
						      <div class="col-sm-offset-2 col-sm-16">
						        <button type="submit" class="btn btn-default">SEARCH</button>
						      </div>
						    </div>
						  </form>
						</div>
</div>



    <div id="map"></div>
    <script>
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          mapTypeID:google.maps.MapTypeId.ROADMAP,
          zoom: 3,
        });
        var geocoder = new google.maps.Geocoder();

      
          geocodeAddress(geocoder, map);
      
      }

      function geocodeAddress(geocoder, resultsMap) {
        var address = "india";
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAsw-iXkE2waBHq3XqrVGzuasP4K4GqCyo&callback=initMap">
    </script>

</body>
</html>
