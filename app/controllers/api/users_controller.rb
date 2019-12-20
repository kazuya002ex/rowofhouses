class Api::UsersController < ApplicationController

  def log_in(user)
    session[:user_id] = @user.id
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # log_in @user
      # payloadは、トークン自体に内包されるユーザー情報。ここではuser_idを内包させている。
      payload = { user_id: @user.id }
      pp "payload = #{payload}"
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login

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
