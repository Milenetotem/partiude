class MeioTransporte < ActiveRecord::Base
  attr_accessible :grupo_id, :icone, :nome, :trajeto_usuario_id, :limite, :limite_qtd
  validates :nome, :icone,  :presence => true
  validates :limite_qtd, :presence => true, :if => :tem_limite?
  has_many :trajeto_usuario
end

def tem_limite?
	self.limite == true
end