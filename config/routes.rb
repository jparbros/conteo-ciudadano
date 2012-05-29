Conteo::Application.routes.draw do

  get "home/index"
  
  match '/results' => 'home#results'
  match '/send' => 'home#enviar'
  match '/send-ok' => 'home#save_results', :via => :post
  match '/search' => 'home#search'
  match '/estado/:id' => 'home#state'
  match '/casilla/:id' => 'home#box'
  match '/nacional' => 'home#nacional'
  match '/get-municipalities' => 'home#get_municipalities'
  match '/admin' => 'panel#index'
  match '/admin/login' => 'user_sessions#new', :as =>  :login
  match '/admin/logout' => 'user_sessions#destroy', :as => :logout
  
  resources :boxes,:path=> "/admin/boxes"
  resources :municipalities,:path=> "/admin/municipalities"
  resources :users,:path=> "/admin/users"
  resources :states,:path=> "/admin/states"
  resources :panel,:path=> "/admin/panel"
  resources :user_sessions, :only=> [:new,:create,:destroy],:path=> "/admin/user_sessions"

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
   root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
