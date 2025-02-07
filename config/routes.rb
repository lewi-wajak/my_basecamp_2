Rails.application.routes.draw do
  resources :threads
  devise_for :users
  root 'home#index'

  resources :projects do
    resources :attachments, only: [:destroy], controller: "projects"
  end
  
  resources :projects do
    post 'create_attachment', on: :member
  end
  


  # Admin routes for user management
  namespace :admin do
    resources :users, only: [:index, :edit, :update] do
      member do
        patch :update_role
      end
    end
  end

  # Other routes
  get "home/about", to: "home#about"
  get "up" => "rails/health#show", as: :rails_health_check
end
