Rails.application.routes.draw do
  resources :stocks, only: [:index, :show]
  root to: 'stocks#index'
  devise_for :users, controllers: {
    confrimations: 'confirmations'
  } do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end
   
  resources :users 

  resources :balance, only: [:show] do
    member do
      get 'deposit'
      get 'withdraw'
      patch 'confirm_deposit'
      patch 'confirm_withdrawal'
    end
  end
  resources :pending_requests
  resources :declined_requests

end
