class CreateTicketItReporters < ActiveRecord::Migration[5.1]
  def change
    create_table :ticket_it_reporters do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :organization
      t.text :notes
      t.string :position

      t.timestamps
    end
    add_index :ticket_it_reporters, [:name]
    add_index :ticket_it_reporters, [:email]
    add_index :ticket_it_reporters, [:phone]
    add_index :ticket_it_reporters, [:organization]
  end
end
