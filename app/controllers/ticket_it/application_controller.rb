
module TicketIt
  class ApplicationController < ::ApplicationController
    include Devise::Controllers::Helpers
    protect_from_forgery with: :exception

    before_action :ensure_user

    def ensure_user
      unless ticketit_user
        redirect_to main_app.send(TicketIt.sign_in_url)
      end
    end

  end
end
