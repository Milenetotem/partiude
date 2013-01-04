class Point < ActiveRecord::Base
  attr_acessor :long, :lat, :state

  belongs_to :route

end
