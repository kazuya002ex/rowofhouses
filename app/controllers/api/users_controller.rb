class Api::UsersController < ApplicationController

  def log_in(user)
    session[:user_id] = @user.id
  end

  def create
    @user = User.new(user_params)
    if @user.save
      pp @user
      # payload = { user_id: user.id }
      # session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      # pp session
      # tokens = session.login
      log_in @user
      pp session[:user_id]
      render json: @user

      # set-cookieヘッダーに{ jwt_access = アクセストークン; secure; httponly }をセットして送信
      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          httponly: true,
                          secure: Rails.env.production?)
      # LocalStorageに保存するためのCSRFトークンを返す。
      render json: { csrf: tokens[:csrf] }
    else
      render json: { error: user.errors.full_messages.join(' ') }, status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.permit(:name, :password, :password_confirmation)
    end
end
