class PollsController < ApplicationController

  def create
    params[:poll][:requestor] = current_user
    @poll = Poll.new(params[:poll])
    @poll.save
  end

end
