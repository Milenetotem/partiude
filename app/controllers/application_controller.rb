class ApplicationController < ActionController::Base
  include ErrorHandler

  protect_from_forgery

  helper :all

  before_filter :authenticate_user!

  respond_to :html, :json, :xml, :js, :text, :pdf


private
  def after_sign_in_path_for(resource)
    itineraries_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

end
