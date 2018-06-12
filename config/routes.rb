Rails.application.routes.draw do

  namespace :users do
    get 'board_users/show'
    get 'board_users/index'
    get 'board_users/edit'
  end
  root 'users/boards#index'


  scope module: :users do
  	devise_for :users, controllers: {
		  sessions:      'users/users/sessions',
		  passwords:     'users/users/passwords',
		  registrations: 'users/users/registrations'
		}
    resources :users, only: [:show, :index, :destroy]
    resources :boards, only: [:show, :index, :new, :edit, :destroy, :create] do
      resource :board_users
    end
    resources :communities, only: [:show, :index, :new, :edit, :destroy]
  end


  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
