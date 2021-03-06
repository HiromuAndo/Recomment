Rails.application.routes.draw do

  namespace :admins do
    resources :reviews, only: [:edit, :update, :destroy, :index]
  end
  namespace :admins do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end
  
  devise_for :admins, controllers: {
    sessions:  'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
  	sessions:  'users/sessions',
  	passwords: 'users/passwords',
  	registrations: 'users/registrations'
  }

  get 'users/:id/unregister' => 'users#unregister'
  resources :users, only: [:show, :edit, :update]
  resources :reviews, only: [:new, :edit, :create, :update, :destroy, :index] do
    resource :favorites, only:[:create, :destroy]
  end
# 作品名から絞り込んだ時のルーティング
  get 'tags/:tag', to: 'reviews#index', as: :tag
  get 'admins/tags/:tag', to: 'admins/reviews#index', as: :admins_tag

  get 'howtouse' => 'reviews#howtouse'
  root 'reviews#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
