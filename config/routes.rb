Thevideofeed::Application.routes.draw do |map|

  root :to => 'home#index'

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

  namespace :admin do
    root :to => 'home#index'
  end

end
