class ItinerariesController < ApplicationController

  def index
    @itinerary = Itinerary.new()
    @itineraries = Itinerary.visible_to(current_user)
  end

  def new
    @itinerary = Itinerary.new()
    @itinerary.add_participant(current_user)
    render "_form"
  end

  def create
    @itinerary = Itinerary.new(params[:itinerary]).add_participant(current_user)
    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to itineraries_path(@itinerary), :notice => I18n.t(:"alerts.successfully_created", :model => Itinerary.model_name.human) }
      else
        format.html { render "_form" }
      end
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    puts @itinerary
    respond_with @itinerary
  end

end
