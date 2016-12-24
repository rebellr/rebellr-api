Rails.application.routes.draw do
  resources :sessions
  resources :users
  resources :schools
  resources :school_districts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
