class ItinerarySearch

  def self.search(params)
    itineraries = Itinerary.active.includes([:participants, :recurring]).order("itineraries.updated_at desc")
    itineraries = itineraries.where("participants.user_id != ?", params[:current_user].id)
    itineraries = itineraries.where("upper(name) like ?", "%#{params[:name].upcase}%") if params[:name].present?
    itineraries = itineraries.where("upper(origin) like ?", "%#{params[:origin].upcase}%") if params[:origin].present?
    itineraries = itineraries.where("upper(destiny) like ?", "%#{params[:destiny].upcase}%") if params[:destiny].present?
    itineraries = itineraries.where(:transport_type => params[:transport_type]) if params[:transport_type].present?

    if params[:recurring_attributes].present?
      recurring = params[:recurring_attributes]
      itineraries = itineraries.where("recurrings.repeat_in = ?", recurring[:repeat_in]) if recurring[:repeat_in].present?
      itineraries = itineraries.where("recurrings.hour = ?", recurring[:hour]) if recurring[:hour].present?
      itineraries = itineraries.where("recurrings.begin_day = ?", recurring[:begin_day]) if recurring[:begin_day].present?
      itineraries = itineraries.where("recurrings.sunday = ?", recurring[:sunday]) if recurring[:sunday].present? && recurring[:sunday] == 1
      itineraries = itineraries.where("recurrings.monday = ?", recurring[:monday]) if recurring[:monday].present? && recurring[:monday] == 1
      itineraries = itineraries.where("recurrings.tuesday = ?", recurring[:tuesday]) if recurring[:tuesday].present? && recurring[:tuesday] == 1
      itineraries = itineraries.where("recurrings.wednesday = ?", recurring[:wednesday]) if recurring[:wednesday].present? && recurring[:wednesday] == 1
      itineraries = itineraries.where("recurrings.thursday = ?", recurring[:thursday]) if recurring[:thursday].present? && recurring[:thursday] == 1
      itineraries = itineraries.where("recurrings.friday = ?", recurring[:friday]) if recurring[:friday].present? && recurring[:friday] == 1
      itineraries = itineraries.where("recurrings.saturday = ?", recurring[:saturday]) if recurring[:saturday].present? && recurring[:saturday] == 1
    end

    itineraries
  end

end
