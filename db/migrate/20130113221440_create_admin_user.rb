class CreateAdminUser < ActiveRecord::Migration
  def up
    User.create(:email => "admin@partiu.de", :password => "admin123", :password_confirmation => "admin123")
  end

  def down
    User.find_by_username("admin@partiu.de").delete
  end
end
