Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "my_devise/registrations"}

  root "static_pages#show", page: "home"
  resources :users, only: :show
end
