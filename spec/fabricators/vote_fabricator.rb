Fabricator(:vote) do
  poll { Fabricate(:poll) }
  user { Fabricate(:user) }
  approve false
end
