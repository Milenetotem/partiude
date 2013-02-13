class IndexController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index

  def index
    redirect_to itineraries_path if current_user.present?
  end

end
