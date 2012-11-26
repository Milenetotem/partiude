class Grupo < ActiveRecord::Base
  attr_accessible :nome, :trajeto_grupo_id, :user_id, :trajeto_usuario, :trajeto_usuario_attributes
  has_one :trajeto_grupo
  has_many :trajeto_usuario
  has_many :meio_transporte, :through => :trajeto_usuario
  has_many :users, :through => :memberships
  has_many :memberships 

    #accepts_nested_attributes_for :trajeto_grupo, :reject_if => :all_blank, :allow_destroy => true 
    accepts_nested_attributes_for :trajeto_usuario, :reject_if => :all_blank
    accepts_nested_attributes_for :meio_transporte
    accepts_nested_attributes_for :memberships


end
