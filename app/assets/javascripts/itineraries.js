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
      $("#recurring_hour").removeClass("invisible");
      $("#recurring_repeat_weekly_interval").addClass("invisible");
      $("#recurring_begin_day").addClass("invisible");
      $("div.day_of_week").each(function(){
        $(this).addClass("invisible");
      });
      break;
    case "daily":
      $("#recurring_hour").removeClass("invisible");
      $("#recurring_begin_day").addClass("invisible");
      $("#recurring_repeat_weekly_interval").addClass("invisible");
      $("div.day_of_week").each(function(){
        $(this).addClass("invisible");
      });
      break;
    case "weekly":
      $("#recurring_hour").removeClass("invisible");
      $("#recurring_begin_day").removeClass("invisible");
      $("#recurring_repeat_weekly_interval").addClass("invisible");
      $("div.day_of_week").each(function(){
        $(this).removeClass("invisible");
      });
      break;
    case "monthly":
      $("#recurring_hour").removeClass("invisible");
      $("#recurring_begin_day").removeClass("invisible");
      $("#recurring_repeat_weekly_interval").removeClass("invisible");
      $("div.day_of_week").each(function(){
        $(this).removeClass("invisible");
      });
      break;
  }
};
