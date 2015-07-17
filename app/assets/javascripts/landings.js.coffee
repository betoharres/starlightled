# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

initialize = ->
  mapCanvas = document.getElementById('map-canvas')
  mapOptions =
    center: new (google.maps.LatLng)(-30.0469, -51.1987)
    zoom: 14
    disableDefaultUI: true
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new (google.maps.Map)(mapCanvas, mapOptions)
  $.getJSON 'networks.json', (data) ->
    allNodes = []
    allBallon = []
    $.each data, (key, val) ->
      $.each val, (k, network) ->
        $.each network.nodes, (x, node) ->
          nodesArray = []
          nodeBallon = []
          productsText = "<h3>Dispositivos:</h3>"
          nodesArray.push node.identifier
          nodesArray.push node.latitude
          nodesArray.push node.longitude
          $.each node.products, (n, product) ->
            productsText += '<a href="'+product.url+'"><h4>' +
            product.productable_type + ' #' +
            product.productable_id+'</h4></a>'
            return
          if node.products.length > 0
            productsText = productsText
          else
            productsText = ''
          nodeBallon.push '<h3>Nodo:</h3><div class="info_content">' + '<a href="/nodes/' + node.id + '"><h4>' + node.identifier + '</h4></a>'+ productsText
          allNodes.push nodesArray
          allBallon.push nodeBallon
          return
        return
      # console.log(allBallon);
      setAllMap map, allNodes, allBallon
      return
    return
  return

setAllMap = (map, nodes, ballons) ->
  `var marker`
  `var i`
  infoWindow = new (google.maps.InfoWindow)
  marker = undefined
  i = undefined
  # Multiple Markers
  markers = nodes
  # Info Window Content
  infoWindowContent = ballons
  i = 0
  while i < markers.length
    marker = markers[i]
    myLatLng = new (google.maps.LatLng)(marker[1], marker[2])
    mark = new (google.maps.Marker)(
      position: myLatLng
      map: map
      title: marker[0])
    # if (i == 0){
    # mark.setIcon('http://mt.google.com/vt/icon?psize=16&font=fonts/Roboto-Regular.ttf&color=ff330000&name=icons/spotlight/spotlight-waypoint-a.png&ax=44&ay=48&scale=1&text=G');
    # }else {
    mark.setIcon 'http://mt.google.com/vt/icon?psize=16&font=fonts/Roboto-Regular.ttf&color=ff330000&name=icons/spotlight/spotlight-waypoint-a.png&ax=44&ay=48&scale=1&text=N'
    # }
    # Allow each marker to have an info window
    google.maps.event.addListener mark, 'click', do (mark, i) ->
      ->
        infoWindow.setContent infoWindowContent[i][0]
        infoWindow.open map, mark
        return
    i++
  return

google.maps.event.addDomListener window, 'load', initialize
