class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  belongs_to :empresa
  has_many :codigo
  has_many :trajeto_usuario
  has_many :grupo
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :gender, :name, :location, :image, :trajeto_usuario_id, :grupo_id

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"]
        user.gender = data["gender"]
        user.name = data["name"]
        user.image = data["access_token.info.image"]
        user.location = data["location[:name]"]
      end
    end
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user
    else # Create a user with a stub password.
      u = User.create!(:email => data.email, :password => Devise.friendly_token[0,20], :name => data.name,:gender => data.gender, :location => data.location[:name], :image => access_token.info.image)
      # This is needed becase facebook_id is a protected attribute
      u.facebook_id = data.id
      u.save
      user
    end
  end



end

