
module TicketIt
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    before_action :ensure_user, if: :public_links

    def ensure_user
      unless ticketit_user
        redirect_to TicketIt.sign_in_url
      end
    end

    def public_links
      if action_name == 'public'
        false
      else
        true
      end
    end

  end
end
