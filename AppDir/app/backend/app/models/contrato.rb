class Contrato < ApplicationRecord
  belongs_to :projeto

  validates :status, inclusion: { in: %w[rascunho ativo finalizado cancelado] }
end
