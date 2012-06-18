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
//= require_tree .

$(document).ready(function() {
  $('#login-modal').modal({
    show: false
  });

  $('#login-button').click(function(event) {
    event.preventDefault();
    $('#login-modal').modal('show');
  });

  $('[data-link-type="funcionara"]').click(function(event) {
    event.preventDefault();
    $('html, body').animate({scrollTop:997}, 'slow');
  });

  $('[data-link-type="porque"]').click(function(event) {
    event.preventDefault();
    $('html, body').animate({scrollTop:2072}, 'slow');
  });

  $('[data-link-type="participa"]').click(function(event) {
    event.preventDefault();
    $('html, body').animate({scrollTop:2929}, 'slow');
  });

  $('[data-link-type="engano"]').click(function(event) {
    event.preventDefault();
    $('html, body').animate({scrollTop:3791}, 'slow');
  });

  $('[data-link-type="home"]').click(function(event) {
    if ($(this).data('link-enable') == true) {
      event.preventDefault();
      $('html, body').animate({scrollTop:0}, 'slow');
    }
  });
})


$(function() {
  $('#html5_uploader').pluploadQueue({
    // General settings
    runtimes : 'html5',
    url : '/casillas/' + $('#html5_uploader').data('box-id'),
    max_file_size : '5mb',
    chunk_size : '1mb',
    unique_names : true,

    // Specify what files to browse for
    filters : [
      {title : "Image files", extensions : "jpg,gif,png"},
    ]
  });
});
