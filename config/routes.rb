Rails.application.routes.draw do
  root to: 'tweets#index'
  devise_for :users
  resources :tweets do
    resources :comments
  end
  #{}root to: 'tweets#index'
end
