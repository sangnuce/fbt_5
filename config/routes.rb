Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  devise_for :users, controllers: {registrations: "my_devise/registrations",
    omniauth_callbacks: "callbacks#create"}

  root "static_pages#show", page: "home"
  post "/rate" => "rater#create", as: :rate

  namespace :admin do
    resources :users
    resources :bookings, only: [:index, :show, :update]
    resources :places, except: [:show]
    resources :tours
    resources :categories, only: [:index]
  end

  resource :user, only: :show
  resources :tours, only: [:index, :show] do
    resources :reviews, only: [:new, :create, :show] do
      resources :comments, only: :create

      get "comments/new/(:parent_id)", to: "comments#new", as: :new_comment
      get "comments/(:parent_id)", to: "comments#show", as: :show_sub_comment
    end
    resources :bookings, only: [:new, :create] do
    end
  end
  resources :payments, only: [:new, :create]
  resources :likes, only: [:create, :destroy]
end
