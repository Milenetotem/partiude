class ItinerariesController < ApplicationController

  def index
    @itinerary = Itinerary.new
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

  def show
    @itinerary = Itinerary.find(params[:id])
    respond_with @itinerary
  end

end
