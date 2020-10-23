Rails.application.routes.draw do
  devise_for :users
  resources :books do
    resources :comments
  end
  get '/dashboard' => 'dashboard#index', as: :user_root
  get '/comments/:id', to: 'comments#show', as: 'comment'
  resources :users, only: [:show]
  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
