class Colaborador < ApplicationRecord
  has_many :prestador_servicos, dependent: :destroy
  has_many :projetos, through: :prestador_servicos

  validates :nome, presence: true
  validates :ra, presence: true, uniqueness: true
  validates :curso, presence: true

  def horas_restantes
    max_horas = 480 # Limite legal de horas (exemplo: 12h/semana * 40 semanas)
    max_horas - horas_aacc
  end
end
