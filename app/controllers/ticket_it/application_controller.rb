
module TicketIt
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    before_action :ensure_user, unless: :public_links

    def ensure_user
      unless ticketit_user
        redirect_to TicketIt.sign_in_url
      end
    end

    def public_links
      if (action_name == 'public') || (controller_name == 'comments' && action_name == 'create')
        true
      else
        false
      end
    end

  end
end
