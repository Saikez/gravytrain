Rails.application.routes.draw do
  resources :providers, only: [:new, :create, :show]
  root to: 'providers#new'
end
