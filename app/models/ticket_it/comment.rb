module TicketIt
  class Comment < ApplicationRecord
    belongs_to :commenter, polymorphic: true
    belongs_to :commentable, polymorphic: true

    validates_presence_of :content, :commentable, :commenter

  end
end
