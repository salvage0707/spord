Rails.application.routes.draw do

  root 'users/boards#index'


  scope module: :users do
  	devise_for :users, controllers: {
		  sessions:      'users/users/sessions',
		  passwords:     'users/users/passwords',
		  registrations: 'users/users/registrations'
		}
    resources :users, only: [:show, :index, :destroy]
    resources :boards, only: [:show, :index, :new, :edit, :destroy]
    resources :communities, only: [:show, :index, :new, :edit, :destroy]
  end


  devise_for :admins
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
