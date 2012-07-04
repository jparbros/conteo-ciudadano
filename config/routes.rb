Conteo::Application.routes.draw do

  devise_for :users
  devise_for :admins, :controllers => { :sessions => "admin/sessions" }

  root :to => 'home#index'

  match '/api', to: 'home#api'

  match '/&fref=fb', to: 'home#index'
  match '/auth/:provider/callback', to: 'authentications#create'

  match '/casillas/:estado/:section', to: 'buscar_casillas#show', as: 'buscar_casillas_show'
  match '/casillas/buscar', to: 'buscar_casillas#new', via: :get


  resource :buscar_casillas, only: [:new, :show, :create], path: '/casillas/buscar'

  resources :exit_polls, only: :create
  resources :casillas, only: [:show, :update, :create] do
    resources :tickets, only: [:create], path: '/tickets/new'
  end

  resources :faltantes, only: [:index]

  match '/faltantes/:estado', to: 'faltantes#show', as: 'faltante'
  match '/faltantes/:estado/:page', to: 'faltantes#show', as: 'faltante'

  match '/verificacion', to: 'verificacion#show', as: 'verificacion'
  match '/verificacion/:id', to: 'verificacion#update', as: 'verificacion', via: :put

  namespace :admin do
    root to: 'panel#index'
    resources :verifications, only: :index
    resources :boxes do
      resource :results, only: [:show, :update, :create]
    end

    resources :result_images, only: :update

    resources :admins
    resources :tickets, only: [:index, :create, :update, :destroy]
  end

  namespace :api do
    resources :casillas, only: [:index, :show]
  end

  mount Resque::Server.new, :at => "/resque"
  match '/images/logo-desktop.png' => redirect('/assets/main-img.png')
end