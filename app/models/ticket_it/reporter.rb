module TicketIt
  class Reporter < ApplicationRecord
    has_many :tickets, foreign_key: :ticket_it_reporter_id
    validates_uniqueness_of :email
  end
end
