class TicketType < ApplicationRecord
  belongs_to :event
  validate :ticket_price, numericality: {grater_than_or_equal_to:0}
end
