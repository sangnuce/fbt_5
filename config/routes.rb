Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "my_devise/registrations",
    omniauth_callbacks: "callbacks#create"}

  root "static_pages#show", page: "home"

  namespace :admin do
    resources :users, except: :destroy
  end

  resources :users, only: :show
end
