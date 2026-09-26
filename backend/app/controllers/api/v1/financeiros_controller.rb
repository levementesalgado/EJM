module Api
  module V1
    class FinanceirosController < ApplicationController
      before_action :set_projeto
      before_action :set_financeiro, only: [:show, :update]

      def index
        @financeiros = @projeto.financeiros
        render json: @financeiros
      end

      def show
        render json: @financeiro
      end

      def create
        @financeiro = @projeto.financeiros.new(financeiro_params)
        if @financeiro.save
          render json: @financeiro, status: :created
        else
          render json: { errors: @financeiro.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @financeiro.update(financeiro_params)
          render json: @financeiro
        else
          render json: { errors: @financeiro.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_projeto
        @projeto = Projeto.find(params[:projeto_id])
      end

      def set_financeiro
        @financeiro = @projeto.financeiros.find(params[:id])
      end

      def financeiro_params
        params.require(:financeiro).permit(:tipo, :valor, :descricao, :data, :categoria, :impostos, :descontos)
      end
    end
  end
end
