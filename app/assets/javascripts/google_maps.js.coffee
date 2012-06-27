window.GoogleMaps = {
  initialize : (options) ->
    @defaults = $.extend(@defaults, options);
    @

  defaults: {
    zoom: 17,
    panControl: false,
    zoomControl: true,
    scaleControl: false,
    mapTypeControl: false,
    mapTypeId: google.maps.MapTypeId.HYBRID
  }

  myLatlng: ->
    new google.maps.LatLng(@defaults.latitude,@defaults.longitude)

  map: ->
    map_id =  if @defaults.map_id then  @defaults.map_id else "box-map"
    new google.maps.Map(document.getElementById(map_id), @mapsOptions());

  mapsOptions: ->
    opts = {}
    $.extend(opts, @defaults)
    delete opts.latitude
    delete opts.longitude
    delete opts.address
    delete opts.map_id
    opts

  image: '/assets/marker-casilla.png'

  geocoder: ->
    new google.maps.Geocoder();

  geocoderRequest: ->
    {address: @defaults.address}

  getLocation: (location) ->
    map = @map()
    image = @image
    @geocoder().geocode(@geocoderRequest(), (results, status) ->
      if status == google.maps.GeocoderStatus.OK
        location = results[0].geometry.location
        map.setCenter(location)
        marker = new google.maps.Marker({map: map, icon: image, position: location})
    )

  marker: (map) ->
    new google.maps.Marker({ position: @myLatlng(), map: map });

  render: ->
    @map()
    @getLocation()

  rendeWithCoordinates: ->
    @defaults =  $.extend(@defaults, {center: @myLatlng()})
    map = @map()
    marker = @marker(map)
}