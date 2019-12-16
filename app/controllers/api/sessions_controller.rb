class Api::SessionsController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]
  # protect_from_forgery except: [:create, :destroy]

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      pp "これは@userの中身: #{@user}"
      payload = { user_id: @user.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login
      puts "-------------------------"
      pp "これはtokensの中身: #{tokens}"
      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens[:access],
                          httponly: true,
                          secure: Rails.env.production?)
      render json: { csrf: tokens[:csrf] }
    else
      not_authorized
    end
  end

  def destroy
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
    render json: :ok
  end

  private
  
    def not_found
      render json: { error: "Cannot find email/password combination" }, status: :not_found
    end
end
