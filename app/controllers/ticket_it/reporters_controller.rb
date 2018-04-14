require_dependency "ticket_it/application_controller"

module TicketIt
  class ReportersController < ApplicationController

    def index
      @reporters = Reporter.all
    end

    def new
      @reporter = Reporter.new
    end

    def create
      @reporter = Reporter.new(reporter_params)
      respond_to do |format|
        if @reporter.save
          format.html{redirect_to @reporter, notice: 'Reporter enlisted successfully!'}
          format.js{}
          format.json {render @reporter.to_json, status: :created, location: @reporter}
        else
          format.html { render :new }
          format.js{}
          format.json { render json: @reporter.errors, status: :unprocessable_entity }
        end
      end
    end

    def show
      @reporter = Reporter.left_joins(:tickets).find(params[:id])
    end

    def edit
      @reporter = Reporter.find(params[:id])
    end

    def update
      @reporter = Reporter.find(params[:id])
      respond_to do |format|
        if @reporter.update!(reporter_params)
          format.html{redirect_to @reporter, notice: 'Reporter updated successfully!'}
          format.js{}
          format.json {render @reporter.to_json, status: :updated, location: @reporter}
        else
          format.html { render :new }
          format.js{}
          format.json { render json: @reporter.errors, status: :unprocessable_entity }
        end
      end
    end

    private
    def reporter_params
      params.require(:reporter).permit(:name, :email, :phone, :organization, :position, :notes)
    end

  end
end
