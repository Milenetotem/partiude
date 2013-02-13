Fabricator(:poll) do
  requestor { Fabricate(:user) }
  itinerary { Fabricate(:itinerary_bike) }
  location_point { Faker::Address.street_name }
end
