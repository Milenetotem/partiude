class MeioTransporte < ActiveRecord::Base
  attr_accessible :grupo_id, :icone, :nome, :trajeto_id
  belongs_to :grupo
end
