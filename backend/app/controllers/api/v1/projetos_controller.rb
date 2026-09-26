module Api
  module V1
    class ProjetosController < ApplicationController
      before_action :set_projeto, only: [:show, :update, :destroy, :aprovar, :reprovar, :alocar_prestador]

      def index
        @projetos = Projeto.includes(:cliente, :area_atuacoes)
        @projetos = @projetos.por_status(params[:status]) if params[:status].present?
        render json: @projetos, include: [:cliente, :area_atuacoes]
      end

      def show
        render json: @projeto, include: [:cliente, :area_atuacoes, :prestador_servicos, :contrato, :financeiros]
      end

      def create
        @projeto = Projeto.new(projeto_params)
        @projeto.data_criacao ||= Date.current
        if @projeto.save
          render json: @projeto, status: :created
        else
          render json: { errors: @projeto.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @projeto.update(projeto_params)
          render json: @projeto
        else
          render json: { errors: @projeto.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @projeto.destroy
        head :no_content
      end

      def aprovar
        if @projeto.update(status: 'aprovado')
          render json: @projeto
        else
          render json: { errors: @projeto.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def reprovar
        if @projeto.update(status: 'reprovado')
          render json: @projeto
        else
          render json: { errors: @projeto.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def alocar_prestador
        prestador = PrestadorServico.new(
          colaborador_id: params[:colaborador_id],
          projeto: @projeto,
          horas_alocadas: params[:horas_alocadas],
          data_inicio: params[:data_inicio],
          data_fim: params[:data_fim]
        )
        if prestador.save
          render json: prestador, status: :created
        else
          render json: { errors: prestador.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_projeto
        @projeto = Projeto.find(params[:id])
      end

      def projeto_params
        params.require(:projeto).permit(:titulo, :descricao, :cliente_id, :valor, :prazo, :status, :observacoes, area_atuacao_ids: [])
      end
    end
  end
end
