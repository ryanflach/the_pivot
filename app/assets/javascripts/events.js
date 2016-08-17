$(document).ready(function(){
  var $events = $('.event');

  $('#event_filter_all').on('keyup', function(){
    var currentData = this.value;

    $events.each(function (index, event) {
      $event = $(event);
      if ( $event.data('all').toLowerCase().indexOf(currentData.toLowerCase()) !== -1 ) {
        $event.show();
      } else {
        $event.hide();
      }
    });
  });


});
