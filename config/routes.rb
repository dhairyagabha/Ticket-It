TicketIt::Engine.routes.draw do
  root to:'tickets#index'

  resources :tickets do
    collection do
      get :dashboard
      get :kanban
    end
    member do
      get :public
    end
  end
  resources :comments
  resources :reporters
end
