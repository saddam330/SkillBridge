Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
get '/download_cv_pdf', to: 'users#download_pdf'
  # Defines the root path route ("/")
  # root "posts#index"
  resources :users, only: [:index, :show]
  resources :projects do
    resources :applications, only: [:new, :create]
  end
  resources :applications, only: [:index, :show, :update] do
    resources :feedbacks, only: [:new, :create]
  end

  resources :projects do
    get "applicants", to: "projects#applicants", as: :dashboard, on: :member
  end
  get "dashboard", to: "projects#dashboard", as: :dashboard


end
