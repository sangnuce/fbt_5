Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "my_devise/registrations",
    omniauth_callbacks: "callbacks#create"}

  root "static_pages#show", page: "home"

  namespace :admin do
    resources :users
  end

  resource :user, only: :show
  resources :tours, only: :show do
    resources :reviews, only: :show
  end

end
