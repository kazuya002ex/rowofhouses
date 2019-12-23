class Api::StillsController < ApplicationController

  def index
    @todo = Todo.where(user_id: session[:user_id]).order("valid_date ASC")
    @todo = @todo.order("deadline ASC")
    render json: @todo
  end
end
