Rails.application.routes.draw do
  root to: 'cats#index'
  resources :cats, only: [:new, :create]
end
