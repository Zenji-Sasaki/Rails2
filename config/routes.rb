Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'rooms#home'
  get 'rooms/post'
  post 'reservations/new'

  resources :rooms do
    collection do
      get 'search'
    end
  end
  resources :users
  resources :reservations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
