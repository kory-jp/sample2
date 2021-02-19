Rails.application.routes.draw do 
  # get 'favorites/create'
  # get 'favorites/destroy'
  get 'mypage', to: 'users#me'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :users
  resources :boards do
    resource :favorites, only: [:create, :destroy]
  end
  resources :comments, only: %i[create destroy]
end