module TicketIt
  class TicketsMailer < ApplicationMailer

    def new_ticket(ticket)
      @ticket = ticket
      if @ticket
        @reporter = @ticket.ticket_it_reporter
        @url = public_ticket_url(@ticket)
        yield new_ticket_edit if block_given?
        mail(to: @reporter.email, subject: 'Support request filed successfully!')
      end
    end

    def ticket_update(ticket)
      @ticket = ticket
      if @ticket
        @reporter = @ticket.ticket_it_reporter
        @url = public_ticket_url(@ticket)
        yield ticket_update_edit if block_given?
        mail(to: @reporter.email, subject: 'Your support request has been updated!')
      end
    end

  end
end
