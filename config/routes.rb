Rails.application.routes.draw do
  root 'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # resources :users do
  #   member do
  #     get :following
  #     get :followers
  #   end
  # end

  # member以下のルーティング
  scope '/users' do
    get '/:id/following', to: 'users#following', as: :following_user
    get '/:id/followers', to: 'users#followers', as: :followers_user
  end

  # resources :users　で作成されるルーティング。asはヘルパー作成
  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  get '/users/new', to: 'users#new', as: :new_user
  get '/users/:id/edit', to: 'users#edit', as: :edit_user
  get '/users/:id', to: 'users#show', as: :user
  patch '/users/:id', to: 'users#update'
  put '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]

end
