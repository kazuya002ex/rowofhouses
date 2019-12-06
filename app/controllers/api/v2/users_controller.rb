class Api::V2::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    pp @user
    if @user.save
      render json: @user
      puts "ユーザー情報を保存しました！"
    else
      puts "無理。"
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :password)
    end
end
