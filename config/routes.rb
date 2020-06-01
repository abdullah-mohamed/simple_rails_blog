Rails.application.routes.draw do
  
  get 'welcome/index'

  resources :users
  resources :articles do
    resources :comments
  end

  #get 'about', to: 'pages#about'

  get 'signup', to: "users#new"

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
