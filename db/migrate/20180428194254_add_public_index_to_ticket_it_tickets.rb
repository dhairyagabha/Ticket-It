class AddPublicIndexToTicketItTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :ticket_it_tickets, :public_token, :string
    add_index :ticket_it_tickets, :public_token
  end
end
