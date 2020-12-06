Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'top#index'
    devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # root 'rooms#index'
  resources :rooms, only: %i[index show] do
    resources :reviews, only: %i[index create] do
      resource :favorites, only: %i[create destroy]
    end
  end

  namespace 'admin' do
    resources :rooms
    resources :users
  end

post 'follow/:id' => 'relationships#follow', as: 'follow'
post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
resources :users, only: :show

end
