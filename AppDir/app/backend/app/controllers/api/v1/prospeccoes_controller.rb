module Api
  module V1
    class ProspeccoesController < ApplicationController
      before_action :set_prospeccao, only: [:show, :update, :analisar]

      def index
        @prospeccoes = Prospeccao.includes(:cliente).all
        render json: @prospeccoes, include: [:cliente]
      end

      def show
        render json: @prospeccao, include: [:cliente]
      end

      def create
        @prospeccao = Prospeccao.new(prospeccao_params)
        if @prospeccao.save
          render json: @prospeccao, status: :created
        else
          render json: { errors: @prospeccao.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @prospeccao.update(prospeccao_params)
          render json: @prospeccao
        else
          render json: { errors: @prospeccao.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def analisar
        # TODO: Integrar com Rust service via gRPC para análise ML
        render json: { message: "Análise ML será processada pelo Rust service" }
      end

      private

      def set_prospeccao
        @prospeccao = Prospeccao.find(params[:id])
      end

      def prospeccao_params
        params.require(:prospeccao).permit(:cliente_id, :tags, :noticias, :periodo_contrato, :status, :observacoes_ml)
      end
    end
  end
end
