Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :users, only: [:show, :index] do
    member do
      get 'follow'
    end
    resources :posts do 
      resources :comments, only: [:create, :new, :edit, :update]
    end
  end


end
