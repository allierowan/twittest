Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :edit, :update, :show] do
    resources :posts, except: [:index]
    member do
      resources :users_posts, only: [:index]
    end
  end
  resources :posts, only: [:index]

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
