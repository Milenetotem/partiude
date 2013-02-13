Fabricator(:user) do
  email { Faker::Internet.email }
  nickname { Faker::Name.name }
  name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  address { "#{Faker::Address.street_address} 99" }
  city { Faker::Address.city }
  territory { Faker::Address.state }
  phone { Faker::PhoneNumber.phone_number }
  federal_id { (rand * 10000000).round() }
  subscription_mode { SubscriptionMode::FREE }
  password "partiu@123"
  password_confirmation "partiu@123"
end

Fabricator(:admin, :from => :user) do
  email "admin@partiu.de"
  subscription_mode { SubscriptionMode::PAID }
end
