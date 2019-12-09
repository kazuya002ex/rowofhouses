class Api::V2::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    pp @user
    if @user.save
      # payloadはトークン自体に内包されるユーザー情報。ここではuser_idを内包させている。
      payload = { user_id: user.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login

      # set_cookieヘッダーに{ jwt_access = アクセストークン; httponly; secure; }をセットして送信
      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          httponly: true,
                          secure: Rails.env.production?)
      # LocalStorageに保存するためのCSRFトークンを返す
      render json: { csrf: tokens[:csrf] }
      puts "ユーザー情報を保存しました！"
    else
      render json: { error: user.errors.full_messages.join(' ') }, status: :unprocessable_entity
      puts "無理。"
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
