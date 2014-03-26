Openblocks::Application.routes.draw do

  get '/dashboards/index' => 'dashboards#index', :as => 'dashboards'
  get '/dashboards/new' => 'dashboards#new', :as => 'new_dashboard'  
  get '/dashboards/:id' => 'dashboards#show', :as => 'dashboard'
  post '/dashboards/index' => 'dashboards#create'
  get '/dashboards/:id/edit' => 'dashboards#edit', :as => 'edit_dashboard'
  patch '/dashboards/:id' => 'dashboards#update'
  delete '/dashboards/:id/delete' => 'dashboards#destroy', :as => 'delete_dashboard'



  delete '/dashboards/:dashboard_id/spots/:id' => 'dashboard_spots#delete', :as => 'delete_dashboard_spot'

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
