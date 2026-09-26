module Api
  module V1
    class AuthController < ApplicationController
      skip_before_action :authenticate_request, only: [:login, :criar_conta]

      def login
        diretor = Diretoria.find_by(ra: params[:ra])
        if diretor&.authenticate(params[:senha])
          token = JsonWebToken.encode(diretor_id: diretor.id)
          render json: { token: token, diretor: diretor.as_json(except: [:senha_hash]) }
        else
          render json: { error: 'RA ou senha inválidos' }, status: :unauthorized
        end
      end

      def criar_conta
        diretor = Diretoria.new(diretoria_params)
        diretor.senha = params[:senha]
        if diretor.save
          render json: diretor.as_json(except: [:senha_hash]), status: :created
        else
          render json: { errors: diretor.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def diretoria_params
        params.require(:diretoria).permit(:nome, :ra, :curso, :cargo, :idade, :disponibilidade, :mandato_inicio, :mandato_fim)
      end
    end
  end
end
