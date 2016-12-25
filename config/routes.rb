Rails.application.routes.draw do
  resources :sessions, except: [:index, :update, :show, :destroy]
  resources :users
  resources :schools
  resources :school_districts

  get '/status', to: 'sessions#status'
  delete '/status', to: 'sessions#destroy'

  get '/schools/domains/:domain', to: 'schools#show_domain', constraints: { domain: /[^\/]+/ }
end
