class AreaAtuacao < ApplicationRecord
  has_many :projeto_areas, dependent: :destroy
  has_many :projetos, through: :projeto_areas

  validates :nome, presence: true, uniqueness: true
end
