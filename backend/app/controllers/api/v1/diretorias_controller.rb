module Api
  module V1
    class DiretoriasController < ApplicationController
      before_action :set_diretoria, only: [:show, :update, :destroy]

      def index
        @diretorias = Diretoria.all
        render json: @diretorias
      end

      def show
        render json: @diretoria
      end

      def create
        @diretoria = Diretoria.new(diretoria_params)
        if @diretoria.save
          render json: @diretoria, status: :created
        else
          render json: { errors: @diretoria.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @diretoria.update(diretoria_params)
          render json: @diretoria
        else
          render json: { errors: @diretoria.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @diretoria.destroy
        head :no_content
      end

      private

      def set_diretoria
        @diretoria = Diretoria.find(params[:id])
      end

      def diretoria_params
        params.require(:diretoria).permit(:nome, :ra, :curso, :cargo, :idade, :disponibilidade, :mandato_inicio, :mandato_fim, :senha_hash)
      end
    end
  end
end
