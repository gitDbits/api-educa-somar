class ApplicationController < ActionController::API
  def not_found
    render json: { error: I18n.t(url_not_found) }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue => ActiveRecord::RecordNotFound => e
      render json: { message e.message }, status: :unathorized
    rescue JWT::DecodeError => e
      render json: { message: I18n.t(:not_authorized_jwt) }, status: :unauthorized
    end
  end
end
