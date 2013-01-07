class ItinerariesController < ApplicationController

  def index
  end

  def new
    @itinerary = Itinerary.new
    render "_form"
  end

  def create
    @itinerary = Itinerary.new(params[:itinerary])
    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to itineraries_path, :notice => I18n.t(:"alerts.successfully_created", :model => Itinerary.model_name.human) }
      else
        render "_form"
      end
    end
  end

end
