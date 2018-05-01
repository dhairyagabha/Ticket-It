module TicketIt
  class Ticket < ApplicationRecord
    belongs_to :resource, class_name: TicketIt.resource_class, optional: true
    has_secure_token :public_token
    has_many :comments, as: :commentable
    belongs_to :ticket_it_reporter, class_name: 'TicketIt::Reporter', optional: true
    validates_uniqueness_of :number, :public_token
    validates_presence_of :name, :status
    accepts_nested_attributes_for :ticket_it_reporter
    has_many :attachments, class_name: 'TicketIt::Attachment', as: :attachable

    after_create_commit :ticket_created
    after_update_commit :ticket_updated

    def ticket_priorities
      TicketIt.ticket_priorities || %w(high critical blocker low)
    end

    def ticket_types
      TicketIt.ticket_types || []
    end

    def ticket_status
      TicketIt.ticket_status || %w(new work_in_progress quality_check closed)
    end

    def ticket_contact
      TicketIt.ticket_contact || %w(email phone)
    end

    def self.metrics_by_status
      statuses = {}
      statuses["all"] = Ticket.status_filters(nil).count
      (TicketIt.ticket_status || %w(new work_in_progress quality_check closed)).each do |status|
        statuses["#{status}"] = Ticket.status_filters(status).count
      end
      return statuses
    end

    scope :status_filters, -> (status) {
      if status
        where(status: status)
      else
        all
      end
    }

    private
    def ticket_created
      if self.ticket_it_reporter
        TicketsMailer.new_ticket(self).deliver_later
      end
    end

    def ticket_updated
      if self.ticket_it_reporter
        TicketsMailer.ticket_update(self).deliver_later
      end
    end

  end
end
