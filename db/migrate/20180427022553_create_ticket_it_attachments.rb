class CreateTicketItAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :ticket_it_attachments do |t|
      t.references :attachable, polymorphic: true, index: {name: 'index_ticket_it_attachments_on_attachable'}

      t.timestamps
    end
  end
end
