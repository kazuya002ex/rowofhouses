class ApplicationController < ActionController::API
  # protect_from_forgery
  include JWTSessions::RailsAuthorization
  rescue_form JWTSessions::Errors::Unauthorized, with: :not_authorized

  private
  
  def current_user
    @current_user ||= User.find(payload['user_id'])
  end

  def not_authorized
    render json: { error: 'Not Authorized' }, status: :unauthorized
  end
end
