Rails.application.routes.draw do
  resources :providers, only: [:index, :new, :create, :show] do
    member do
      get 'confirm'
    end

    resources :events, only: [:index, :new, :create, :show]
  end

  root to: 'providers#new'
end
