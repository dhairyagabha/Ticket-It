require "ticket_it/engine"

module TicketIt

  # Resource is who onws the tickets as assigner, Configure resource class name.
  mattr_accessor :resource_class

  # Ticket Priorities %w(high critical blocker low)
  mattr_accessor :ticket_priorities

  # Ticket Types %w(technical business billing permissions)
  mattr_accessor :ticket_types

  # Ticket Statuses %w(new work_in_progress quality_check closed) make sure it is in sequence
  mattr_accessor :ticket_status

  # Ticket Types %w(phone email)
  mattr_accessor :ticket_contact

  # Sign in url required for the accessing ticket_it in host app.
  mattr_accessor :sign_in_url

  def self.setup
    yield self
  end

end
