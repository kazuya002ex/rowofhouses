class ApplicationController < ActionController::API
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized


  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  private

    # def current_user
    #   @current_user ||= User.find(payload['user_id'])
    # end

    def not_authorized
      render json: { error: 'Not Authorized' }, status: :unauthorized
    end
end
