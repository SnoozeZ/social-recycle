function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#img_prev')
                .attr('src', e.target.result)
                .width(200)
                .height(200);
        };

        reader.readAsDataURL(input.files[0]);
    }
}

function clear2() {
    console.log("clear");
    var content = $('#search-bar').val();
    if(content == "") {
        return false;
    }
}

var lng;
var lat;
function initMap() {
    if(navigator.geolocation) {
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 15,
            //center: {lat: -34.397, lng: 150.644}
        });

        navigator.geolocation.getCurrentPosition(function (position) {
            var geolocate = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
            map.setCenter(geolocate);
        });

        var geocoder = new google.maps.Geocoder();
        document.getElementById('locate').addEventListener('click', function() {
            geocodeAddress(geocoder, map);
        });
    } else {
        document.getElementById('map').innerHTML="No Geolocation Support";
    }
}

function geocodeAddress(geocoder, resultsMap) {
    var address = document.getElementById('item_address').value;
    geocoder.geocode({'address': address}, function(results, status) {
        if (status === google.maps.GeocoderStatus.OK) {
            resultsMap.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: resultsMap,
                position: results[0].geometry.location
            });
            var itemPosition = results[0].geometry.location;

            document.getElementById('item_lng').value = itemPosition.lng();
            console.log(itemPosition.lat());
            console.log(itemPosition.lng());
            document.getElementById('item_lat').value = itemPosition.lat();
            document.getElementById('map_status').innerHTML = "<p class=\"bg-success\">Valid!</p>";

            var infoWindow = new google.maps.InfoWindow({
                map: map,
                content: results[0].formatted_address});
            //infoWindow.setPosition(itemPosition);
            infoWindow.open(resultsMap, marker);
        } else if(status == google.maps.GeocoderStatus.ZERO_RESULTS){
            document.getElementById('map_status').innerHTML = "<p class=\"bg-danger\">No result for your input!</p>";
        } else {
            alert('Geocode was not successful for the following reason: ' + status);
        }
    });
}

