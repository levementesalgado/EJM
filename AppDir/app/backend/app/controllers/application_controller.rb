class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last
    if token
      decoded = JsonWebToken.decode(token)
      @current_diretor = Diretoria.find(decoded[:diretor_id])
    else
      render json: { error: 'Token não fornecido' }, status: :unauthorized
    end
  rescue => e
    render json: { error: 'Token inválido' }, status: :unauthorized
  end
end
