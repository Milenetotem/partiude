class Route < ActiveRecord::Base

  belongs_to :user
  has_many :points

  has_enumeration_for :repeat_in
  has_enumeration_for :transport_type

  accepts_nested_attributes_for :points, :allow_destroy => true

end
