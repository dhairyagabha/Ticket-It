TicketIt::Engine.routes.draw do
  root to:'tickets#index'

  resources :tickets do
    collection do
      get :dashboard
      get :kanban
    end
  end
  resources :comments
end
