class PrestadorServico < ApplicationRecord
  belongs_to :colaborador
  belongs_to :projeto

  validates :horas_alocadas, presence: true, numericality: { greater_than: 0 }
  validate :horas_nao_excedem_limite

  private

  def horas_nao_excedem_limite
    return unless colaborador
    total_horas = colaborador.prestador_servicos.sum(:horas_alocadas) + (horas_alocadas || 0)
    if total_horas > colaborador.horas_disponiveis
      errors.add(:horas_alocadas, "excede o limite de horas disponível")
    end
  end
end
