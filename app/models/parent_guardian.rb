class ParentGuardian < ApplicationRecord
  has_and_belongs_to_many :clientes

  validates :parent_name, presence: true
  validates :cpf, presence: true, uniqueness: true
end