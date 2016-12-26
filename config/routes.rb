Rails.application.routes.draw do
  resources :sessions, except: [:index, :update, :show, :destroy]
  resources :users
  resources :schools
  resources :school_districts

  post '/account_activations', to: 'account_activations#activate'

  get '/status', to: 'sessions#status'
  delete '/sessions', to: 'sessions#destroy'

  get '/schools/domains/:domain', to: 'schools#show_domain', constraints: { domain: /[^\/]+/ }
end
