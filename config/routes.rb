Rails.application.routes.draw do
  resources :providers, only: [:new, :create, :show] do
    member do
      get 'confirm'
    end

    # resources :events, shallow: true
  end

  # resources :events, only: [] do
  #   resources :bookings, shallow: true
  # end

  root to: 'providers#new'
end
