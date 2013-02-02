class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ACCESSIBLE_ATTRIBUTES = [:email, :password, :password_confirmation,
                            :remember_me, :name, :lastname, :nickname, :address,
                            :city, :territory, :phone, :federal_id]

  attr_accessible *ACCESSIBLE_ATTRIBUTES

  has_many :itineraries
  has_enumeration_for :subscription_mode, :create_helpers => true, :create_scopes => true
  has_attached_file :avatar, :styles => { :small => "32x32>", :thumb => "64x64>" }

  validates_attachment_size :avatar, :less_than => 2.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

  def admin?
   email.eql? "dev@partiu.de"
  end

end
