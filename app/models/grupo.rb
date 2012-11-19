class Grupo < ActiveRecord::Base
  attr_accessible :meio_transporte_id, :nome, :trajeto_grupo_id, :user_id, :trajeto_usuario, :trajeto_usuario_origem, :trajeto_usuario_destino
  has_one :trajeto_grupo
  has_many :meio_transporte
  has_many :trajeto_usuario, :through => :trajeto_grupo
  has_many :trajeto_usuario_origem, :through => :trajeto_usuario
	has_many :trajeto_usuario_destino, :through => :trajeto_usuario
    accepts_nested_attributes_for :trajeto_grupo, :reject_if => :all_blank, :allow_destroy => true 
    accepts_nested_attributes_for :meio_transporte, :reject_if => :all_blank
    accepts_nested_attributes_for :trajeto_usuario, :reject_if => :all_blank
    accepts_nested_attributes_for :trajeto_usuario_origem, :reject_if => :all_blank
    accepts_nested_attributes_for :trajeto_usuario_destino, :reject_if => :all_blank

end
