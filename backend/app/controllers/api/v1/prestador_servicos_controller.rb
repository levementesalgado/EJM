module Api
  module V1
    class PrestadorServicosController < ApplicationController
      before_action :set_prestador_servico, only: [:show, :update, :destroy]

      def index
        @prestador_servicos = PrestadorServico.includes(:colaborador, :projeto).all
        render json: @prestador_servicos, include: [:colaborador, :projeto]
      end

      def show
        render json: @prestador_servico, include: [:colaborador, :projeto]
      end

      def create
        @prestador_servico = PrestadorServico.new(prestador_servico_params)
        if @prestador_servico.save
          render json: @prestador_servico, status: :created
        else
          render json: { errors: @prestador_servico.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @prestador_servico.update(prestador_servico_params)
          render json: @prestador_servico
        else
          render json: { errors: @prestador_servico.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @prestador_servico.destroy
        head :no_content
      end

      private

      def set_prestador_servico
        @prestador_servico = PrestadorServico.find(params[:id])
      end

      def prestador_servico_params
        params.require(:prestador_servico).permit(:colaborador_id, :projeto_id, :horas_alocadas, :data_inicio, :data_fim)
      end
    end
  end
end
