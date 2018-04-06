class CreateTicketItAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :ticket_it_addresses do |t|
      t.string :name
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.references :addressable, polmorphic: true

      t.timestamps
    end
  end
end
