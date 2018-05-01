class AddAttachmentFileToAttachments < ActiveRecord::Migration[5.1]
  def self.up
    change_table :ticket_it_attachments do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :ticket_it_attachments, :file
  end
end
