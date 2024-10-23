Rails.application.routes.draw do
  resources :page_assets, only: %i[ index show destroy ] do
    post :upload_image, on: :collection
  end
  get "search" => "search#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "welcome#index"

  resources :dashboard, only: :index do
    get :settings, on: :collection
  end

  # HACK: extremely hacky way of routing, do not touch unless you want to experience lots of pain
  resources :pages
  resources :page_categories
  resources :page_categories, except: %i[ index show new edit create update destroy ], path: "/" do
    get ":page_id", to: "pages#show", as: :page, on: :member
    # resources :pages, on: :member
  end
end
