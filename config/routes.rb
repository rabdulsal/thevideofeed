Thevideofeed::Application.routes.draw do

  root :to => 'home#index'

  match 'feed' => 'feed_items#index', :as => :feed
  resources :posts, :only => [:new, :create]
  resources :users, :only => [:new, :create]
  resources :videos, :only => [:index, :show]

  # devise routes
  #     new_user_session GET  /users/sign_in                 {:controller=>"devise/sessions", :action=>"new"}
  #         user_session POST /users/sign_in                 {:controller=>"devise/sessions", :action=>"create"}
  # destroy_user_session GET  /users/sign_out                {:controller=>"devise/sessions", :action=>"destroy"}
  #                      POST /users/password(.:format)      {:controller=>"devise/passwords", :action=>"create"}
  #        user_password PUT  /users/password(.:format)      {:controller=>"devise/passwords", :action=>"update"}
  #    new_user_password GET  /users/password/new(.:format)  {:controller=>"devise/passwords", :action=>"new"}
  #   edit_user_password GET  /users/password/edit(.:format) {:controller=>"devise/passwords", :action=>"edit"}
  #                      GET  /users/unlock(.:format)        {:controller=>"devise/unlocks", :action=>"show"}
  #          user_unlock POST /users/unlock(.:format)        {:controller=>"devise/unlocks", :action=>"create"}
  #      new_user_unlock GET  /users/unlock/new(.:format)    {:controller=>"devise/unlocks", :action=>"new"}
  devise_for :users

  # /admin
  namespace :admin do
    root :to => 'home#index'
  end

  # /1-rickroll-d (videos always start with a number)
  match ':id' => 'videos#show', :constraints => { :id => /\d.+/ }, :as => :video

  # /trevor (users never start with a number)
  match ':id' => 'users#show', :as => :user
  match ':id/follow' => 'users#follow', :via => :post, :as => :user_follow
  match ':id/unfollow' => 'users#unfollow', :via => :post, :as => :user_unfollow

end
