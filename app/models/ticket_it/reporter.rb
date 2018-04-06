module TicketIt
  class Reporter < ApplicationRecord
    validates_uniqueness_of :email
  end
end
