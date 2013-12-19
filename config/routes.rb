RubyCbEsBrowser::Application.routes.draw do
  #get "/test/:op" => 'serve#test'

  put  "/incr/:key/create" => 'serve#incr', defaults: { amount: 1, create: true } 
  put  "/incr/:key(/:amount)" => 'serve#incr', defaults: { amount: 1, create: false } 
  put  "/incr/:key(/:amount)/create" => 'serve#incr', defaults: { amount: 1, create: true } 
  put  "/:bucket/incr/:key/create" => 'serve#incr', defaults: { amount: 1, create: true }
  put  "/:bucket/incr/:key(/:amount)" => 'serve#incr', defaults: { amount: 1, create: false }

  put  "/decr/:key/create" => 'serve#decr', defaults: { amount: 1, create: true } 
  put  "/decr/:key(/:amount)" => 'serve#decr', defaults: { amount: 1, create: false } 
  put  "/decr/:key(/:amount)/create" => 'serve#decr', defaults: { amount: 1, create: true } 
  put  "/:bucket/decr/:key/create" => 'serve#decr', defaults: { amount: 1, create: true }
  put  "/:bucket/decr/:key(/:amount)" => 'serve#decr', defaults: { amount: 1, create: false }
  
  post "/:bucket/a/:key" => 'serve#add'
  put "/:bucket/s/:key" => 'serve#set'
  put "/:bucket/r/:key" => 'serve#replace'

  delete "/:bucket/:key" => 'serve#delete'
  delete "/:key" => 'serve#delete'
  
  get  "/:key" => 'serve#get'
  get  "/:bucket/:key" => 'serve#get'
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
