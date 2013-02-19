Fabricator(:poll) do
  requestor { Fabricate(:user) }
  itinerary { Fabricate(:itinerary_bike) }
  origin { Faker::Address.street_name }
  destiny { Faker::Address.street_name }
end
