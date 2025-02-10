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
  
  resources :projects do
    resources :project_threads do
      resources :messages, only: [:create, :edit, :update, :destroy]
    end
  end
  
  
  

  # my route for user management
  namespace :admin do
    resources :users, only: [:index, :edit, :update] do
      member do
        patch :update_role
      end
    end
  end

 
  get "home/about", to: "home#about"
  get "up" => "rails/health#show", as: :rails_health_check
end
