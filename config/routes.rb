Rails.application.routes.draw do
  devise_for :users
  resources :tweets do
    resources :comments
  end
  get '/tweets/:id/comments', to: 'tweets#show'
  root to: 'tweets#index'
end
