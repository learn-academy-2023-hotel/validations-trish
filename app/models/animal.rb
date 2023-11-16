class Animal < ApplicationRecord
  validates :name, :age, :phone, presence: true
  validates :name, length: { in: 2..20 } 
  validates :phone, uniqueness: true
end
