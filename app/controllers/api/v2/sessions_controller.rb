class Api::V2::SessionsController < ApplicationController
  
  def login
    @user = User.find_by(name: params[:session][:name])
    @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
  end

  def logout
    session[:user_id] = nil
  end
end
