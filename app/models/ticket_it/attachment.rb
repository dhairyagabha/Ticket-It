module TicketIt
  class Attachment < ApplicationRecord
    belongs_to :attachable, polymorphic: true
    has_attached_file :file
    do_not_validate_attachment_file_type :file
  end
end
