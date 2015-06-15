// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//

//--- Angle
//= require_tree ./angle/

function initialize() {
  var mapCanvas = document.getElementById('map-canvas');

  var mapOptions = {
    center: new google.maps.LatLng(-30.0469, -51.1987),
    zoom: 14,
    disableDefaultUI: true,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }

  var map = new google.maps.Map(mapCanvas, mapOptions)

  setAllMap(map);
}

function setAllMap(map) {

  var infoWindow = new google.maps.InfoWindow(), marker, i;

  // Multiple Markers
  var markers = [
      ['Gateway DC Park', -30.04697701954374,-51.19870573282242],
      ['Luminária 4',  -30.046842357326508, -51.198791563510895],
      ['Luminária 10', -30.04671001669326, -51.19887739419937],
      ['Luminária 14',  -30.046401221194735, -51.19910538196564],
      ['Luminária 2',  -30.04651589999999, -51.198969999999999],
  ];
  // Info Window Content
  var infoWindowContent = [
      ['<div class="info_content">' +
      '<h3>Gateway DC Park</h3>' +
      '<p><a href="/gateways">Status</a></p></div>'],
      ['<div class="info_content">' +
      '<h3>Luminária 4</h3>' +
      '<p><a href="/lamps">Status</a></p>' +
      '</div>'],
      ['<div class="info_content">' +
      '<h3>Luminária 10</h3>' +
      '<p><a href="/lamps">Status</a></p>' +
      '</div>'],
      ['<div class="info_content">' +
      '<h3>Luminária 14</h3>' +
      '<p><a href="/lamps">Status</a></p>' +
      '</div>'],
      ['<div class="info_content">' +
      '<h3>Luminária 2</h3>' +
      '<p><a href="/lamps">Status</a></p>' +
      '</div>']
  ];

  for (var i = 0; i < markers.length; i++) {
    var marker = markers[i];
    var myLatLng = new google.maps.LatLng(marker[1], marker[2]);
    var mark = new google.maps.Marker({
        position: myLatLng,
        map: map,
        title: marker[0]
    });
    if (i == 0){
      mark.setIcon('http://mt.google.com/vt/icon?psize=16&font=fonts/Roboto-Regular.ttf&color=ff330000&name=icons/spotlight/spotlight-waypoint-a.png&ax=44&ay=48&scale=1&text=G');
    }else {
      mark.setIcon('http://mt.google.com/vt/icon?psize=16&font=fonts/Roboto-Regular.ttf&color=ff330000&name=icons/spotlight/spotlight-waypoint-a.png&ax=44&ay=48&scale=1&text=L');
    }
    // Allow each marker to have an info window
    google.maps.event.addListener(mark, 'click', (function(mark, i) {
        return function() {
            infoWindow.setContent(infoWindowContent[i][0]);
            infoWindow.open(map, mark);
        }
    })(mark, i));
  }
}

google.maps.event.addDomListener(window, 'load', initialize);

