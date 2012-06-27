// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require google_maps

$(document).ready(function() {
  $('.foto-details').hide();
  $('#map-0').show();

  $('a.hide-map').click(function(event) {
    event.preventDefault();
    mapId = $(this).data('map-id');
    $('#map-' + mapId).hide();
  });

  $('a.show-map').click(function(event) {
    event.preventDefault();
    mapId = $(this).data('map-id');
    $('#map-' + mapId).show();
  });

  $('input[type=number]').change(function() {
    count_votes();
  });

  count_votes();

  $('#popover-verified').popover({title: 'Casilla verificada', content: 'Si la casilla no presenta ninguna anomalia y la fotografia concuerda con los resultados y la información. Se puede mandar como verificada.', placement: 'top'});

  $('#popover-tickets').popover({title: 'Razones de rechazho', content: '<ul><li>Falta Fotografia: La casilla no presenta ninguna fotografía</li><li>Fotografia alterada: La fotografia parece que fue alterada.</li><li>Información dudosa: La información de la fotografia o de la casilla es dudosa o levanta sospecha.</li><li>Casilla Sospechosa: Se reportaron irregularidades en la casilla y los resultados son dudosos.</li><li>Sobrevotación: El total de votos es mayor a la lista nominal de la casilla.</li><li>Casilla no instalada: La casilla se reporto como no instalda.</li></ul>', placement: 'top'});
});

count_votes = function() {
  var total_votes = 0;
  $('input[type=number]').each(function(value){
    total_votes += parseInt($(this).val());
  });
  $('#total-casilla').html(total_votes);
}