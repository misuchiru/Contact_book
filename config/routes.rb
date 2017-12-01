Rails.application.routes.draw do
  devise_for :users
  root'chapters#index'
  resources :chapters
  resources :districts
  resources :contacts
end
