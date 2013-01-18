module ItinerariesHelper

  def transport_type_img(transport_type)
    case transport_type
      when TransportType::CAR
        image_tag("balao-carro.png", :style => "float:left;")
      when TransportType::BIKE
        image_tag("balao-bicicleta.png", :style => "float:left;")
      when TransportType::WALK
        image_tag("balao-ape.png", :style => "float:left;")
    end
  end

  def group_size_greeting(participants)
    if participants.present?
      if participants.size > 1
        I18n.t("itinerary.has_many".to_sym, participants.size)
      else
        I18n.t("itinerary.has_one".to_sym)
      end
    else
      I18n.t("itinerary.has_none".to_sym)
    end
  end

end
