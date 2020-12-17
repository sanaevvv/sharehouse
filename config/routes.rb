Rails.application.routes.draw do

  get 'bookmarks/create'
  get 'bookmarks/destroy'
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

resources :users, only: %i[show new create edit update destroy] do
    resource :favorites, only: %i[create destroy]
    resource :bookmarks, only: %i[create destroy]
    member do
      get :following, :followers
    end
end



# resources :profiles, only: %i[show new edit create update]
#   resources :posts


 resources :relationships, only: [:create, :destroy]

end
