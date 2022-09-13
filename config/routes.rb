Rails.application.routes.draw do
  root to: 'stocks#index'

  devise_for :users, controllers: {
    confrimations: 'confirmations'
  } do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end
   
  resources :users, only: [:index, :show, :edit, :update, :create, :new, :destroy] 
  # do
  #   member do
  #     delete 'destroy'
  #   end
  # end
  
  resources :balance, only: [:show] do
    member do
      get 'deposit'
      get 'withdraw'
      patch 'confirm_deposit'
      patch 'confirm_withdrawal'
    end
  end
  
  resources :portfolios do
    member do
      get 'buy'
      get 'sell'
      patch 'confirm_sell'
    end
  end
  
  resources :trader_transactions, only: [:index, :show]
  resources :transactions
  resources :stocks, only: [:index, :show]
  resources :pending_requests, only: [:index, :update]
  #  do
    # member do
      # patch 'update'
    # end
  # end
  resources :declined_requests, only: [:index, :destroy]
end
