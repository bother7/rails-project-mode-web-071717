Rails.application.routes.draw do
  resources :user_teams
  resources :matches
  resources :leagues
  resources :players
  resources :teams
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end