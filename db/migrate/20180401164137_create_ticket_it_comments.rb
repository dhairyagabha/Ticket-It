class CreateTicketItComments < ActiveRecord::Migration[5.1]
  def change
    create_table :ticket_it_comments do |t|
      t.references :commenter, polymorphic: true
      t.references :commentable, polymorphic: true
      t.text :content

      t.timestamps
    end
  end
end
