class EventVenue < ApplicationRecord
  has_many :events

  validate :name, :address, presence:true
  validate :capacity, numericality: {only_integer:true}
  validate :capacity, numericality: {grater_than_or_equal_to:10}
end
