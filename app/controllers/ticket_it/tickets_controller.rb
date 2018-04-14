require_dependency "ticket_it/application_controller"

module TicketIt
  class TicketsController < ApplicationController

    def index
      @all_tickets = Ticket.all.order(created_at: :desc)
      @tickets = Ticket.where(resource_id: ticketit_user.id).order(created_at: :desc)
    end

    def new
      @ticket = Ticket.new
    end

    def create
      @ticket = Ticket.new(ticket_params)
      @ticket.resource_id = ticketit_user.id
      respond_to do |format|
        if @ticket.save
          format.html{ redirect_to @ticket, notice:'New ticket created successfully!'}
          #to use js reponse please create a response file at app/views/ticket_it/tickets/create.js.erb
          format.js{}
          format.json{render json: @ticket.to_json}
        else
          format.html{ render :new, notice:'Failed to create a ticket!'}
          #to use js reponse please create a response file at app/views/ticket_it/tickets/create.js.erb
          format.js{}
          format.json{render json: @ticket.to_json}
        end
      end
    end

    def show
      @ticket = Ticket.left_joins(:comments).find(params[:id])
    end

    def public
      @ticket = Ticket.left_joins(:comments).find(params[:id])
      render layout: false
    end

    def edit
      @ticket = Ticket.find(params[:id])
    end

    def update
      @ticket = Ticket.find(params[:id])
      respond_to do |format|
        if @ticket.update(ticket_params)
          format.html{ redirect_to @ticket, notice:'Ticket updated successfully!'}
          #to use js reponse please create a response file at app/views/ticket_it/tickets/create.js.erb
          format.js{render json: @ticket.to_json}
          format.json{render json: @ticket.to_json, status: :created, location: @ticket}
        else
          format.html{ render :edit, notice:'Failed to update a ticket!'}
          #to use js reponse please create a response file at app/views/ticket_it/tickets/create.js.erb
          format.js{}
          format.json{render json: @ticket.errors, status: :unprocessable_entity}
        end
      end
    end

    def dashboard
      @ticket_metrics = Ticket.metrics_by_status
    end

    def kanban
      @tickets = Ticket.where(resource_id: ticketit_user.id).group_by { |t| t.status }
    end

    def destroy
      # This method is intentionally left empty because a good workflow is not to delete a ticket
      # but rather close it by commenting stale ticket on it.
    end

    private
    def ticket_params
      params.require(:ticket).permit(:number, :status, :name, :description, :resource_id, :ticket_type, :priority, :prefered_contact, :closed_at, :ticket_it_reporter_id)
    end

  end
end
