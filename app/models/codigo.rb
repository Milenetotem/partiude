class Codigo < ActiveRecord::Base
  attr_accessible :codigo, :empresa_id, :user_id
  belongs_to :user
  belongs_to :empresa
end
