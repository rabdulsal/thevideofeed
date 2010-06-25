Thevideofeed::Application.routes.draw do |map|

  root :to => 'home#index'

  resources :posts, :only => [:new, :create]
  map.resources :users, :only => [:new, :create]
  resources :videos, :only => :show

  devise_for :users
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

  # /admin
  namespace :admin do
    root :to => 'home#index'
  end

  # https://rails.lighthouseapp.com/projects/8994-ruby-on-rails/tickets/4963
  # # /1-rick-roll-d -- videos to_param always starts with a number
  # match '/:id' => 'videos#show', :constraints => {:id => /\d/}, :as => :video
  #
  # # /trevor -- usernames can't start with a number
  # match '/:id' => 'users#show', :as => :user

  match '/videos/:id' => 'videos#show', :as => :video
  match '/users/:id' => 'users#show', :as => :user

end
