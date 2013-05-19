$(document).ready(function() {

  //if checkbox checked and reload page then container should be opened
  var isChecked = $('#event_1').is(':checked');
  if (isChecked === true) {
    $('#add_content').toggle('slow');
  }
  var isChecked = $('#event_2').is(':checked');
  if (isChecked === true) {
    $('#add_content2').toggle('slow');
  }

  //show and hide container
  $(document).on("change", '.toggle', function() {
    var ttarget = $(this).attr('href');
    $(ttarget).toggle('slow');
    return(false);
  });

  //hide container and unchecked checkbox after success remote from
  $('form').bind('ajax:success', function(){
    $(this).find('.widget-content').toggle('slow');
    $(this).find('.toggle').removeAttr('checked');
  });

  //sidebar link active after visit on.
  var loc_href = window.location.pathname;
  $('#sidebar_nav li a').each(function () {
    if (loc_href == $(this).attr('href')) {
      $(this).parent('li').addClass('active');
    }
  });

  // Show spinner on click Add Item link or wait for opening form
  $('.addItemLink').ajaxStart( function() {
    $("#spinner").show();
  });

  // hide spinner when form open
  $('.addItemLink').ajaxStop( function() {
    $("#spinner").hide();
  });

});

