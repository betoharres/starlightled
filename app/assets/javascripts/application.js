// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//

//--- Angle
// = require jquery_ujs
//= require chosen-jquery
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

  $.getJSON("networks.json", function(data) {
  var allNodes = [];
  var allBallon = [];
    $.each( data, function( key, val ) {
      $.each( val.nodes, function( k, v ) {
        var node = [];
        var nodeBallon = [];
        node.push(v.identifier);
        node.push(v.latitude);
        node.push(v.longitude);
        nodeBallon.push('<div class="info_content">' +
      '<a href="/nodes/'+v.id+'"><h3>'+ v.identifier +'</h3></a>');
        allNodes.push(node);
        allBallon.push(nodeBallon);
      });
      console.log(allBallon);
      setAllMap(map, allNodes, allBallon);
    });
  });
}

function setAllMap(map, nodes, ballons) {

  var infoWindow = new google.maps.InfoWindow(), marker, i;

  // Multiple Markers
  var markers = nodes;
  // Info Window Content
  var infoWindowContent = ballons;

  for (var i = 0; i < markers.length; i++) {
    var marker = markers[i];
    var myLatLng = new google.maps.LatLng(marker[1], marker[2]);
    var mark = new google.maps.Marker({
        position: myLatLng,
        map: map,
        title: marker[0]
    });
    // if (i == 0){
      // mark.setIcon('http://mt.google.com/vt/icon?psize=16&font=fonts/Roboto-Regular.ttf&color=ff330000&name=icons/spotlight/spotlight-waypoint-a.png&ax=44&ay=48&scale=1&text=G');
    // }else {
      mark.setIcon('http://mt.google.com/vt/icon?psize=16&font=fonts/Roboto-Regular.ttf&color=ff330000&name=icons/spotlight/spotlight-waypoint-a.png&ax=44&ay=48&scale=1&text=N');
    // }
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

