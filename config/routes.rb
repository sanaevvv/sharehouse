Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'top#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # root 'rooms#index'

  resources :rooms, only: %i[index show] do
    resource :room_contact, only: %i[new create]
    resource :management_companies, only: %i[new create]
    resources :photos, except: :show
    resource :bookmarks, only: %i[create destroy]
    resources :reviews, only: %i[index new create show] do
      resources :comments, only: %i[create update destroy edit]
      resource :favorites, only: %i[create destroy]
    end
  end

  namespace 'admin' do
    resources :rooms, except: :show do
      resource :management_companies
      resources :photos, except: :show
    end
    resources :users
  end

  resources :users, except: :index do
    # resource :follows, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
    post 'follow/:id' => 'relationships#follow', as: 'follow'
    delete 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
    resources :relationships, only: %i[create destroy]
  end

end
