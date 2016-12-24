Rails.application.routes.draw do
  resources :sessions
  resources :users
  resources :schools
  resources :school_districts

  get '/schools/domains/:domain', to: 'schools#show_domain', constraints: { domain: /[^\/]+/ }
end
