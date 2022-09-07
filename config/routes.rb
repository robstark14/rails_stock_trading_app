Rails.application.routes.draw do
  resources :stocks, only: [:index, :show]
  root to: 'stocks#index'
  devise_for :users, controllers: {
    confrimations: 'confirmations'
  } do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end
   
  resources :users 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
