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
    new google.maps.Map(document.getElementById("box-map"), @mapsOptions());

  mapsOptions: ->
    opts = {}
    $.extend(opts, @defaults)
    delete opts.latitude
    delete opts.longitude
    delete opts.address
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

  render: ->
    @map()
    @getLocation()
}