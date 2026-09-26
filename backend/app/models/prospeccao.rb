class Prospeccao < ApplicationRecord
  belongs_to :cliente

  validates :status, inclusion: { in: %w[pendente analisando convertido perdido] }
end
