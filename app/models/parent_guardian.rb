class ParentGuardian < ApplicationRecord
  has_and_belongs_to_many :clientes

  accepts_nested_attributes_for :clientes

  validates :parent_name, presence: true
  validates :cpf, presence: true, uniqueness: true
end