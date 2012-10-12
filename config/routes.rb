Thevideofeed::Application.routes.draw do
  root :to => 'videos#index'

  resources :people, only: :show
  resources :videos, only: :index

  resources :subscribers, only: :create
  get 'unsubscribe/:key', to: 'subscribers#destroy', as: :unsubscribe, key: /.*/
end
