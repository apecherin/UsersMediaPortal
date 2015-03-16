Rails.application.routes.draw do
  devise_for :users
  resources :media_items

  root to: 'media_items#index'
end
