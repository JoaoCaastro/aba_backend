class Cliente < ApplicationRecord
  has_and_belongs_to_many :parent_guardians

  accepts_nested_attributes_for :parent_guardians

  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true
end