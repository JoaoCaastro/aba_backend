class Cliente < ApplicationRecord
  has_and_belongs_to_many :parent_guardians

  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true
end