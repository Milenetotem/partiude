class TrajetoGrupo < ActiveRecord::Base
  attr_accessible :grupo_id, :trajeto_usuario_id
  has_many :trajeto_usuario
  belongs_to :grupo
  acts_as_gmappable :check_process => false
  accepts_nested_attributes_for :trajeto_usuario


	def gmaps4rails_address
	#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
	  
	end


end
