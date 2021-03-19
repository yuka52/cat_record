Rails.application.routes.draw do
  root to: 'cats#index'
  resources :cats, only: [:new, :create] do
    resources :healths, only: [:new, :create]
  end
end
