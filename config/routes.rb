Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: :"callbacks#create"}

  root "static_pages#show", page: "home"

  namespace :admin do
    resources :users, only: :index
  end
end
