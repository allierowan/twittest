Rails.application.routes.draw do
  get resources :users, only: [:new, :create, :edit, :update] do
    get resources :posts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
