Rails.application.routes.draw do
  root to: 'cats#index'
  resources :cats, only: [:new, :create] 
  resources :healths, only: [:new, :create]

end
