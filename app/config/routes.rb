Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  devise_for :users
  get 'revenue/', to: 'revenue#index'
  get 'revenue/download', to: 'revenue#download'
end
