Rails.application.routes.draw do
  root'contacts#welcome'
  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :chapters
  resources :districts
  resources :contacts do
    collection do
      get :welcome
    end
  end
  resources :visits
  resources :users do
    member do
      post :to_confirm
      post :to_unconfirmed
      post :to_admin
      post :to_user
    end
  end
end
