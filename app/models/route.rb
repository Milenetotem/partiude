class Route < ActiveRecord::Base

  belongs_to :user
  has_many :points

  accepts_nested_attributes_for :points, :allow_destroy => true

end
