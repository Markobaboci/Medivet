Rails.application.routes.draw do
  get "font_test/index"
  get "button_test/index"
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  get 'button_test', to: 'button_test#index'
  get 'font_test', to: 'font_test#index'

  # Nested resources
  resources :users do
    resources :clinics
  end

  resources :clinics, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end

  resources :pets

  resources :bookings, except: [:new, :create] do
    resource :review, only: %i[new create edit update destroy]
  end
end
