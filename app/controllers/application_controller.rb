class ApplicationController < ActionController::Base
  include ErrorHandler

  protect_from_forgery

  helper :all

  before_filter :authenticate_user!

  respond_to :html, :json, :xml, :js, :text, :pdf

end
