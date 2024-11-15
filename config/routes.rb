Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "welcome#index"

  get "about_us", to: "welcome#about"
  get "history", to: "welcome#history"
  get "news", to: "welcome#news"
  get "resources", to: "welcome#resources"

  # Errors routes
  match "/404", to: "errors#not_found", via: :all
  match "/418", to: "errors#teapot", via: :all
  match "/422", to: "errors#unprocessable_content", via: :all
  match "/500", to: "errors#internal_server", via: :all

  resources :dashboard, only: :index do
    collection do
      get :settings
      resources :audit_log, only: %i[ index show destroy ] do
        post "revert", to: "audit_log#revert", on: :member
      end
    end
  end

  get "search", to: "search#index"
  devise_for :users
  resources :users

  # HACK: extremely hacky way of routing, do not touch unless you want to experience lots of pain
  resources :pages
  resources :page_assets, only: %i[ index show destroy ] do
    post :upload_image, on: :collection
  end
  resources :page_templates do
    get "json", to: "page_templates#json", on: :member
  end

  resources :page_categories
  resources :page_categories, only: :none, path: "/" do
    get ":page_id", to: "pages#show", as: :page, on: :member
    # resources :pages, on: :member
  end
end
