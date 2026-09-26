class Financeiro < ApplicationRecord
  belongs_to :projeto, optional: true

  validates :tipo, presence: true, inclusion: { in: %w[entrada saida despesa infraestrutura evento] }
  validates :valor, presence: true, numericality: { greater_than: 0 }
  validates :data, presence: true

  scope :entradas, -> { where(tipo: 'entrada') }
  scope :saidas, -> { where(tipo: %w[saida despesa infraestrutura evento]) }
  scope :por_periodo, ->(inicio, fim) { where(data: inicio..fim) }
end
