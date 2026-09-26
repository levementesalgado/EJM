class Cliente < ApplicationRecord
  has_many :projetos, dependent: :destroy
  has_many :prospeccoes, dependent: :destroy

  validates :razao_social, presence: true
  validates :cnpj, presence: true, uniqueness: true
end
