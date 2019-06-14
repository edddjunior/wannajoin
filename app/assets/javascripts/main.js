/* CURRENT LOCATION */
function geolocationSuccess(position) {
  var latitude = position.coords.latitude;
  var longitude = position.coords.longitude;

  var geocoder = new google.maps.Geocoder();
  var latlng = {lat: latitude, lng: longitude};

  geocoder.geocode({'location': latlng}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      if (results[0]){
        var user_city = results[0].address_components.filter(ac=>~ac.types.indexOf('locality'))[0].long_name;
        document.getElementById("current_location").innerHTML = user_city;
      }else {
        console.log('No results found for these coords.');
      }
    }else {
      console.log('Geocoder failed due to: ' + status);
    }
  });
}

function geolocationError() {
  console.log("please enable location for this feature to work!");
}

$(document).ready(function() {
  if ("geolocation" in navigator) {
    navigator.geolocation.getCurrentPosition(geolocationSuccess, geolocationError);
  } else {
    alert("Geolocation not supported!");
  }
});
