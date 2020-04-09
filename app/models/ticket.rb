class Ticket < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type

  after_save :update_stats
  after_destroy :Update_stats2
  before_save :tickets_equal_venue_capacity


  private
    def update_stats
      es = self.ticket_type.event.event_stat
      es.tickets_sold +=1
    end
  private
    def update_stats2
      en = self.ticket_type.event.event_stat
      en.tickets_sold-=1
    end

  private
  def tickets_equal_venue_capacity
    e = self.ticket_type.event.event_stat
    f = self.ticket_type.event.event_venue
    if f.capacity < e.tickets_sold
      errors.add(:e.tickets_sold, "cant be grater than capacity")
    end
  end
end
