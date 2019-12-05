class Api::V2::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
     render json: @user
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
