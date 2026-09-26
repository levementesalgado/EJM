class Projeto < ApplicationRecord
  belongs_to :cliente
  has_one :contrato, dependent: :destroy
  has_many :prestador_servicos, dependent: :destroy
  has_many :colaboradores, through: :prestador_servicos
  has_many :financeiros, dependent: :destroy
  has_many :projeto_areas, dependent: :destroy
  has_many :area_atuacoes, through: :projeto_areas

  validates :titulo, presence: true
  validates :status, inclusion: { in: %w[pendente aprovado reprovado em_andamento concluido cancelado] }

  scope :ativos, -> { where(status: %w[pendente aprovado em_andamento]) }
  scope :por_status, ->(status) { where(status: status) }
end
