class Parent < ApplicationRecord
  belongs_to :client
  
  validates :parent_name, presence: true
  validates :cpf, presence: true, uniqueness: true
end