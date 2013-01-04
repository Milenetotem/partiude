class RoutesController < ApplicationController

  def index
  end

  def new
    @route = Route.new
    render "_form"
  end

  def create
    render "index"
  end
end
