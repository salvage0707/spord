Rails.application.routes.draw do


  root 'users/boards#index'


  scope module: :users do
  	devise_for :users, controllers: {
		  sessions:      'users/users/sessions',
		  passwords:     'users/users/passwords',
		  registrations: 'users/users/registrations'
		}
    resources :users, only: [:show, :index, :destroy]
    resources :boards, only: [:show, :index, :new, :edit, :destroy, :create] do
      resources :board_users
      # 申請拒否
      patch 'board_users/:id/reject' => 'board_users#reject', as: "board_reject"
      get 'board_users/board_users/rejects' => 'board_users#reject_index', as: "board_rejects"
      patch 'board_users/:id/admit' => 'board_users#admit', as: "board_admit"
      get 'board_users/board_users/admits' => 'board_users#admit_index', as: "board_admits"
    end
    resources :communities, only: [:show, :index, :new, :edit, :destroy]
  end


  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
