Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  get 'tags/:tag', to: 'posts#index', as: :tag
  resources :posts
  root to: 'posts#index'

  root 'posts#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
