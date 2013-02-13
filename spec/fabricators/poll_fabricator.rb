Fabricator(:poll) do
  requestor { Fabricate(:user) }
  itinerary { Fabricate(:itinerary_bike) }
end
