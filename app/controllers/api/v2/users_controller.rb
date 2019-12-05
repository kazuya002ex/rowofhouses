class Api::V2::UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    pp @user
    pp @user
    pp @user
    #  render json: @user
    puts "ユーザー情報を保存しました！"
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
