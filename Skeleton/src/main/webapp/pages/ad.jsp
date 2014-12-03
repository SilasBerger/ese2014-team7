<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<c:import url="template/header.jsp" />

<h1>
	${ad.title}
	<c:if test="${loggedInUser.id!=ad.placerId}">
		<a class="btn btn-info" href="/Skeleton/bookmark?id=${ad.id}"><span class="glyphicon glyphicon-bookmark"></span> Bookmark Ad</a>
		<a class="btn btn-info" href="/Skeleton/sendEnquiry?id=${ad.id}"><span class="glyphicon glyphicon-envelope"></span> Send Enquiry</a>
	</c:if>
	<c:if test="${loggedInUser.id==ad.placerId}">
		<a class="btn btn-info" href="/Skeleton/editAd?id=${ad.id}"><span class="glyphicon glyphicon-edit"></span> Edit</a>
		<a class="btn btn-danger" href="/Skeleton/deleteAd?id=${ad.id}"><span class="glyphicon glyphicon-remove"></span> Delete</a>
	</c:if>
</h1>
<h2>Rent: ${ad.rent}.- Additional Costs: ${ad.addCost}.-</h2>
    
    
    <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> <!-- 33 KB -->

	<!-- fotorama.css & fotorama.js. -->
	<link  href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.2/fotorama.css" rel="stylesheet"> <!-- 3 KB -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.2/fotorama.js"></script> <!-- 16 KB -->
	
	<script src="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js"></script>
	<script src="/Skeleton/js/Control.Geocoder.js"></script>




<div class="main">

	<div class="row center">
		<div class="col-md-8">
			<div class="fotorama" data-nav="thumbs" data-ratio="800/600">
				<c:forEach items="${ad.pictures}" var="pic">
					<img src="/Skeleton/img/ad/${pic.fileName}" />

					<br />
				</c:forEach>
			</div>
		</div>

		<div class="col-md-4" id="map"></div>

	</div>
	<div class="row">
		<br>
		<br>
		<br>
	</div>
	<div class="row">
		<div class="col-md-4">
			<h4>Address</h4>
			<p>
				${ad.street} ${ad.houseNr}<br>
				${ad.zip} ${ad.city}
			</p>
		
			<h4>Additional Information</h4>
			<div class="table-responsive">
				<table class="table table-hover table-condensed">
					<tr>
						<td>Move In Date&nbsp;&nbsp;
						<td>${ad.dateIn}
					</tr>
					<tr>
						<td>Move Out Date&nbsp;&nbsp;
						<td>${ad.dateOut}
					</tr>
					<tr>
						<td>Room Size&nbsp;&nbsp;
						<td>${ad.roomSize}
					</tr>
					<tr>
						<td>Distance To Public Transport
						<td>${ad.distanceToPublicTransport}
					</tr>
					<tr>
						<td>Distance To Mall or Grocery
						<td>${ad.distanceToShopping}
					</tr>
				</table>
			</div>
		</div>
		<div class="col-md-8">
			<h4>Description</h4>
			<p>${ad.description}</p>
			<h4>About Us</h4>
			<p>${ad.us}</p>
			<h4>Ideal Roomie</h4>
			<p>${ad.you}</p>
		</div>
	</div>
</div>

<script>
	function drawMap() {
		// create a map in the "map" div, set the view to a given place and zoom
		var map = L.map('map').setView([ "${ad.lat}]", "${ad.lng}]" ], 15);

		//map.locate({setView: true, maxZoom: 16});
		// add an OpenStreetMap tile layer
		L
				.tileLayer(
						'http://{s}.tile.osm.org/{z}/{x}/{y}.png',
						{
							attribution : '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
						}).addTo(map);

		// add a marker in the given location, attach some popup content to it and open the popup
		L.marker([ "${ad.lat}]", "${ad.lng}]" ]).addTo(map).bindPopup(
				"${shortDescription}").openPopup();

		// center marker on click
		map.on('popupopen', function(e) {
			var px = map.project(e.popup._latlng);
			px.y -= e.popup._container.clientHeight / 2
			map.panTo(map.unproject(px), {
				animate : true
			});
		});
	};

	$(document).ready(function() {
		var cw = $('#map').width();
		$('#map').css({
			'height' : cw + 'px'
		});

		drawMap();
	});
</script>


	<c:if test="${page_error != null }">
        <div class="alert alert-error">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Error!</h4>
                ${page_error}
        </div>
    </c:if>


<c:import url="template/footer.jsp" />
