class Customer < ApplicationRecord
  has_many :orders
  has_many :tickets, through: :orders

  validate :email, presence:true, uniqueness:true
  validate :name, :lastname, presence:true
end
