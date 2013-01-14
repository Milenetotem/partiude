module ItinerariesHelper

  def transport_type_img(transport_type)
    case transport_type
      when TransportType::CAR
        image_tag("balao-carro.png")
      when TransportType::BIKE
        image_tag("balao-bicicleta.png")
      when TransportType::WALK
        image_tag("balao-ape.png")
    end
  end

end
