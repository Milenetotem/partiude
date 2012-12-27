class ApplicationController < ActionController::Base
  protect_from_forgery

  cache_sweeper :profile_sweeper
  helper :all

 # before_filter :authenticate_user!

  respond_to :html, :json, :xml, :js, :text, :pdf

end
