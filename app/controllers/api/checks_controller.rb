class Api::ChecksController < ApplicationController

  def index
    @todo = Todo.where(user_id: session[:user_id]).order("done_time DESC")
    render json: @todo
  end
end
