class Api::TodosController < ApplicationController
  before_action :set_todo, only: [:update, :destroy]

  def index
  	@todo = Todo.all.order("created_at DESC")
    render json: @todo
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = session[:user_id]
    pp @todo
    @todo.save
  	render json: @todo
  end

  def update
    @todo.done_time = Time.zone.now
  	@todo.update(todo_params)
  end

  def destroy
  	@todo.destroy
  end

  private

    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:body, :done, :valid_date, :deadline)
    end
end
