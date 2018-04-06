class AddReporterToTicketItTickets < ActiveRecord::Migration[5.1]
  def change
    add_reference :ticket_it_tickets, :ticket_it_reporter, foreign_key: true
  end
end
