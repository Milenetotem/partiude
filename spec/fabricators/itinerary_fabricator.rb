Fabricator(:itinerary_bike, :class_name => :itinerary) do
  name { Faker::Name.name }
  transport_type { TransportType::BIKE}
  origin { "#{Faker::Address.street_address} 99" }
  destiny { "#{Faker::Address.street_address} 99" }
  recurring { Fabricate(:recurring) }
  before_validation do |itinerary, t|
    itinerary.add_participant(Fabricate(:user))
    Geocoder::Lookup::Test.add_stub(
        itinerary.origin, [
          {
            'latitude'     => 40.7143528,
            'longitude'    => -74.0059731,
            'address'      => itinerary.destiny,
            'state'        => 'Rio Grande do Sul',
            'state_code'   => 'RS',
            'country'      => 'Brasil',
            'country_code' => 'BR'
          }
        ]
      )
    Geocoder::Lookup::Test.add_stub(
        itinerary.destiny, [
          {
            'latitude'     => 40.7143528,
            'longitude'    => -74.0059731,
            'address'      => itinerary.destiny,
            'state'        => 'Rio Grande do Sul',
            'state_code'   => 'RS',
            'country'      => 'Brasil',
            'country_code' => 'BR'
          }
        ]
      )
  end

end

Fabricator(:itinerary_car, :class_name => :itinerary) do
  name { Faker::Name.name }
  transport_type { TransportType::CAR}
  origin { "#{Faker::Address.street_address} 99" }
  destiny { "#{Faker::Address.street_address} 99" }
  recurring { Fabricate(:recurring) }
  before_validation do |itinerary, t|
    itinerary.add_participant(Fabricate(:user))
    Geocoder::Lookup::Test.add_stub(
        itinerary.origin, [
          {
            'latitude'     => 40.7143528,
            'longitude'    => -74.0059731,
            'address'      => itinerary.destiny,
            'state'        => 'Rio Grande do Sul',
            'state_code'   => 'RS',
            'country'      => 'Brasil',
            'country_code' => 'BR'
          }
        ]
      )
    Geocoder::Lookup::Test.add_stub(
        itinerary.destiny, [
          {
            'latitude'     => 40.7143528,
            'longitude'    => -74.0059731,
            'address'      => itinerary.destiny,
            'state'        => 'Rio Grande do Sul',
            'state_code'   => 'RS',
            'country'      => 'Brasil',
            'country_code' => 'BR'
          }
        ]
      )
  end
end

Fabricator(:itinerary_walk, :class_name => :itinerary) do
  name { Faker::Name.name }
  transport_type { TransportType::WALK}
  origin { "#{Faker::Address.street_address} 99" }
  destiny { "#{Faker::Address.street_address} 99" }
  recurring { Fabricate(:recurring) }
  before_validation do |itinerary, t|
    itinerary.add_participant(Fabricate(:user))
    Geocoder::Lookup::Test.add_stub(
        itinerary.origin, [
          {
            'latitude'     => 40.7143528,
            'longitude'    => -74.0059731,
            'address'      => itinerary.destiny,
            'state'        => 'Rio Grande do Sul',
            'state_code'   => 'RS',
            'country'      => 'Brasil',
            'country_code' => 'BR'
          }
        ]
      )
    Geocoder::Lookup::Test.add_stub(
        itinerary.destiny, [
          {
            'latitude'     => 40.7143528,
            'longitude'    => -74.0059731,
            'address'      => itinerary.destiny,
            'state'        => 'Rio Grande do Sul',
            'state_code'   => 'RS',
            'country'      => 'Brasil',
            'country_code' => 'BR'
          }
        ]
      )
  end
end
