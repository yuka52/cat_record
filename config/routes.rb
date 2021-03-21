Rails.application.routes.draw do
  root to: 'cats#index'
  resources :cats, only: [:new, :create, :show, :edit, :update] 
  resources :healths, only: [:new, :create, :edit, :update, :destroy]

end
