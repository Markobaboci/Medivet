Rails.application.routes.draw do
  get "font_test/index"
  get "button_test/index"
  devise_for :users
  root to: "pages#home"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
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
    resources :clinics, only: [:new, :create, :index, :show]
  end


  resources :clinics, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end

  resources :pets

  resources :bookings, except: [:new, :create] do
    resource :review, only: %i[new create edit update destroy]
  end
end
