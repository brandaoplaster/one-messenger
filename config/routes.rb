Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  resources :contacts, only: %i(index new create destroy)
end
