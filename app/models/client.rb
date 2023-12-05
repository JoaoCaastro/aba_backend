class Client < ApplicationRecord

  has_many :parents
  has_many :protocols
  
  accepts_nested_attributes_for :parents, allow_destroy: true
  
end