$(function(){
  var dateMask = "##/##/####";
  var timeFormat = "##:##";

  $(".datepicker").each(function(){
    $(this).datepicker($.datepicker.regional[ "<%= I18n.locale %>" ]);
    $(this).mask({mask: dateMask});
  });

  $(".timepicker").each(function(){
    $(this).timepicker({step: "10", timeFormat: "H:i"});
    $(this).mask({mask: timeFormat});
  });

});

function showModal(element){
  var modal = $(element).data("target");
  $("#"+modal).reveal();
}
