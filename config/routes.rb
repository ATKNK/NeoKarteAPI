Rails.application.routes.draw do
  resources :rulers
  resources :flags
  resources :people
  resources :capitals
  resources :political_eras
  resources :dynasties
  resources :government_types

  get "countries/:tag", to: "countries#show_by_tag", constraints: { tag: /[A-Z]+/ }
  get "countries/:tag/political_eras", to: "political_eras#index_by_tag", constraints: { tag: /[A-Z]+/ }
  get "countries/:tag/political_eras/show_by_year", to: "political_eras#show_by_year", constraints: { tag: /[A-Z]+/ }

  resources :countries, only: %i[ index show create update destroy ] do
    resources :political_eras, only: [:index] do
      get "show_by_year", to: 'political_eras#show_by_year', on: :collection
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
