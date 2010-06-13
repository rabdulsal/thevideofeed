Thevideofeed::Application.routes.draw do |map|

  root :to => "home#index"

  # devise routes
  #       new_user_session GET    /users/sign_in                 {:action=>"new", :controller=>"devise/sessions"}
  #           user_session POST   /users/sign_in                 {:action=>"create", :controller=>"devise/sessions"}
  #   destroy_user_session GET    /users/sign_out                {:action=>"destroy", :controller=>"devise/sessions"}
  #                        POST   /users/password(.:format)      {:action=>"create", :controller=>"devise/passwords"}
  #          user_password PUT    /users/password(.:format)      {:action=>"update", :controller=>"devise/passwords"}
  #      new_user_password GET    /users/password/new(.:format)  {:action=>"new", :controller=>"devise/passwords"}
  #     edit_user_password GET    /users/password/edit(.:format) {:action=>"edit", :controller=>"devise/passwords"}
  #                        POST   /users(.:format)               {:action=>"create", :controller=>"devise/registrations"}
  #                        PUT    /users(.:format)               {:action=>"update", :controller=>"devise/registrations"}
  #      user_registration DELETE /users(.:format)               {:action=>"destroy", :controller=>"devise/registrations"}
  #  new_user_registration GET    /users/sign_up(.:format)       {:action=>"new", :controller=>"devise/registrations"}
  # edit_user_registration GET    /users/edit(.:format)          {:action=>"edit", :controller=>"devise/registrations"}
  #                        GET    /users/unlock(.:format)        {:action=>"show", :controller=>"devise/unlocks"}
  #            user_unlock POST   /users/unlock(.:format)        {:action=>"create", :controller=>"devise/unlocks"}
  #        new_user_unlock GET    /users/unlock/new(.:format)    {:action=>"new", :controller=>"devise/unlocks"}
  devise_for :users

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
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
