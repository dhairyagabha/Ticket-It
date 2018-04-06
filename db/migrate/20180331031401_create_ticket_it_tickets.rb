class CreateTicketItTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :ticket_it_tickets do |t|
      t.string :number
      t.string :status
      t.string :name
      t.text :description
      t.integer :resource_id
      t.string :ticket_type
      t.string :priority
      t.string :prefered_contact
      t.datetime :closed_at

      t.timestamps
    end
    add_index :ticket_it_tickets, [:number]
    add_index :ticket_it_tickets, [:status]
    add_index :ticket_it_tickets, [:name]
    add_index :ticket_it_tickets, [:priority]
    add_index :ticket_it_tickets, [:type]
    add_index :ticket_it_tickets, [:resource_id]
  end
end
