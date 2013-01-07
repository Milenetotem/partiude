class ItinerariesController < ApplicationController

  def index
  end

  def new
    @itinerary = Itinerary.new
    render "_form"
  end

  def create
    @itinerary = Itinerary.new(params[:itinerary])
    if @itinerary.save
      format.html { redirect_to(itineraries_path) }
    else
      render "_form"
    end
  end

end
