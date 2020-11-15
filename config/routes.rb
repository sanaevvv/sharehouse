Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'top#index'
    devise_for :users

  # root 'rooms#index'
  resources :rooms, only: %i[index show] do
    resources :reviews, only: %i[index create]
  end

  namespace 'admin' do
    resources :rooms
  end

end
