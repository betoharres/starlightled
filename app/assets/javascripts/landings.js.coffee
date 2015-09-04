# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

initialize = ->
  # Create an array of styles.
  styles = [
    { stylers: [
      { hue: '#00aaff' }
      { saturation: -20 }
      { gamma: 2.15 }
      { lightness: 10 }
    ] }
    # {
    #   featureType: 'road'
    #   elementType: 'geometry'
    #   stylers: [
    #     { lightness: 100 }
    #     { visibility: 'simplified' }
    #   ]
    # }
    {
      featureType: 'road'
      elementType: 'labels'
      stylers: [ { visibility: 'off' } ]
    }
    {
      featureType: 'road.highway'
      elementType: 'geometry.fill'
      stylers: [ { color: '#D3D3D3' } ]
    }
    {
      featureType: 'poi'
      elementType: 'all'
      stylers: [ { visibility: 'off' } ]
    }
    {
      featureType: 'poi.park'
      elementType: 'geometry.fill'
      stylers: [ { visibility: 'on' }, { color: "#BFE9DB" } ]
    }
    {
      featureType: 'poi.business'
      elementType: 'geometry.fill'
      stylers: [ { visibility: 'on' }, { color: "#BFE9DB" } ]
    }

    {
      featureType: 'transit'
      elementType: 'all'
      stylers: [ { visibility: 'off' } ]
    }
    {
      featureType: 'landscape'
      elementType: 'all'
      stylers: [ { visibility: 'simplified' } ]
    }
    {
      featureType: 'landscape'
      elementType: 'labels'
      stylers: [ { visibility: 'off' } ]
    }
  ]
  styledMap = new (google.maps.StyledMapType)(styles, name: 'Simplificado')
  mapCanvas = document.getElementById('map-canvas')
  mapOptions =
    center: new (google.maps.LatLng)(-30.0469, -51.1987)
    zoom: 18
    # disableDefaultUI: true
    # mapTypeId: google.maps.MapTypeId.ROADMAP
    mapTypeControlOptions: mapTypeIds: [
      google.maps.MapTypeId.ROADMAP
      google.maps.MapTypeId.SATELLITE
      google.maps.MapTypeId.HYBRID
      'map_style'
    ]
  map = new (google.maps.Map)(mapCanvas, mapOptions)
  map.mapTypes.set 'map_style', styledMap
  map.setMapTypeId 'map_style'
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
          if node.product
            productsText += '<a href="'+node.product_url+'"><h4>' +
            node.product.name+'</h4></a>'
            productsText = productsText
            if node.status
              nodesArray.push node.status.communicating
              nodesArray.push node.status.online
            else
              nodesArray.push true
              nodesArray.push true
          else
            productsText = ''
          nodeBallon.push '<h3>Nodo:</h3><div class="info_content">' + '<a href="/nodes/' + node.id + '"><h4>' + node.identifier + '</h4></a>'+ productsText
          allNodes.push nodesArray
          allBallon.push nodeBallon
          return
        return
      console.log(allNodes)
      setAllMap map, allNodes, allBallon
      map.setCenter(new google.maps.LatLng(allNodes[(allNodes.length - 1)][1], allNodes[(allNodes.length - 1)][2]))
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
    if marker[3] && marker[4]
      mark.setIcon 'http://mt.google.com/vt/icon?psize=16&font=fonts/Roboto-Regular.ttf&color=ff330000&name=icons/spotlight/spotlight-waypoint-a.png&ax=44&ay=48&scale=1&text=N'
    else if marker[3] == false || marker[4] == false
      mark.setIcon 'http://mt.google.com/vt/icon?psize=16&font=fonts/Roboto-Regular.ttf&color=ff330000&name=icons/spotlight/spotlight-waypoint-b.png&ax=44&ay=48&scale=1&text=N'
    # if marker[3] && marker[4]
    #   mark.setIcon 'http://mt.google.com/vt/icon/name=icons/spotlight/generic_transit_L_8x.png&scale=1'
    # else if marker[3] && marker[4] == false
    #   mark.setIcon 'http://mt.google.com/vt/icon/name=icons/spotlight/directions_destination_measle_drag.png&scale=1'
    # else if marker[3] == false && marker[4]
    #   mark.setIcon 'http://mt.google.com/vt/icon/name=icons/spotlight/ad_L_8x.png&scale=1'
    # else
    #   mark.setIcon 'http://mt.google.com/vt/icon/name=icons/layers/traffic/construction_large_8x.png&scale=1'

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
