include RoleGuard

class ApplicationController < ActionController::API
  before_action :authenticate_request, unless: :devise_controller?

  attr_reader :current_user

  private

  def authenticate_request
    header = request.headers['Authorization']
    token  = header.split(' ').last if header.present?
    payload = JsonWebToken.decode(token)

    @current_user = User.find(payload[:user_id]) if payload&.dig(:user_id)
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end
end
