Conteo::Application.routes.draw do

  devise_for :users
  devise_for :admins, :controllers => { :sessions => "admin/sessions" }

  root :to => 'home#index'

  match '/api', to: 'home#api'

  match '/&fref=fb', to: 'home#index'
  match '/auth/:provider/callback', to: 'authentications#create'

  resource :buscar_casillas, only: [:new,  :show, :create], path: '/casillas/buscar'

  match '/casillas/:estado/:section', to: 'buscar_casillas#show', as: 'buscar_casillas_show'

  resources :casillas, only: [:show, :update] do
    resources :tickets, only: [:create], path: '/tickets/new'
  end

  #match '/casillas/:id' => 'casillas#update', via: :post

  namespace :admin do
    root to: 'panel#index'
    resources :verifications, only: :index
    resources :boxes do
      resource :results, only: [:show, :update, :create]
    end

    resources :admins
    resources :tickets, only: [:index, :create, :update, :destroy]
  end

  namespace :api do
    resources :casillas, only: [:index, :show]
  end

end