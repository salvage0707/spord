Rails.application.routes.draw do

  root 'users/boards#index'


  namespace :users do
    resources :users, only: [:show, :index, :destroy]
    resources :boards, only: [:show, :index, :new, :edit, :destroy]
  end
  get 'users/show'
  get 'users/destroy'
  get 'users/index'
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
