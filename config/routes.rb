Conteo::Application.routes.draw do

  devise_for :users

  devise_for :admins

  root :to => 'home#index'

  match '/results' => 'home#results'
  match '/search' => 'home#search'
  match '/nacional' => 'home#nacional'

  match '/auth/:provider/callback', to: 'authentications#create'

  resource :buscar_casillas, only: [:new,  :show, :create], path: '/casillas/buscar'

  match '/casillas/:estado/:section', to: 'buscar_casillas#show', as: 'buscar_casillas_show'

  resources :casillas, only: [:show, :update] do
    resources :map_tickets, only: [:create], path: '/tickets/mapa'
  end

  match '/casillas/:id' => 'casillas#update', via: :post

  namespace :admin do
    root to: 'panel#index'
    resources :boxes
    resources :admins
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end