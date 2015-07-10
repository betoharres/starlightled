(function() {
  var initialize, setAllMap;

  initialize = function() {
    var map, mapCanvas, mapOptions;
    mapCanvas = document.getElementById('map-canvas');
    mapOptions = {
      center: new google.maps.LatLng(-30.0469, -51.1987),
      zoom: 14,
      disableDefaultUI: true,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(mapCanvas, mapOptions);
    $.getJSON('networks.json', function(data) {
      var allBallon, allNodes;
      allNodes = [];
      allBallon = [];
      $.each(data, function(key, val) {
        $.each(val, function(k, network) {
          $.each(network.nodes, function(x, node) {
            var nodeBallon, nodesArray, productsText;
            nodesArray = [];
            nodeBallon = [];
            productsText = "<h3>Dispositivos:</h3>";
            nodesArray.push(node.identifier);
            nodesArray.push(node.latitude);
            nodesArray.push(node.longitude);
            $.each(node.products, function(n, product) {
              productsText += '<a href="' + product.url + '"><h4>' + product.productable_type + ' #' + product.productable_id + '</h4></a>';
            });
            if (node.products.length > 0) {
              productsText = productsText;
            } else {
              productsText = '';
            }
            nodeBallon.push('<h3>Nodo:</h3><div class="info_content">' + '<a href="/nodes/' + node.id + '"><h4>' + node.identifier + '</h4></a>' + productsText);
            allNodes.push(nodesArray);
            allBallon.push(nodeBallon);
          });
        });
        setAllMap(map, allNodes, allBallon);
      });
    });
  };

  setAllMap = function(map, nodes, ballons) {
    var marker;
    var i;
    var i, infoWindow, infoWindowContent, mark, marker, markers, myLatLng;
    infoWindow = new google.maps.InfoWindow;
    marker = void 0;
    i = void 0;
    markers = nodes;
    infoWindowContent = ballons;
    i = 0;
    while (i < markers.length) {
      marker = markers[i];
      myLatLng = new google.maps.LatLng(marker[1], marker[2]);
      mark = new google.maps.Marker({
        position: myLatLng,
        map: map,
        title: marker[0]
      });
      mark.setIcon('http://mt.google.com/vt/icon?psize=16&font=fonts/Roboto-Regular.ttf&color=ff330000&name=icons/spotlight/spotlight-waypoint-a.png&ax=44&ay=48&scale=1&text=N');
      google.maps.event.addListener(mark, 'click', (function(mark, i) {
        return function() {
          infoWindow.setContent(infoWindowContent[i][0]);
          infoWindow.open(map, mark);
        };
      })(mark, i));
      i++;
    }
  };

  google.maps.event.addDomListener(window, 'load', initialize);

}).call(this);
