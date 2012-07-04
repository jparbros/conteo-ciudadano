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
//= require plupload.full
//= require jquery.plupload.queue
//= require google_maps
//= require boxes
//= require home
//= require jquery.cookie

$(document).ready(function() {
  $('#login-modal').modal({
    show: false
  });

  var screenHeight = screen.height;

  juntosHeight = $('#juntos-haremos').height();
  $('#juntos-haremos').css('margin-bottom', (screenHeight - juntosHeight - 120));

  comoHeight = $('#como-funcionara').height();
  $('#como-funcionara').css('margin-bottom', (screenHeight - comoHeight - 120));

  porqueHeight = $('#porque').height();
  $('#porque').css('margin-bottom', (screenHeight - porqueHeight - 120));

  quieresHeight = $('#quieres-participar').height();
  $('#quieres-participar').css('margin-bottom', (screenHeight - quieresHeight - 120));

  noesHeight = $('#no-es-un-engano').height();
  $('#no-es-un-engano').css('margin-bottom', (screenHeight - noesHeight - 120 - 160));

  $('#login-button').click(function(event) {
    event.preventDefault();
    $('#login-modal').modal('show');
  });

  $('[data-link-type="funcionara"]').click(function(event) {
    event.preventDefault();
    top_position = $('#como-funcionara').position().top - 120
    $('html, body').animate({scrollTop:top_position}, 'slow');
  });

  $('[data-link-type="porque"]').click(function(event) {
    event.preventDefault();
    top_position = $('#porque').position().top - 120
    $('html, body').animate({scrollTop:top_position}, 'slow');
  });

  $('[data-link-type="participa"]').click(function(event) {
    event.preventDefault();
    top_position = $('#quieres-participar').position().top - 120
    $('html, body').animate({scrollTop:top_position}, 'slow');
  });

  $('[data-link-type="engano"]').click(function(event) {
    event.preventDefault();
    top_position = $('#no-es-un-engano').position().top - 120
    $('html, body').animate({scrollTop:top_position}, 'slow');
  });

  $('[data-link-type="home"]').click(function(event) {
    if ($(this).data('link-enable') == true) {
      event.preventDefault();
      $('html, body').animate({scrollTop:0}, 'slow');
    }
  });

  $('input[type=number]').change(function() {
    count_votes();
  });

  count_votes();

  $('#popover-tickets').popover({title: 'Razones de rechazo', content: '<ul><li>Falta Fotografía: La casilla no presenta ninguna fotografía</li><li>Fotografía alterada: La fotografía parece que fue alterada.</li><li>Información dudosa: La información de la fotografía o de la casilla es dudosa o levanta sospecha.</li><li>Casilla Sospechosa: Se reportaron irregularidades en la casilla y los resultados son dudosos.</li><li>Sobrevotación: El total de votos es mayor a la lista nominal de la casilla.</li><li>Casilla no instalada: La casilla se reporto como no instalda.</li></ul>', placement: 'top'});
})

$(function() {
  $('form.form-inline input#special').click(function() {
    inputSection = $('form.form-inline input#section')
    if($(this).is(':checked') == true) {
      inputSection.attr('disabled','disabled');
      inputSection.addClass('disabled');
    } else {
      inputSection.removeAttr('disabled','disabled');
      inputSection.removeClass('disabled')
    }
  });
});

count_votes = function() {
  var total_votes = 0;
  $('input[type=number]').each(function(value){
    total_votes += parseInt($(this).val());
  });
  $('#total-casilla').html(total_votes);
}