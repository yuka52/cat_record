Rails.application.routes.draw do
  root to: 'cats#index'
  resources :cats
  resources :healths, only: [:new, :create, :edit, :update, :destroy]

end
