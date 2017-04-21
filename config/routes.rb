Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :shits do 
    resources :comments, only: [:create, :destroy]
    resource :like, only: [:create, :destroy]
  end

  root 'shits#index'

end
