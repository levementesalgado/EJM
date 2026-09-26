module Api
  module V1
    class AreaAtuacoesController < ApplicationController
      before_action :set_area_atuacao, only: [:show, :update, :destroy]

      def index
        @area_atuacoes = AreaAtuacao.all
        render json: @area_atuacoes
      end

      def show
        render json: @area_atuacao
      end

      def create
        @area_atuacao = AreaAtuacao.new(area_atuacao_params)
        if @area_atuacao.save
          render json: @area_atuacao, status: :created
        else
          render json: { errors: @area_atuacao.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @area_atuacao.update(area_atuacao_params)
          render json: @area_atuacao
        else
          render json: { errors: @area_atuacao.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @area_atuacao.destroy
        head :no_content
      end

      private

      def set_area_atuacao
        @area_atuacao = AreaAtuacao.find(params[:id])
      end

      def area_atuacao_params
        params.require(:area_atuacao).permit(:nome, :descricao)
      end
    end
  end
end
