class Empresa < ActiveRecord::Base
  attr_accessible :codigo_id, :logo, :nome, :user_id
  has_many :codigo
  has_many :user
end
