Rails.application.routes.draw do

  namespace :users do
    get 'my_sports/index'
  end
  get 'user_purposes/index'
  root 'users/boards#index'


  scope module: :users do
  	devise_for :users, controllers: {
		  sessions:      'users/users/sessions',
		  passwords:     'users/users/passwords',
		  registrations: 'users/users/registrations'
		}
    resources :users, only: [:show, :index, :destroy, :edit, :update]
    resources :user_purposes, only: [:index, :create, :update, :destroy]
    resources :my_sports, only: [:index, :create, :update, :destroy]
    resources :boards do
      resources :board_users
      # 申請拒否
      patch 'board_users/:id/reject' => 'board_users#reject', as: "board_reject"
      get 'board_users/board_users/rejects' => 'board_users#reject_index', as: "board_rejects"
      patch 'board_users/:id/admit' => 'board_users#admit', as: "board_admit"
      get 'board_users/board_users/admits' => 'board_users#admit_index', as: "board_admits"
    end
    resources :communities do
      resources :community_users
      # 申請拒否
      patch 'community_users/:id/reject' => 'community_users#reject', as: "community_reject"
      get 'community_users/community_users/rejects' => 'community_users#reject_index', as: "community_rejects"
      patch 'community_users/:id/admit' => 'community_users#admit', as: "community_admit"
      get 'community_users/community_users/admits' => 'community_users#admit_index', as: "community_admits"
    end
  end


  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
