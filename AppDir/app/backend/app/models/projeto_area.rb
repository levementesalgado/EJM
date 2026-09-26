class ProjetoArea < ApplicationRecord
  belongs_to :projeto
  belongs_to :area_atuacao

  validates :projeto_id, uniqueness: { scope: :area_atuacao_id }
end
