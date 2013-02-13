ItineraryMap = function ItineraryMap(map){
  this._map = map;
  if(map){
    this.originCordination = $(map).data("origin-coordiation");
    this.destinyCordination = $(map).data("destiny-coordiation");
    this.origin = $(map).data("origin");
    this.destiny = $(map).data("destiny");
  }
  this.directionsService = new google.maps.DirectionsService();
};

ItineraryMap.prototype.render = function() {
  var directionsDisplay = new google.maps.DirectionsRenderer();
  var mapOptions = {
    zoom: 5,
    center: new google.maps.LatLng(this.originCordination[0], this.originCordination[1]),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(this._map, mapOptions);

  directionsDisplay.setMap(map);

  var request = {
      origin:this.origin,
      destination:this.destiny,
      travelMode: google.maps.DirectionsTravelMode.DRIVING
  };
  this.directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(response);
    }else if(status == google.maps.DirectionsStatus.NOT_FOUND){
      console.log("not found, meh");
    }else if(status == google.maps.DirectionsStatus.ZERO_RESULTS){
      console.log("nothing found :(");
    }else{
      console.log("something goes wrong... =/");
    }
  });
};

RecurringSelector = function RecurringSelector(element){
  this._element = element;
  $(element).on('change', $.proxy(this.loadFields, this));
}

RecurringSelector.prototype.loadFields = function() {
  var selectedRecurring = $(this._element).val();
  switch(selectedRecurring){
    case "today":
      $(":input[name*='hour']").removeClass("invisible");
      $(":input[name*='begin_day']").addClass("invisible");
      $("div.day_of_week").each(function(){
        $(this).addClass("invisible");
      });
      break;
    case "daily":
      $(":input[name*='hour']").removeClass("invisible");
      $(":input[name*='begin_day']").addClass("invisible");
      $("div.day_of_week").each(function(){
        $(this).addClass("invisible");
      });
      break;
    case "weekly":
      $(":input[name*='hour']").removeClass("invisible");
      $(":input[name*='begin_day']").removeClass("invisible");
      $("div.day_of_week").each(function(){
        $(this).removeClass("invisible");
      });
      break;
    case "monthly":
      $(":input[name*='hour']").removeClass("invisible");
      $(":input[name*='begin_day']").removeClass("invisible");
      $("div.day_of_week").each(function(){
        $(this).removeClass("invisible");
      });
      break;
  }
};


$(function(){

  $("div.radio-selector dd span").click(function(){
    var target = $("div.radio-selector").data("target");
    var value = $(this).data("value");
    $("#"+target).val(value);
    $("div.radio-selector").find("span").removeClass("selected");
    $(this).addClass("selected");
    if(value == "car"){
      $("div.driver_checkbox").removeClass("invisible");
    }else{
      $("div.driver_checkbox").addClass("invisible");
    }
  });

  $("div.radio-selector").each(function(){
    var target = $(this).data("target");

    var selected = $("#"+target).val();
    if(selected){
      var toFind = "span."+$("#"+target).val()+"";
      $(this).find(toFind).addClass("selected");
    }
  });

});
