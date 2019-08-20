Rails.application.routes.draw do

  get 'reviews/new'
  get 'reviews/show'
  get 'reviews/edit'
  devise_for :users, controllers: {
  	sessions:  'users/sessions',
  	passwords: 'users/passwords',
  	registrations: 'users/registrations'
  }

  get 'users/:id/unregister' => 'users#unregister'
  resources :users, only: [:show, :edit, :update]
  resources :reviews

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
