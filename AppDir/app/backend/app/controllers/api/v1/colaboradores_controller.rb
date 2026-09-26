module Api
  module V1
    class ColaboradoresController < ApplicationController
      before_action :set_colaborador, only: [:show, :update, :destroy]

      def index
        @colaboradores = Colaborador.all
        render json: @colaboradores
      end

      def show
        render json: @colaborador
      end

      def create
        @colaborador = Colaborador.new(colaborador_params)
        if @colaborador.save
          render json: @colaborador, status: :created
        else
          render json: { errors: @colaborador.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @colaborador.update(colaborador_params)
          render json: @colaborador
        else
          render json: { errors: @colaborador.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @colaborador.destroy
        head :no_content
      end

      private

      def set_colaborador
        @colaborador = Colaborador.find(params[:id])
      end

      def colaborador_params
        params.require(:colaborador).permit(:nome, :ra, :curso, :periodo, :skills, :areas_interesse, :horas_aacc, :horas_disponiveis, :ativo)
      end
    end
  end
end
