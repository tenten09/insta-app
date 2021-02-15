Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :users, only: [:show]
      resources :posts, only: [:index, :create, :update, :destroy]
    end
  end
end
