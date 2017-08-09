Rails.application.routes.draw do

  resources :posts do
    resources :comments
  end
  post '/posts/:post_id/raites(.:format)', to: 'raites#create'
  get 'tags/:tag', to: 'posts#index', as: :tag
  resources :posts
  root to: 'posts#index'

  root 'posts#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
