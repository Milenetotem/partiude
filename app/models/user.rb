class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ACCESSIBLE_ATTRIBUTES = [:email, :password, :password_confirmation,
                            :remember_me, :name, :last_name, :nickname, :address,
                            :city, :territory, :phone, :federal_id, :avatar]

  attr_accessible *ACCESSIBLE_ATTRIBUTES

  has_many :participants
  has_many :itineraries, :through  => :participants

  has_enumeration_for :subscription_mode, :create_helpers => true, :create_scopes => true
  has_attached_file :avatar, :styles => { :small => "32x32>", :thumb => "64x64>" }

  validates_attachment_size :avatar, :less_than => 2.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

  validates_presence_of :name
  validates_presence_of :last_name
  validates_presence_of :nickname
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :territory
  validates_presence_of :federal_id

  def admin?
   email.eql? "dev@partiu.de"
  end

end
