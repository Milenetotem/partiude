class TrajetoUsuario < ActiveRecord::Base
  attr_accessible :end_origem, :end_destino, :lat_origem, :long_origem, :lat_destino, :long_destino, :user_id, :meio_transporte_id, :status_trajeto_id, :grupo_id, :meio_transporte_ids
  acts_as_gmappable :check_process => false, :process_geocoding => false
  before_validation :custom_geocoding
  belongs_to :user
  belongs_to :meio_transporte
  belongs_to :grupo

  
  

	def gmaps4rails_address
	#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
	end

  def custom_geocoding
   origem = Geocoder.coordinates(self.end_origem)
   destino = Geocoder.coordinates(self.end_destino)
   self.lat_origem = origem.first
   self.long_origem = origem.last
   self.lat_destino = destino.first
   self.long_destino = destino.last
  end
  

end

