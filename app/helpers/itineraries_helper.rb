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

  def show_participants(itinerary)
    participants = itinerary.participants
    group_size_greeting(participants)
  end

  def join_modal
    if !@itinerary.already_participating?(current_user) && @itinerary.has_pending_poll_for?(current_user)
      modal_button I18n.t(:"itinerary.join"), "join-modal", :class=>"radius button"
    end
  end

  def repeat_in_humanize(recurring)
    content = content_tag('span', recurring.repeat_in_humanize)
    if recurring.repeat_in_weekly? or recurring.repeat_in_monthly?
      content += content_tag("br")
      content += content_tag('span', recurring.repeation_days.collect { |day| DaysOfWeek.t(day.to_s) }.join(", "))
    end
    content
  end

private
  def participants_thumb(participants)
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
