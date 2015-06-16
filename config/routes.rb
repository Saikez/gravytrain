Rails.application.routes.draw do
  resources :providers, only: [:new, :create, :show]
end
