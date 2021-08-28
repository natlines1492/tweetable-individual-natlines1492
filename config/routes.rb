Rails.application.routes.draw do
  devise_for :users
  resources :tweets do
    resources :comments
  end
  root to: 'tweets#index'
end
