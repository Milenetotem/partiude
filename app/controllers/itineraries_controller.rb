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
    @itinerary = Itinerary.active.new
    @itinerary.prepare
    @itinerary.attributes = params[:itinerary]

    @itinerary.add_participant(current_user)
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
    respond_with @itinerary
  end

  def search
    @itinerary = Itinerary.new(:recurring => Recurring.new)
    @itineraries = Itinerary.search(params[:itinerary]).order("updated_at desc") if params[:itinerary].present?
    respond_with @itineraries
  end

end
