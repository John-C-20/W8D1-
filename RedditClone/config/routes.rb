Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :index]

  resources :subs, except: [:destroy]
  
  resource :session, only: [:new, :create, :destroy]

  resources :posts, except: [:index] 
end
