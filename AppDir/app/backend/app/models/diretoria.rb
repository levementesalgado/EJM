class Diretoria < ApplicationRecord
  has_secure_password

  has_many :projetos, dependent: :nullify

  validates :nome, presence: true
  validates :ra, presence: true, uniqueness: true
  validates :curso, presence: true
  validates :cargo, presence: true
end
