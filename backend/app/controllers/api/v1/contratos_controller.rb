module Api
  module V1
    class ContratosController < ApplicationController
      before_action :set_projeto
      before_action :set_contrato, only: [:show, :update]

      def index
        @contratos = @projeto.contratos
        render json: @contratos
      end

      def show
        render json: @contrato
      end

      def create
        @contrato = @projeto.contratos.new(contrato_params)
        if @contrato.save
          render json: @contrato, status: :created
        else
          render json: { errors: @contrato.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @contrato.update(contrato_params)
          render json: @contrato
        else
          render json: { errors: @contrato.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_projeto
        @projeto = Projeto.find(params[:projeto_id])
      end

      def set_contrato
        @contrato = @projeto.contratos.find(params[:id])
      end

      def contrato_params
        params.require(:contrato).permit(:valor, :periodo_inicio, :periodo_fim, :clausulas, :status, :anexo_path)
      end
    end
  end
end
