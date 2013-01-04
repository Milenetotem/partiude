class ApplicationController < ActionController::Base
  protect_from_forgery

  helper :all

 # before_filter :authenticate_user!

  respond_to :html, :json, :xml, :js, :text, :pdf

end
