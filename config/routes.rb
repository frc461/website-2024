Rails.application.routes.draw do
  resources :dashboard, only: :index do
    get :settings, on: :collection
  end
  resources :page_categories, except: :show
  resources :pages
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
end
