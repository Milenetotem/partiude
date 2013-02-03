class ItinerariesController < ApplicationController

  def index
    @itinerary = Itinerary.new(:recurring => Recurring.new)
    @itineraries = Itinerary.visible_to(current_user).order("updated_at desc")
  end

  def new
    @itinerary = Itinerary.new(:recurring => Recurring.new)
    @itinerary.add_participant(current_user)
    render "_form"
  end

  def create
    @itinerary = Itinerary.new(params[:itinerary])
    @itinerary.add_participant(current_user)
    @itinerary.recurring = Recurring.new(params[:recurring])
    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to itineraries_path, :notice => I18n.t(:"alerts.successfully_created", :model => Itinerary.model_name.human) }
        format.js
      else
        format.html { render "_form" }
        format.js
      end
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    puts @itinerary
    respond_with @itinerary
  end

end
